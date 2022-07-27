import QtQuick
import QtQuick.Controls 2.15
import ST 1.0
import SI 1.0

Window {
    id: window
    width: 840
    height: 480
    visible: true
    color: "#000000"
    title: qsTr("Hello World")

    Item {
        // Key press event
        focus: true
        anchors.fill: parent
        Keys.onPressed: (event) => {
                            if (event.key === Qt.Key_F1) {
                                if(stackview.currentItem.objectName !== "welcomeScreen") {
                                    console.log("F1 pressed");
                                    stackview.push("WelcomeScreen.qml", {objectName: "welcomeScreen"});
                                    label.visible = false;
                                    return;
                                }

                                stackview.pop();
                                if (stackview.currentItem.objectName === "programscreen")
                                label.visible = true;
                            }
                            else if (event.key === Qt.Key_Backspace) {
                                if(stackview.currentItem.objectName === "programscreen") {
                                    console.log("F1 pressed");
                                    stackview.pop();
                                    label.visible = false;
                                    return;
                                }
                            }
                        }

        //Headline bar
        StatusBar {
            id: statusbar
        }

        //Status bar's title
        Label {
            id: label
            anchors {
                left: statusbar.left
                leftMargin: 20
            }
            text: "Program"
            font.pixelSize: 20
            visible: false
            color: "white"
        }

        // Views
        StackView{
            id: stackview
            anchors
            {
                topMargin: 30
                fill: parent
            }
            initialItem: "MenuScreen.qml"
        }
    }
}

