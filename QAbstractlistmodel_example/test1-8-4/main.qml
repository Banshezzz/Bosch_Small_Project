import QtQuick 2.0
import QtQuick.Controls 2.0

Window {
    id: window
    width: 800
    height: 600
    visible: true
    color: "#8e6f00"

    Rectangle {
        id: rec
        width: parent.width
        height: 450
        color: "black"

        ListView {
            id: listview
            clip: true
            anchors.fill: rec
            anchors {
                top: rec.top
                bottom: rec.bottom
            }

            model: MyModel
            delegate: Rectangle {
                id: delegate
                color: "Black"
                height: rec.height /3
                width: window.width

                Image {
                    id: image
                    source: model.flag
                    width: window.width /6
                    height: window.height /6
                    fillMode: Image.PreserveAspectFit

                    anchors { left:parent.left }
                }
                Text {
                    id: info
                    text: model.name + "\n" +"population: " + model.population.toFixed(3) + " mill."
                    font.pixelSize: 20
                    color: "white"
                    anchors { left:image.right; verticalCenter: image.verticalCenter; leftMargin: 5 }
                }

                MouseArea {
                    id: listevent
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onDoubleClicked: mouse => {
                                         if (mouse.button === Qt.LeftButton) {
                                             // MyModel.duplicateData(model.index);
                                             text1.text = model.name;
                                             text2.text = model.population;
                                             textId.text = model.id;
                                         } else if (mouse.button === Qt.RightButton) {
                                             MyModel.removeData(model.index);
                                         }
                                     }
                    Button {
                        width: window.width /10
                        height: window.height /14
                        text: "Edit"
                        anchors {
                            topMargin: 30
                            rightMargin: 20
                            right: parent.right
                        }
                        background: Rectangle {
                            color: "#8e6f00";
                        }
                        onClicked: {
                            if (text1.text !== "" || text2.text === ""){
                                if (text3.text === ""){
                                    model.name = text1.text
                                    model.population = text2.text
                                }
                                else{
                                    model.name = text1.text
                                    model.population = text2.text
                                    model.flag = text3.text
                                }
                            }
                            else
                                console.log("Empty")
                        }
                    }
                }
            }
        }
    }

    MouseArea {
        id: below
        width: window.width
        height: 150
        anchors {
            top: rec.bottom
            topMargin: 20
        }
        onClicked: forceActiveFocus()

        TextEdit {
            id: text1
            x: 91
            y: 339
            width: 204
            height: 31
            color: "yellow"
            anchors {
                top: below.top
            }
            font.pixelSize: 14
            anchors.topMargin: 1
        }

        Text {
            id: textId
            visible: false
        }

        TextEdit {
            id: text2
            x: 91
            y: 382
            width: 204
            height: 31
            color: "yellow"
            anchors {
                top: text1.bottom
                topMargin: 11
            }
            font.pixelSize: 12
        }

        TextEdit {
            id: text3
            x: 91
            y: 429
            width: 204
            height: 31
            color: "yellow"
            anchors {
                top: text2.bottom
                topMargin: 11
            }
            font.pixelSize: 12
        }

        Button {
            id: buttonAdd
            x: 358
            y: 4
            width: 85
            height: 24
            text: qsTr("Add")
            background: Rectangle {
                color: "Gray"
            }
            onClicked: {
                if(!MyModel.getName(text1.text)){
                    MyModel.addData(text1.text,"file:/"+text3.text, text2.text);
                }
                else
                    console.log("Already exist!");
            }
        }

        Button {
            id: buttonDelete
            x: 358
            y: 45
            width: 85
            height: 24
            text: qsTr("Delete")
            background: Rectangle {
                color: "Gray"
            }
            onClicked: MyModel.removeData(textId.text-1)
        }

        Label {
            id: label
            x: 6
            y: 5
            width: 72
            height: 24
            color: "#ededea"
            text: qsTr("Country name")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
        }

        Label {
            id: label1
            x: 6
            y: 45
            width: 72
            height: 24
            color: "#ededea"
            text: qsTr("Population")
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
        }

        Label {
            id: label2
            x: 6
            y: 89
            width: 72
            height: 24
            color: "#ededea"
            text: qsTr("Image URL")
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
        }
    }
}



