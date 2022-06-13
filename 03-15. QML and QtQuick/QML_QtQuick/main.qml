/*
스마트폰이 대중화되고 그에 맞춰 CPU단가도 점차 낮아지면서 임베디드 분야에서도(MCU를 주로 다루는 쪽이 아니라면..) 화면과 함께 GUI 을 제공하는 것이 최근 추세인것같다.
또한 프로세서에 GPU가 기본적으로 장착되면서 고급화된 그래픽기술을 이용한 소프트웨어를 개발할 수 있게 되었고
이렇게 GPU와 함께 강력한 그래픽기술을 이용할 수 있게 하는 것이 OpenGL이나 Direct3D 같은 그래픽 API이며 이를 이용해 더 다양한 사용자 경험을 제공할 수 있게된다.

[ 셰이더 ]
이런 그래픽 API들의 고급 기능을 이용하려면 셰이더라고 부르는 GPU내에서 동작되는 프로그램을 필요로 한다.
이는 적합한 Vertex(정점)셰이더와 Fragment(픽셀)셰이더의 구현과 적재 없이는 화면을 나타낼 수 없다는 것을 의미한다.
OpenGL은 스테이지(stage)로 분할된 렌더링 파이프라인(Rendering Pipeline)을 사용한다.
아래 그림은 단순화된 OpenGL 파이프라인인데 vertex shader와 fragment shader가 바로 프로그램 가능한 부분이다.

Rendering Pipeline.png (홈페이지 참고)

vertex shader는 vertex data를 받아서 해당 루틴이 끝날 때 내부 변수인 gl_position에 변환된 정점위치를 저장한다. 다음 스테이지에서 기본요소(점,선,삼각형)들이 2차원 프래그먼트 집합으로 변환되고, 이렇게 래스터 변환 단위에 생성된 정점 셰이더 데이터는 프래그먼트 셰이더에 입력되어 프래그먼트 연산을 수행하여 픽셀의 단일 컬러 gl_FragColor를 출력하게 된다.
OpenGL에서는 이 셰이더를 GLSL(OpenGL Shading Language)로, Direct3D에서는 HLSL(High Level Shader Language)로 작성하는데 Qt Qml에서는 백엔드에 따라서 둘 다 지원한다.
Qml로 GUI Application을 개발하는 경우 이렇게 사용자정의 셰이더를 구현하고 적재하기 위해 ShaderEffect와 ShaderEffectSource QML Type을 제공하며 이 타입을 이용하면 고급 그래픽효과들을 Qml내에서 직접 구현 할 수 있다.



아래는 간단한 ShaderEffect 및 GLSL 예제이다.
*/
import QtQuick 2.9
import QtQuick.Window 2.2


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello https://www.qt.io")

    Rectangle{
        anchors.fill: parent
        Row{
            anchors.centerIn: parent
            Image{
                id:img
                source: "qrc:/Qt"
                width: 153
                height: 69
            }

            ShaderEffect{
                width: img.width;
                height: img.height
                property variant src: img
                vertexShader: "
                    uniform highp mat4 qt_Matrix;
                    attribute highp vec4 qt_Vertex;
                    attribute highp vec2 qt_MultiTexCoord0;
                    varying highp vec2 coord;
                    void main(){
                        coord = qt_MultiTexCoord0;
                        gl_Position = qt_Matrix * qt_Vertex;
                    }"
                fragmentShader:"
                    varying highp vec2 coord;
                    uniform sampler2D src;
                    uniform lowp float qt_Opacity;
                    void main(){
                        lowp vec4 tex = texture2D(src, coord);
                        gl_FragColor = vec4(vec3(dot(tex.rgb,
                                            vec3(0.344, 0.5, 0.156))),
                                                 tex.a) * qt_Opacity;
                    }"
            }
        }
    }

}


