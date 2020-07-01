import QtQuick 2.12
import Felgo 3.0

ShaderEffect {
    property variant source
    property variant sourceNoise
    property real scratchAmount: 0
    property real noiseAmount: 0
    property var randomCoord1: Qt.vector2d(0, 0)
    property var randomCoord2: Qt.vector2d(0, 0)
    property real frame: 0

    fragmentShader: "
        varying highp vec2 qt_TexCoord0;
        uniform sampler2D source;
        uniform sampler2D sourceNoise;
        uniform float scratchAmount;
        uniform float noiseAmount;
        uniform vec2 randomCoord1;
        uniform vec2 randomCoord2;
        uniform float frame;

        vec4 processColor(vec2 uv) {
            float scratchAmountInv = 1.0 / scratchAmount;
            vec4 color = texture2D(source, uv);

            vec2 sc = frame * vec2(0.001, 0.4);
            sc.x = fract(uv.x + sc.x);
            float scratch = texture2D(sourceNoise, sc).r;
            scratch = 2 * scratch * scratchAmountInv;
            scratch = 1 - abs(1 - scratch);
            scratch = max(float(0), scratch);
            color.rgb += scratch.rrr;

            vec2 rCoord = (((uv + randomCoord1) + randomCoord2) * 0.33);
            vec3 rand = vec3(texture2D(sourceNoise, rCoord));

            if (noiseAmount > (rand).r) {
                ((color).rgb = vec3 ((0.1 + ((rand).b * 0.4))));
            }

            float gray = dot(color, vec4(0.3, 0.59, 0.11, 0));
            color = vec4((gray * vec3(0.9, 0.8, 0.6)), 1);

            vec2 dist = (vec2 (0.5) - uv);

            float fluc = (((randomCoord2).x * 0.04) - 0.02);

            color.rgb *= vec3(((0.4 + fluc) - dot(dist, dist)) * 2.8);

            return color;
        }

        void main() {
           gl_FragColor = processColor(qt_TexCoord0);
        }"
}