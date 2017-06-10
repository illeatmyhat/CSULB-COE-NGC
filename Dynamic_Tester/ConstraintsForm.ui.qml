import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    property alias shapesView: shapesView
    property var shapesDelegate: shapesDelegate

    ListView {
        id: shapesView
        anchors.fill: parent
        keyNavigationWraps: true
        delegate: shapesDelegate
    }
}
