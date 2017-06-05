import QtQuick 2.5
import QtQuick.Controls 1.4 as Desktop
import QtQuick.Controls 2.1 as Mobile
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1
Item {
    property int resolution: 256
    property var canvasBackgroundColor: canvasBackgroundColor
    property alias constraints: constraints
    property alias canvas: canvas
    property alias selection: selection
    Layout.minimumHeight: 400
    Layout.minimumWidth: 850

    Desktop.SplitView {
        width: parent.width
        height: parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Constraints {
            id: constraints
            Layout.minimumWidth: 200
            Layout.margins: 10
        }

        Rectangle {
            Layout.margins: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: 266
            Layout.minimumWidth: 266
            color: canvasBackgroundColor
            Canvas {
                id: canvas
                width: resolution
                height: resolution
                anchors.centerIn: parent
            }
        }

        Selection {
            id: selection
            Layout.margins: 10
            onValueChanged: canvas.requestPaint
        }
    }
}
