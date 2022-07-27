import QtQuick 2.0
import QtQuick.Controls 2.0
import ST 1.0
import SI 1.0

Item {

    TextClass {
        id: textclass
    }

    TextClass {
        id: textclass2
    }

    TextClass {
        id: textclass3
    }

    ImageClass {
        id: imageclass
    }

    ListView {
        id: listView
        orientation: ListView.Horizontal
        anchors {
            fill: parent
            centerIn: parent
            verticalCenter: parent.verticalCenter
        }
        model: model
        highlightRangeMode: ListView.StrictlyEnforceRange
        delegate:
            Item {
            width: listView.width

            TextEdit {
                id: textL1
                x: 394
                y: 96
                width: 355
                height: 132
                color: "#ffffff"
                text: textL
                wrapMode: Text.WordWrap
                font.pixelSize: 50
                onTextChanged: textL = text
            }

            TextEdit {
                id: textS1
                x: 394
                y: 229
                width: 355
                height: 86
                color: "#aba0a0"
                text: textS
                wrapMode: Text.WordWrap
                font.pixelSize: 30
                onTextChanged: textS = text
            }

            MouseArea {
                x: 64
                y: 96
                width: 315
                height: 255

                BorderImage {
                    id: borderImage
                    anchors.fill: parent
                    source: icon
                }
                onClicked: {
                    stackview.push("ProgramScreen.qml", {objectName : "programscreen"})
                    label.text = title
                    label.visible = true
                }
            }
        }
    }

    ListModel {
        id: model

        property bool completed: false
        Component.onCompleted: {
            append({textL: textclass.textL, textS: textclass.textS, icon: imageclass.Url_menu1, title: "Menu1"});
            append({textL: textclass2.textL, textS: textclass2.textS, icon: imageclass.Url_menu2, title: "Menu2"});
            append({textL: textclass3.textL, textS: textclass3.textS, icon: imageclass.Url_menu3, title: "Menu3"});
            completed = true;
        }
    }

    PageIndicator {
        id: indicator
        y: 451
        currentIndex: listView.currentIndex
        count: listView.count
        anchors {
            bottom: listView.bottom
            horizontalCenterOffset: 0
            bottomMargin: 15
            horizontalCenter: parent.horizontalCenter
        }
        delegate: Rectangle {
            implicitWidth: 8
            implicitHeight: 8
            radius: width / 2
            color: index === indicator.currentIndex? "red" : "gray"
            required property int index
        }
    }

    //Swipe view Example
    //    SwipeView {
    //        id: swipeV
    //        anchors.fill: parent
    //        currentIndex: 0

    //        Item {
    //            id: first

    //            TextEdit {
    //                id: textL1
    //                x: 394
    //                y: 96
    //                width: 355
    //                height: 132
    //                color: "#ffffff"
    //                text: textclass.textL
    //                wrapMode: Text.WordWrap
    //                font.pixelSize: 50
    //                onTextChanged: textclass.textL = text
    //            }

    //            TextEdit {
    //                id: textS1
    //                x: 394
    //                y: 229
    //                width: 355
    //                height: 86
    //                color: "#aba0a0"
    //                text: textclass.textS
    //                wrapMode: Text.WordWrap
    //                font.pixelSize: 30
    //                onTextChanged: textclass.textS = text
    //            }

    //            MouseArea {
    //                x: 64
    //                y: 96
    //                width: 315
    //                height: 255

    //                BorderImage {
    //                    id: borderImage
    //                    anchors.fill: parent
    //                    source: imageclass.Url
    //                }
    //                onClicked: {
    //                    stackview.push("ProgramScreen.qml", {objectName : "programscreen"})
    //                    homebutton.visible = true
    //                }
    //            }
    //        }

    //        Item {
    //            id: second

    //            TextEdit {
    //                id: textL2
    //                x: 394
    //                y: 96
    //                width: 355
    //                height: 132
    //                color: "#ffffff"
    //                text: textclass2.textL
    //                wrapMode: Text.WordWrap
    //                font.pixelSize: 50
    //                onTextChanged: textclass2.textL = text
    //            }

    //            TextEdit {
    //                id: textS2
    //                x: 394
    //                y: 229
    //                width: 355
    //                height: 86
    //                color: "#aba0a0"
    //                text: textclass2.textS
    //                font.pixelSize: 30
    //                onTextChanged: textclass2.textS = text
    //            }

    //            MouseArea {
    //                x: 64
    //                y: 96
    //                width: 315
    //                height: 255

    //                BorderImage {
    //                    id: borderImage2
    //                    anchors.fill: parent
    //                    source: imageclass.Url
    //                }
    //                onClicked: {
    //                    stackview.push("ProgramScreen.qml", {objectName : "programscreen"})
    //                    homebutton.visible = true
    //                }
    //            }
    //        }

    //        Item {
    //            id: third

    //            TextEdit {
    //                id: textL3
    //                x: 394
    //                y: 96
    //                width: 355
    //                height: 132
    //                color: "#ffffff"
    //                text: textclass3.textL
    //                wrapMode: Text.WordWrap
    //                font.pixelSize: 50
    //                onTextChanged: textclass3.textL = text
    //            }

    //            TextEdit {
    //                id: textS3
    //                x: 394
    //                y: 229
    //                width: 355
    //                height: 86
    //                color: "#aba0a0"
    //                text: textclass3.textS
    //                font.pixelSize: 30
    //                onTextChanged: textclass3.textS = text
    //            }

    //            MouseArea {
    //                x: 64
    //                y: 96
    //                width: 315
    //                height: 255

    //                BorderImage {
    //                    id: borderImage3
    //                    anchors.fill: parent
    //                    source: imageclass.Url
    //                }
    //                onClicked: {
    //                    stackview.push("ProgramScreen.qml", {objectName : "programscreen"})
    //                    homebutton.visible = true
    //                }
    //            }
    //        }
    //    }
}

