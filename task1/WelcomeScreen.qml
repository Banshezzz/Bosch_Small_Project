import QtQuick 2.0
import QtQuick.Controls 2.0
import SI 1.0

Rectangle {
    id: welcomeScreen

    ImageClass {
        id: imageclass
    }

    MouseArea {
        id: mouseArea
        anchors.centerIn: welcomeScreen
        width: 335
        height: 141
        Image {
            id: image
            x: 0
            y: 0
            width: 138
            height: 133
            source: imageclass.Url_clock
            fillMode: Image.PreserveAspectFit
        }

        Text {
            x: 144
            y: 0
            width: 191
            height: 141
            color: "#ffffff"
            text: "Main menu"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
        }
        onClicked: {
            label.visible = true
            stackview.pop()
        }
    }
    color: "#000000"
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
