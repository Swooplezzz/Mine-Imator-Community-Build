varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_Position;
uniform float u_Position_s;

// https://en.wikipedia.org/wiki/YIQ

const mat3 rgb2yiq = mat3(0.299, 0.587, 0.114, 0.595716, -0.274453, -0.321263, 0.211456, -0.522591, 0.311135);
const mat3 yiq2rgb = mat3(1.0, 0.9563, 0.6210, 1.0, -0.2721, -0.6474, 1.0, -1.1070, 1.7046);

void main()
{
    vec4 tColor = texture2D(gm_BaseTexture, v_vTexcoord);

    
    float Max = max(tColor.r, max(tColor.g, tColor.b)); // get max channel of pixel
    float Min = min(tColor.r, min(tColor.g, tColor.b)); // get min channel of pixel
    float Sat = Min/Max; // get current saturation of pixel
	Sat = clamp(Sat, 0.75, 1.0);
    // set saturation to pixel that depends on Position uniform
    tColor.r = clamp(Max-(Max-tColor.r)/Sat*(u_Position_s), 0.0, 1.); // for red channel
    tColor.g = clamp(Max-(Max-tColor.g)/Sat*(u_Position_s), 0.0, 1.); // for green channel
    tColor.b = clamp(Max-(Max-tColor.b)/Sat*(u_Position_s), 0.0, 1.); // for blue channel
	
    vec3 yColor = (tColor.rgb * v_vColour.rgb) * rgb2yiq; 

    float originalHue = atan(yColor.b, yColor.g);
    float finalHue = originalHue + u_Position;

    float chroma = sqrt(yColor.b * yColor.b + yColor.g * yColor.g);
	
    vec3 yFinalColor = vec3(yColor.r, chroma * cos(finalHue), chroma  * sin(finalHue));

    gl_FragColor = vec4(yFinalColor * yiq2rgb, tColor.a * v_vColour.a);
}
