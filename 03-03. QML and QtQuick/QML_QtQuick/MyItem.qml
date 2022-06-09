import QtQuick 2.9

QtObject{
    property string platform: Qt.platform.os

    enum MyEnum{
        First = 10,
        Second
    }
}
