import QtQuick 2.0
import QtQuick.Controls 2.0
import SI 1.0

Rectangle {
    id: programscreen
    color: "#000000"

    ImageClass {
        id: imageclass
    }

    Image {
        x: 242
        y: 0
        width: 300
        height: 480
        source: imageclass.Url_detail
    }

    MouseArea {
        id: backbutton
        Image {
            id: backimage
            source: imageclass.Url_more
            fillMode: Image.Stretch
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.fill: backbutton
        }
        x: 32
        y: 159
        width: 29
        height: 33
        onClicked: {
            stackview.pop()
            label.visible = false
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
