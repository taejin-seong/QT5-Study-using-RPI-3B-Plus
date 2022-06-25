/*

QML에서 기본적으로 아이템을 리스팅 시킬수 있는 아이템이 ListView이다.
이 글에서는 QML의 ListModel과 이 모델에 동적으로 아이템을 추가, 삭제시켜 뷰(ListView)를 나타내는 방법을 설명한다.

ListView를 사용하는 방법을 알아보자.

*/

import QtQuick 2.9
import QtQuick.Window 2.2


//아래 예제는 리스트 모델의 아이템들을 동적으로 삭제시키는 예제이다.
//ListView를 중첩된 구조로 구현하여 Stack의 모델들에 아이템이 남아있지않으면 group모델의 아이템도 삭제한다.
/*
Window {
    id: root
    visible: true
    width: 500
    height: 150
    title: "ListView"

    ListModel{
        id:groupModel
        ListElement{name: "group1"}
        ListElement{name: "group2"}
        ListElement{name: "group3"}
        ListElement{name: "group4"}
        ListElement{name: "group5"}
    } // group list

    Rectangle{
        id: background
        anchors.fill: parent
        color: "white"
    }

    ListView{
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height
        clip: true
        spacing: 20
        orientation: Qt.Horizontal
        model: groupModel

        delegate:
            Item {
            id: stack
            height: 100
            width: 200
            anchors.verticalCenter: parent.verticalCenter

            signal itemEmpty()

            onItemEmpty: {
                console.log("group : ", name)
                groupModel.remove(index)
            }

            ListView{
                model: ListModel{
                    id: stackModel
                    ListElement{name: "item1"}
                    ListElement{name: "item2"}
                    ListElement{name: "item3"}
                    ListElement{name: "item4"}
                }
                anchors.fill: parent
                orientation: Qt.Horizontal

                delegate:
                    Rectangle{
                    id: widget
                    width: 200
                    height: 100
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: (index * spacing)
                    z: stackModel.count - index
                    border.width: 1
                    color: "yellow"

                    readonly property int spacing: 5

                    onYChanged:{
                        var value = 1.0 - yRatio()
                        opacity = value.toFixed(1)
                    }

                    function yRatio(){
                        var cal = (index * spacing)
                        var position = Math.abs(y - cal)
                        return (position / height)
                    }

                    PropertyAnimation{
                        id: yPositionUpAni
                        target: widget
                        property: "y"
                        duration: 100
                        to: -120
                        onStopped: {
                            stackModel.remove(index)

                            if(stackModel.count <= 0){
                                stack.itemEmpty()
                            }
                        }
                    }

                    PropertyAnimation{
                        id: yPositionDownAni
                        target: widget
                        property: "y"
                        duration: 100
                        to: index * 5
                        easing.type: Easing.InCubic
                    }

                    MouseArea{
                        anchors.fill: parent
                        drag.target: widget
                        drag.axis: Drag.YAxis
                        drag.maximumY: index * parent.spcaing
                        hoverEnabled: true

                        onReleased: {
                            var opacity = parent.yRatio()
                            if(opacity > 0.5){
                                yPositionUpAni.start()
                            }else{
                                yPositionDownAni.start()
                            }
                        }
                    }
                }
            }
        }
    }
}
*/


/*

ListModel에는 다음과 같은 Method들을 제공하고 있다.

    - append(jsobject dict)
    - clear()
    - object get(int index)
    - insert(int index, jsobject dict)
    - move(int from, int to, int n)
    - remove(int index, int count = 1)
    - set(int index, jsobject dict)
    - setProperty(int index, string property, variant value)
    - sync()

append 및 remove등의 Method를 통해 모델을 동적으로 변경 가능하다.

*/

import QtQuick.Controls 2.0

Window{
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ListModel{
        id:mymodel
    }

    Text {
        id: count
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top

        text: qsTr("count : " + mymodel.count)
        font.pixelSize: 25
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height

        spacing: 20

        Button{
            anchors.verticalCenter: parent.verticalCenter
            text: "append"
            onClicked: {
                // Math.random()는 0과 1사이의 난수를 반환하고,
                // Math.ceil()는 소수점 이하를 올려 정수로 만든다.
                // 모델에 아이템을 추가한다
                mymodel.append({'number': Math.ceil(Math.random() * 10)})
            }
        }

        ListView{
            width: 350
            height: 400
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10
            clip: true // ListView 영역을 벗어난 부분을 자른다.

            model: mymodel

            delegate:
                Rectangle{
                width: parent.width
                height: 50
                color: "white"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: qsTr("number: " + number) // 모델 아이템의 'number'
                    font.pixelSize: 20
                }

                Button{
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    anchors.verticalCenter: parent.verticalCenter

                    text: "remove"
                    onClicked: {
                        // 클릭한 아이템을 모델에서 삭제
                        mymodel.remove(index)
                    }
                }
            }
        }
    }
}
