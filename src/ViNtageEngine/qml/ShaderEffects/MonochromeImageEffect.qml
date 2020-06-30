import QtQuick 2.12
import Felgo 3.0

ShaderEffect {
    property variant source
    property var filterColor: Qt.vector4d(0.179, 0.179, 0, 1)

    fragmentShader: "
        varying highp vec2 qt_TexCoord0;
        uniform sampler2D source;
        uniform vec4 filterColor;

        void main() {
           vec4 srcColor = texture2D(source, qt_TexCoord0);
           vec3 luminance = dot(srcColor.xyz, vec3(1, 1, 1));
           gl_FragColor = vec4(luminance * filterColor.xyz, srcColor.w);
        }"
}
