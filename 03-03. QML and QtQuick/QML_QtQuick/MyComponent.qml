import QtQuick 2.9

Component{
    id: mycomponent

    Timer{
        id: timer
        running: true
        interval: 2000

        onTriggered: {
            console.log("quit!!")

            Qt.quit()
        }
    }
}
