import QtQuick 2.5
import QtQuick.Controls 1.4 as Desktop
import QtQuick.Controls 2.1 as Mobile
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1

Mobile.Page {
    property alias exitButton: exitButton
    property alias newSquareButton: newSquareButton
    property alias classifyButton: classifyButton
    property alias retrainButton: retrainButton
    property alias shapesModel: shapesModel
    property alias constraints: constraints
    property alias designer: designer
    property alias selection: selection

    Layout.minimumHeight: 400
    Layout.minimumWidth: 850

    header: Mobile.ToolBar {
        GridLayout {
            anchors.fill: parent
            columns: 5
            Mobile.ToolButton {
                id: exitButton
                text: qsTr("Exit")
            }

            Item {
                Layout.fillWidth: true
            }

            Mobile.ToolButton {
                id: newSquareButton
                text: qsTr("Add New Square")
            }

            Mobile.ToolButton {
                id: classifyButton
                text: qsTr("Classify")
            }

            Mobile.ToolButton {
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

    Desktop.SplitView {
        width: parent.width
        height: parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Constraints {
            id: constraints
            Layout.minimumWidth: 200
            Layout.margins: 10
            shapesView {
                model: shapesModel
            }
        }

        Designer {
            id: designer
            resolution: 256
            Layout.fillHeight: true
            Layout.fillWidth: true
            backgroundColor: "grey"
            model: shapesModel
            delegate: DesignerDelegate {
            }
        }
        ListModel {
            id: shapesModel
            ListElement {
                shape: "square"
                r: 255
                g: 0
                b: 0
                sx: 50
                sy: 50
                theta: 0
                size: 5
            }
            ListElement {
                shape: "square"
                r: 128
                g: 128
                b: 128
                sx: 230
                sy: 230
                theta: 0
                size: 5
            }
        }
        Selection {
            id: selection
            Layout.margins: 10
        }
    }
}
