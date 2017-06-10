import QtQuick 2.5
import QtQuick.Controls 1.4 as Desktop
import QtQuick.Controls 2.1 as Mobile
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1
Rectangle {
    id:root
    property int resolution
    property ListModel model
    property Component delegate
    property string backgroundColor

    Layout.margins: 1
    Layout.minimumHeight: resolution + 1
    Layout.minimumWidth: resolution + 1
    color: backgroundColor
    Rectangle {
        anchors.centerIn: parent
        width: resolution
        height: resolution
        color: "white"
        clip: true
        Repeater {
            model: root.model
            delegate: root.delegate
        }
    }
}
