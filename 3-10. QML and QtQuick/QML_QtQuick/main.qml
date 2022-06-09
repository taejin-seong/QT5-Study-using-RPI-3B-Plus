/*
이번 시간에는 데이터 모델들을 목록화 할 수 있는 컴포넌트를 다룬다.

데이터 모델을 리스트로 나열할 수 있는 컴포넌트는 지난 강좌에서 잠깐 설명했던 Repeater 와 포지셔닝 컴포넌트인 Column 및 Row를 사용 사용하는 것이다.
가장 간단한 형태로 Repeater로 지정된 수 만큼 항목을 인스턴스화 시키고 Column과 결합하여 새로로 나열시킬 수 있다.
*/
import QtQuick 2.9
import QtQuick.Window 2.2

/*
아래의 예제는 Rectangle 아이템을 5개 객체화 하고 index를 참조하여 새로 형태로 리스팅한다.
*/

/*
Window {
    id: idWindow
    visible: true
    width: 100
    height: 300

 //   flags: Qt.FramelessWindowHint

    Rectangle{
        id: content
        anchors.fill: parent
        color: "#F0F0F0"
    }

    Column{
        id: list
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10

        Repeater{
            model:5

            Rectangle{
                anchors.horizontalCenter: parent.horizontalCenter
                width: 40
                height: 40
                radius: 20
                border.width: 1
                color: "yellow"

                Text{
                    id: text
                    anchors.centerIn: parent
                    text: index
                }
            }
        }
    }
}
*/


/*
이번에는 단순히 지정된 수 만큼 객체를 나열하는것이 아니라 자바 스크립트 배열을 지정하여 리스트로 만든다.

배열에는 문자열나 숫자등이 들어갈 수 있고 아래 예제에서는 Component가 별도의 qml파일 처럼 배열에 담겨 Repeater의 model로 사용되며 modelData로 접근하여 Loader에 의해 인스턴스화된다.
참고로 Component는 그 자체 만으로는 인스턴스화 되지 않으며 Loader에 의해 런타임중 동적으로 로드시킬 수 있다.(Component 및 Loader에 대해서는 다음 강좌에서 더 자세히 다룰 것이다.)
*/

/*
Window{
    id: idWindow
    visible: true
    width: 300
    height: 100
//    flags: Qt.FramelessWindowHint

    Rectangle{
        id: content
        anchors.fill: parent
        color: "#F0F0F0"
    }

    Row{
        id: list

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10

        Component{
            id: blue
            Rectangle{
                width: 40
                height: 30
                color: "blue"
                Text{
                    anchors.centerIn: parent
                    text: qsTr("Blue")
                }
            }
        }

        Component{
            id: red
            Rectangle{
                width: 50
                height: 40
                color: "red"
                Text{
                    anchors.centerIn: parent
                    text: qsTr("Red")
                }
            }
        }

        Component{
            id: green
            Rectangle{
                width: 50
                height: 40
                color: "green"
                Text{
                    anchors.centerIn: parent
                    text: qsTr("Green")
                }
            }
        }

        Repeater{
            model: [red, green, blue]

            Loader{
                sourceComponent: modelData
            }
        }
    }
}
*/


/*
ListModel컴포넌트를 사용하면 조금더 복잡한 데이터 유형들을 설정할 수 있다.
*/

Window{
    id: idWindow
    visible: true
    width: 150
    height: 300
//    flags: Qt.FramelessWindowHint

    Rectangle{
        id: content
        anchors.fill: parent
        color: "#F0F0F0"

        ListModel{
            id: users
            ListElement{ name: "Lee"; ID: "goal21"; point:210}
            ListElement{ name: "Kim"; ID: "Kim19"; point:198}
            ListElement{ name: "Park"; ID: "allways78"; point:200}
            ListElement{ name: "Kim"; ID: "hello32"; point:176}
        }

        Column{
            id: list

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            spacing: 10

            Repeater{
                model: users

                Rectangle{
                    width: 150
                    height: 50
                    color: "blue"
                    radius: 5

                    Row{
                        spacing: 10
                        anchors.centerIn: parent
                        Text{
                            text: name
                            font.bold: true
                            font.pixelSize: 20
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text{
                            text: ID
                            color: "white"
                            font.bold: true
                            font.pixelSize: 15
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text{
                            text: point
                            color: "white"
                            font.bold: true
                            font.pixelSize: 15
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
    }
}
