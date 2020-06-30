import QtQuick 2.12
import Felgo 3.0

ShaderEffect {
    property variant source
    property real sharpen: 0

    fragmentShader: "
        varying highp vec2 qt_TexCoord0;
        uniform sampler2D source;
        uniform float sharpen;

        void main() {
            vec2 offset[4];
            vec2 imgSize;
            imgSize.x = 100;
            imgSize.y = 100;
            vec2 step = 1.0 / imgSize;
            float step_w = step.x;
            float step_h = step.y;

            offset[0] = vec2(0.0, -step_h);
            offset[1] = vec2(-step_w, 0.0);
            offset[2] = vec2(step_w, 0.0);
            offset[3] = vec2(0.0, step_h);

            vec4 midColor = texture2D(source, qt_TexCoord0.xy);

            vec4 sum = midColor * 5.0;

            for (int i = 0; i < 4; i++) {
                vec4 color = texture2D(source, qt_TexCoord0.xy + offset[i]);
                sum += color * -1.0;
            }

            gl_FragColor = mix(midColor, sum, sharpen);
        }"
}
