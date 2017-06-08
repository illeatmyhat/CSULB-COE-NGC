import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    property alias constraints: ctx.constraints
    property alias canvas: ctx.canvas
    property alias selection: ctx.selection
    DesignerForm {
        id: ctx
        anchors.fill: parent
        constraints {
            shapesView {
                onCurrentItemChanged: {
                    selection.selected = constraints.shapesModel.get(constraints.shapesView.currentIndex);
                }
            }
            shapesModel {
                onCountChanged: {
                    selection.visible = constraints.shapesModel.count != 0;
                    canvas.requestPaint();
                }
            }
        }

        canvasBackgroundColor: Material.color(Material.Grey);
        canvas {
            onPaint: {
                var ctx = canvas.getContext("2d");
                ctx.reset();
                ctx.fillStyle = "white";
                ctx.fillRect(0, 0, width, height);
                for(var i = 0; i < constraints.shapesModel.count; i++) {
                    var item = constraints.shapesModel.get(i);
                    ctx.fillStyle = "rgb(" + item.r + "," + item.g + "," + item.b +")";
                    var ux = item.sx - item.size;
                    var uy = item.sy - item.size;
                    ctx.fillRect(ux, uy, 1 + item.size * 2, 1 + item.size * 2);
                }
            }
        }

        selection.onPropertiesChanged: canvas.requestPaint()
    }
}
