/// https://en.wikipedia.org/wiki/YIQ

varying vec2 vTexCoord;
varying vec4 vColour;

uniform float hueShift;
uniform float satShift;

void main()
{
	mat3 toYIQ = mat3(0.299, 0.595716, 0.211456, 0.587, -0.274453, -0.522591, 0.114, -0.321263, 0.311135);
	mat3 toRGB = mat3(1.0, 1.0, 1.0, 0.9563, -0.2721, -1.107, 0.621, -0.6474, 1.7046);
	
    vec4 baseColor = texture2D(gm_BaseTexture, vTexCoord);
	
    float maxChannel = max(baseColor.r, max(baseColor.g, baseColor.b));
    float minChannel = min(baseColor.r, min(baseColor.g, baseColor.b));
    float saturation = clamp(minChannel/maxChannel, 0.75, 1.0); // get current saturation of pixel
	
    // set saturation to pixel that depends on satShift uniform
    baseColor.rgb = clamp(maxChannel - (maxChannel - baseColor.rgb) / saturation * (satShift), 0.0, 1.0);
	
    vec3 yiqColor = toYIQ * (baseColor.rgb * vColour.rgb);
    float newHue = atan(yiqColor.b, yiqColor.g) + hueShift;
    float chroma = sqrt(yiqColor.b * yiqColor.b + yiqColor.g * yiqColor.g);
	
    yiqColor = vec3(yiqColor.r, chroma * cos(newHue), chroma * sin(newHue));
    gl_FragColor = vec4((toRGB * yiqColor), baseColor.a * vColour.a);
}