import QtQuick 2.5
import QtQuick.Controls 1.4 as Desktop
import QtQuick.Controls 2.1 as Mobile
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1
Rectangle {
    property alias canvas: canvas
    Layout.margins: 1
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.minimumHeight: 266
    Layout.minimumWidth: 266
    color: canvasBackgroundColor
    Canvas {
       id: canvas
       width: canvasResolution
       height: canvasResolution
       anchors.centerIn: parent
    }
}
