import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1

Page {
    property alias exitButton: exitButton
    property alias newSquareButton: newSquareButton
    property alias classifyButton: classifyButton
    property alias retrainButton: retrainButton
    property alias designer: designer
    header: ToolBar {
        GridLayout{
            anchors.fill: parent
            columns: 5
            ToolButton {
                id: exitButton
                text: qsTr("Exit")
            }

            Item {
                Layout.fillWidth: true
            }

            ToolButton {
                id: newSquareButton
                text: qsTr("Add New Square")
            }

            ToolButton {
                id: classifyButton
                text: qsTr("Classify")
            }

            ToolButton {
                id: retrainButton
                text: qsTr("Retrain")
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
        anchors.fill: parent
    }
}
