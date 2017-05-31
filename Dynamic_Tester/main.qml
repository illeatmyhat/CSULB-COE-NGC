import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    minimumWidth: 820
    minimumHeight: 400
    title: qsTr("Dynamic Tester")
    header: ToolBar {
        GridLayout{
            anchors.fill: parent
            columns: 4
            ToolButton {
                text: qsTr("Exit")
                onClicked: Qt.quit();
            }

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                id: newSquareButton
                text: qsTr("Add New Square")
                onClicked: designer.addShape()
            }

            ToolButton {
                id: reclassifyButton
                text: qsTr("Reclassify")
            }
        }


    }
    footer: Rectangle {
        height: childrenRect.height
        color: Material.primary
        GridLayout {
                id: grid
                width: parent.width
                Text {
                    id: statusLabel
                    text: qsTr("Reclassifying Image...")
                    color: "white"
                }

                Item {
                    Layout.fillWidth: true
                }

                Text {
                    text: qsTr("Most Recent Classification:")
                    color: "white"
                }

                Text {
                    id: classificationLabel
                    text: qsTr("Positive")
                    Layout.minimumWidth: 50
                    color: "white"
                }
        }
    }

    Designer {
        id: designer
        anchors.top: header.bottom
        anchors.bottom: footer.top
        anchors.left: parent.left
        anchors.right: parent.right
    }
}
