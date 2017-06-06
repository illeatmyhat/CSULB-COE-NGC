import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Item {
    Layout.minimumWidth: 300
    height: childrenRect.height
    property int r: 0
    property int g: 0
    property int b: 0
    property int sx: 0
    property int sy: 0
    property int theta: 0
    property int size: 0

    property alias xSpinBox: xSpinBox
    property alias ySpinBox: ySpinBox
    property alias thetaSpinBox: thetaSpinBox
    property alias sizeSpinBox: sizeSpinBox
    property alias rSpinBox: rSpinBox
    property alias rSlider: rSlider
    property alias gSpinBox: gSpinBox
    property alias gSlider: gSlider
    property alias bSpinBox: bSpinBox
    property alias bSlider: bSlider
    GridLayout {
        id: gridLayout
        width: parent.width
        height: childrenRect.height
        columnSpacing: 10
        rowSpacing: 10
        rows: 2
        columns: 5

        Label {
            id: xLabel
            text: qsTr("X")
        }

        SpinBox {
            id: xSpinBox
            to: 25
            editable: true
            value: sx
            onValueChanged: sx = value
            Layout.maximumWidth: 300
            Layout.fillWidth: true
        }

        Item {
            width: 10
            Layout.fillHeight: true
        }

        Label {
            id: yLabel
            text: qsTr("Y")
        }

        SpinBox {
            id: ySpinBox
            editable: true
            value: sy
            onValueChanged: sy = value
            Layout.maximumWidth: 300
            Layout.fillWidth: true
        }

        Label {
            id: thetaLabel
            text: qsTr("θ")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
        }

        SpinBox {
            id: thetaSpinBox
            editable: true
            value: theta
            onValueChanged: theta = value
            to: 359
            Layout.maximumWidth: 300
            Layout.fillWidth: true
        }

        Item {
            width: 10
            Layout.fillHeight: true
        }

        Label {
            id: sizeLabel
            text: qsTr("S")
        }

        SpinBox {
            id: sizeSpinBox
            editable: true
            value: size
            onValueChanged: size = value
            Layout.maximumWidth: 300
            Layout.fillWidth: true
        }

        Label {
            id: rLabel
            text: qsTr("R")
        }

        Slider {
            id: rSlider
            value: r
            onValueChanged: r = value
            to: 255
            stepSize: 1.0
            Layout.columnSpan: 3
            Layout.fillWidth: true
        }

        SpinBox {
            id: rSpinBox
            to: 255
            editable: true
            value: r
            onValueChanged: r = value
            Layout.maximumWidth: 300
            Layout.fillWidth: true
        }

        Label {
            id: gLabel
            text: qsTr("G")
        }

        Slider {
            id: gSlider
            value: g
            onValueChanged: g = value
            to: 255
            stepSize: 1.0
            Layout.columnSpan: 3
            Layout.fillWidth: true
        }
        SpinBox {
            id: gSpinBox
            to: 255
            editable: true
            value: g
            onValueChanged: g = value
            Layout.maximumWidth: 300
            Layout.fillWidth: true
        }
        Label {
            id: bLabel
            text: qsTr("B")
        }

        Slider {
            id: bSlider
            value: b
            onValueChanged: b = value
            to: 255
            stepSize: 1.0
            Layout.columnSpan: 3
            Layout.fillWidth: true
        }
        SpinBox {
            id: bSpinBox
            to: 255
            editable: true
            value: b
            onValueChanged: b = value
            Layout.maximumWidth: 300
            Layout.fillWidth: true
        }
    }
}
