#version 300 es
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;

// Per-channel multiplier to vibrance strength.
const vec3 Balance = vec3(1.0f, // Red channel multiplier
1.0f, // Green channel multiplier
1.0f  // Blue channel multiplier
);

// Strength of filter.
const float Strength = 0.5f;

const vec3 VIB_coeffVibrance = Balance * -Strength;

out vec4 fragColor;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    vec3 color = vec3(pixColor[0], pixColor[1], pixColor[2]);

    // Try both and see which one looks nicer.
    // vec3 VIB_coefLuma = vec3(0.333333, 0.333334, 0.333333); // Option 1
    vec3 VIB_coefLuma = vec3(0.212656f, 0.715158f, 0.072186f); // Option 2

    float luma = dot(VIB_coefLuma, color);

    float max_color = max(color.r, max(color.g, color.b));
    float min_color = min(color.r, min(color.g, color.b));

    float color_saturation = max_color - min_color;

    vec3 p_col = vec3(sign(VIB_coeffVibrance) * color_saturation - 1.0f) * VIB_coeffVibrance + 1.0f;

    pixColor.r = mix(luma, color.r, p_col.r);
    pixColor.g = mix(luma, color.g, p_col.g);
    pixColor.b = mix(luma, color.b, p_col.b);

    fragColor = pixColor;
}
