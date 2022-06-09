/*
이번엔 아이템들을 배치 시키는 컴포넌트를 소개한다.
*/

import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: idWindow
    visible: true

// Row 사용할 때 윈도우창 사이즈
//    width: 640
//    height: 480

// Column 사용할 때 윈도우창 사이즈
    width: 400
    height: 500

    flags: Qt.FramelessWindowHint // 윈도우창 title를 가려줌.

/* Row */
// Row는 가로형태로 아이템을 배치시킨다.
    /*
    Row{
        anchors.centerIn: parent
        spacing: 20

        Image{
            source: "qrc:/Nature"
        }

        Image{
            source: "qrc:/Sea"
        }
    }
    */

// Repeater를 사용하면 같은 아이템들을 일일이 나열할 필요없이 간단하게 아이템을 반복하여 배치시킬 수 있다.
    /*
    Rectangle{
        anchors.fill: parent
        color: "#F0F0F0"

        Row{
            anchors.centerIn: parent
            spacing: 20

            Repeater{
                model: 2

                Image {
                    source: "qrc:/Nature"
                }
            }
        }
    }
    */

/* Column*/
// Column은 아이템들을 새로로 배치 시킨다.

    Rectangle{
        anchors.fill: parent
        color: "#F0F0F0"

        Column{
            anchors.centerIn: parent
            spacing: 20

            Image{
                source: "qrc:/Nature"
            }

            Image{
                source:"qrc:/Sea"
            }

            Rectangle{
                color:  "green"
                width: 110
                height: 50
            }
        }
    }

}
