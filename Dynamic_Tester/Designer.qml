import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Material 2.1
Item {
    property int resolution: 256
    Layout.minimumHeight: 400
    Layout.minimumWidth: 850
    property var addShape: (function() {
        shapesModel.append
        ({
             index: shapesModel.count,
             shape: "square",
             r: 255,
             g: 0,
             b: 0,
             sx: 128,
             sy: 128,
             theta: 0,
             size: 5
        })
        canvas.requestPaint()
    })
    ListModel {
        id: shapesModel
        ListElement {
            index: 0
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
            index: 1
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

    Component {
        id: shapeDelegate
        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            height: childrenRect.height
            border.width: 1
            ColumnLayout {
                Row {
                    Layout.topMargin: 5
                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                    Text { text: shape }
                }
                Row {
                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                    spacing: 10
                    Text { text: "R: " + r }
                    Text { text: "G: " + g }
                    Text { text: "B: " + b }
                }
                Row {
                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                    Layout.bottomMargin: 5
                    spacing: 10
                    Text { text: "X: " + sx }
                    Text { text: "Y: " + sy }
                    Text { text: "θ: " + theta }
                    Text { text: "size: " + size }
                }
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onContainsMouseChanged: color = containsMouse ? Material.color(Material.LightBlue) : "white"
                onClicked: {
                    selection.selected = shapesModel.get(index)
                    selection.updateSelected()
                }

            }
        }
    }

    SplitView {
        id: splitter
        width: parent.width
        height: parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        ListView {
            spacing: 10
            Layout.minimumWidth: 200
            Layout.margins: 10
            model: shapesModel
            delegate: shapeDelegate
        }
        Rectangle {
            Layout.margins: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: 266
            Layout.minimumWidth: 266
            color: Material.color(Material.Grey)
            Canvas {
                id: canvas
                width: resolution
                height: resolution
                anchors.centerIn: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.reset()
                    ctx.fillStyle = "white"
                    ctx.fillRect(0, 0, width, height)
                    for(var i = 0; i < shapesModel.count; i++) {
                        var item = shapesModel.get(i)
                        ctx.fillStyle = "rgb(" + item.r + "," + item.g + "," + item.b +")"
                        var ux = item.sx - item.size
                        var uy = item.sy - item.size
                        ctx.fillRect(ux, uy, 1 + item.size * 2, 1 + item.size * 2)
                    }
                }
            }
        }

        Selection {
            id: selection
            Layout.margins: 10
            onValueChanged: canvas.requestPaint
        }
    }
}
