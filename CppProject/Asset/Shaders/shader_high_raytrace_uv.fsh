#define PI 3.14159265
#define up vec3(0.0, 0.0, 1.0)
#define RAY_SPECULAR 0
#define RAY_DIFFUSE 1
#define RAY_SUN 2

varying vec2 vTexCoord;

// Buffers
uniform sampler2D uDepthBuffer;
uniform sampler2D uNormalBuffer;
uniform sampler2D uMaterialBuffer;
uniform sampler2D uNoiseBuffer;

// Camera data
uniform mat4 uProjMatrix;
uniform mat4 uProjMatrixInv;
uniform float uNear;
uniform float uFar;
uniform vec2 uScreenSize;

uniform float uPrecision;
uniform float uThickness;
uniform float uNoiseSize;

uniform int uRayType; // 0 = Specular, 1 = Diffuse, 2 = Sun (Contact)
uniform vec3 uRayDirection;
uniform float uRayDistance;

// Unpacks depth value from packed color
float unpackDepth(vec4 c)
{
	return c.r + c.g / 255.0 + c.b / (255.0 * 255.0);
}

// Returns depth value from packed depth buffer
float getDepth(vec2 coords)
{
	return unpackDepth(texture2D(uDepthBuffer, coords));
}

// Transforms Z depth with camera data
float transformDepth(float depth)
{
	return (uFar - (uNear * uFar) / (depth * (uFar - uNear) + uNear)) / (uFar - uNear);
}

// Reconstruct a position from a screen space coordinate and (linear) depth
vec3 posFromBuffer(vec2 coord, float depth)
{
	vec4 pos = uProjMatrixInv * vec4(coord.x * 2.0 - 1.0, 1.0 - coord.y * 2.0, transformDepth(depth), 1.0);
	return pos.xyz / pos.w;
}

float unpackFloat2(float expo, float dec)
{
	return (expo * 255.0 * 255.0) + (dec * 255.0);
}

vec2 packFloat2(float f)
{
	return vec2(floor(f / 255.0) / 255.0, fract(f / 255.0));
}

// Get Normal Value
vec3 unpackNormal(vec4 c)
{
	return c.rgb * 2.0 - 1.0;
}

vec2 viewPosToPixel(vec4 viewPos)
{
	vec4 coord	= (uProjMatrix * viewPos);
	coord.xy	= (coord.xy / coord.w) * 0.5 + 0.5;
	coord.y		= 1.0 - coord.y;
	coord.xy	*= uScreenSize;
	
	return floor(coord.xy);
}

vec3 unpackNormalBlueNoise(vec4 c)
{
	return normalize(vec3(cos(c.r * 2.0 * PI), sin(c.r * 2.0 * PI), c.g));
}

// GGX importance sampling (https://learnopengl.com/PBR/IBL/Specular-IBL)
float VanDerCorput(int n, int base)
{
    float invBase = 1.0 / float(base);
    float denom   = 1.0;
    float result  = 0.0;
	
    for(int i = 0; i < 32; i++)
    {
        if(n > 0)
        {
            denom   = mod(float(n), 2.0);
            result += denom * invBase;
            invBase = invBase / 2.0;
            n       = int(float(n) / 2.0);
        }
    }
	
    return result;
}

vec2 Hammersley(int i, int N)
{
    return vec2(float(i)/float(N), VanDerCorput(i, 2));
}

vec3 sampleGGX(vec2 Xi, float roughness)
{
    float a = roughness * roughness;
    float phi = 2.0 * PI * Xi.x;
    float cosTheta = sqrt((1.0 - Xi.y) / (1.0 + (a * a - 1.0) * Xi.y));
    float sinTheta = sqrt(1.0 - cosTheta * cosTheta);
	
    return vec3(cos(phi) * sinTheta, sin(phi) * sinTheta, cosTheta);
}

