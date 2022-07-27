import QtQuick 2.0
import QtQuick.Controls 2.0
import MyStyle 1.0
import SI 1.0

Rectangle {
    id: statusbar
    width: HeaderLine.width
    height: HeaderLine.height
    color: HeaderLine.color
    border.color: "#907500"
    anchors.topMargin: 0

    ImageClass {
        id: imageclass
    }

    Image {
        id: no_wifi
        anchors {
            right: statusbar.right
            rightMargin: 90
            leftMargin: 20
        }
        source: imageclass.Url_noWifi
        width: HeaderLine.widthI
        height: HeaderLine.heightI
    }

    Image {
        id: lock
        anchors {
            right: statusbar.right
            rightMargin: 60
            leftMargin: 20
        }
        source: imageclass.Url_clock
        width: HeaderLine.widthI
        height: HeaderLine.heightI
    }
    Image {
        id: more
        anchors {
            right: statusbar.right
            rightMargin: 20
            leftMargin: 20
        }
        source: imageclass.Url_more
        width: HeaderLine.widthI
        height: HeaderLine.heightI
    }
}
