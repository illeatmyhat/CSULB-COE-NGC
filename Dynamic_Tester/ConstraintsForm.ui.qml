import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    property alias shapesModel: shapesModel
    property alias shapesView: shapesView
    property var shapesDelegate: shapesDelegate
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

    ListView {
        id: shapesView
        anchors.fill: parent
        model: shapesModel
        keyNavigationWraps: true
        delegate: shapesDelegate
    }
}