// Ray tracer, returns hit coordinate
vec2 rayTrace(vec3 rayStart, vec3 rayDirection, float rayMaxDistance, float rayThickness)
{
	// Ray data
	vec4 rayStartPos    = vec4(rayStart, 1.0);
	vec4 rayEndPos      = vec4(rayStartPos.xyz + (rayDirection * rayMaxDistance), 1.0);
	float thickness		= rayThickness;
	
	// Clip to near camera plane
	if (rayEndPos.z < uNear)
		rayEndPos.xyz	= rayStartPos.xyz + (rayDirection * (rayStartPos.z - uNear));
	
	vec2 rayStartPixel  = viewPosToPixel(rayStartPos);
	vec2 rayEndPixel    = viewPosToPixel(rayEndPos);
	vec2 rayPixel       = rayStartPixel;
	vec2 rayUV          = rayPixel / uScreenSize;
	bool rayHit			= false;
	
	// Get pixel data for line tracing, swizzel to keep longest axis in X
	vec2 pixelDelta     = rayEndPixel - rayStartPixel;
	bool useDeltaY      = (abs(pixelDelta.y) > abs(pixelDelta.x));
	
	if (useDeltaY)
	{
		rayStartPixel = rayStartPixel.yx;
		pixelDelta = pixelDelta.yx;
		rayPixel = rayPixel.yx;
	}
	
	float stepDelta     = abs(pixelDelta.x) * uPrecision;
	vec2 pixelStepDelta = pixelDelta / max(stepDelta, 0.001);
	
	// Correct swizzel, UV coords needs to be correct
	vec2 uvStepDelta = (useDeltaY ? pixelStepDelta.yx : pixelStepDelta.xy) / uScreenSize;
	
	float progress, progressPrev;
	float viewDepth, sampleDepth, depth, depthPrev, dist;
	
	for (int i = 0; i < int(stepDelta); i++)
	{
		// Get previous progress for refining later
		progressPrev = progress;
		
		// Move forward
		rayPixel += pixelStepDelta;
		rayUV    += uvStepDelta;
		
		if (rayUV.x < 0.0 || rayUV.y < 0.0 || rayUV.x > 1.0 || rayUV.y > 1.0)
			break;
		
		// Get ray/scene depth
		progress    = clamp((rayPixel.x - rayStartPixel.x) / pixelDelta.x, 0.0, 1.0);
		viewDepth   = ((rayStartPos.z * rayEndPos.z) / mix(rayEndPos.z, rayStartPos.z, progress));
		sampleDepth = posFromBuffer(rayUV, getDepth(rayUV)).z;
		dist        = mix(rayStartPos, rayEndPos, progress).z;
		thickness   = rayThickness + (getDepth(rayUV) * 2048.0);
		
		depthPrev	 = sampleDepth;
		
		// Distance between ray Z and object Z
		depth = sampleDepth - viewDepth;
		
		// Negative depth, check for collision
		if (depth < 0.0 && depth > -thickness)
		{
			rayHit = true;
			break;
		}
	}
	
	// Don't need to refine, exit
	//if (uRayType == RAY_SUN)
	//	return (rayHit ? rayUV : vec2(2.0));
	
	// Invalid
	if (!rayHit || texture2D(uDepthBuffer, rayUV).a < 1.0)
		return vec2(2.0);
	
	// Refine ray UV
	const int refineSteps = 10;
	
	if (useDeltaY)
		rayStartPixel = rayStartPixel.yx;
	
	progress = progressPrev + ((progress - progressPrev) * 0.5);
	
	for (int j = 0; j < refineSteps; j++)
	{
		rayPixel  = mix(rayStartPixel, rayEndPixel, progress);
		rayUV     = rayPixel / uScreenSize;
		
		viewDepth   = ((rayStartPos.z * rayEndPos.z) / mix(rayEndPos.z, rayStartPos.z, progress));
		sampleDepth = posFromBuffer(rayUV, getDepth(rayUV)).z;
		dist        = mix(rayStartPos, rayEndPos, progress).z;
		thickness   = rayThickness + (getDepth(rayUV) * 2048.0);
		
		depth = sampleDepth - viewDepth;
		
		if (depth < 0.0 && depth > -thickness)
			progress = progressPrev + ((progress - progressPrev) * 0.5);
		else
		{
			float temp   = progress;
			progress     = progressPrev + ((progress - progressPrev) * 0.5);
			progressPrev = temp;
		}
	}
	
	// Didn't pass refine
	if (abs(depthPrev - sampleDepth) > thickness)
		return vec2(2.0);
	
	return rayUV;
}

void main()
{
	vec4 depthData		= texture2D(uDepthBuffer, vTexCoord);
	vec4 noiseData		= texture2D(uNoiseBuffer, vTexCoord * (uScreenSize / uNoiseSize));
	vec3 materialData	= vec3(0.0);
	
	if (depthData.a < 0.001)
		discard;
	
	if (uRayType == RAY_SPECULAR)
	{
		materialData = texture2D(uMaterialBuffer, vTexCoord).rgb;
		if (materialData.b < 0.001)
			discard;
	}
	
	// Sample buffers
	float depth			= unpackDepth(depthData);
	vec3 rayPos			= posFromBuffer(vTexCoord, depth);
	float rayDistance	= uRayDistance + ((noiseData.g * 0.2) + 0.2);
	float rayThickness	= uThickness + ((noiseData.b * 0.1) + 0.1);
	vec3 normal			= unpackNormal(texture2D(uNormalBuffer, vTexCoord));//getNormal(vTexCoord);
	
	// Calculate ray direction
	vec3 rayDirection = uRayDirection;
	
	//if (uRayType < RAY_SUN)
	//{
		vec3 tangent = normalize(up - normal * dot(up, normal));
		mat3 mat = mat3(tangent, cross(normal, tangent), normal);
		rayDirection = normalize(mat * unpackNormalBlueNoise(noiseData));
		
		if (uRayType == RAY_SPECULAR) // Specular
		{
			vec2 Xi = Hammersley(int(noiseData.r * 512.0), 512);
			vec3 H  = normalize(mat * sampleGGX(Xi, materialData.r));
			rayDirection = reflect(normalize(rayPos), H);	
		}
		else if (dot(rayDirection, normal) < 0.0) // Diffuse
			rayDirection = -rayDirection;
	//}
	
	// Increase thickness based on ray steepness
	float thicknessBias = pow((1.0 - abs(dot(rayDirection, normal))), 4.0) * 20.0;
	thicknessBias += pow((abs(dot(rayDirection, normal))), 4.0) * 10.0;
	rayThickness += thicknessBias;
	
	// Jitter ray start
	rayPos += ((noiseData.r * 0.05) + 0.1) * rayDirection;
	
	// Raytrace and return UV coordinate
	vec2 rayHit = rayTrace(rayPos, rayDirection, rayDistance, rayThickness);
	vec4 rayPacked = vec4(packFloat2(rayHit.x * 65025.0), packFloat2(rayHit.y * 65025.0));
	
	// Not valid
	if (rayHit.x > 1.0)
		rayPacked = vec4(1.0);
	
	if (uRayType < RAY_SUN && rayHit.x < 1.0 && dot(unpackNormal(texture2D(uNormalBuffer, rayHit)), normal) > 0.5)
		rayPacked = vec4(1.0);
	
	gl_FragData[0] = vec4(rayPacked.rg, 0.0, 1.0);
	gl_FragData[1] = vec4(rayPacked.ba, 0.0, 1.0);
}