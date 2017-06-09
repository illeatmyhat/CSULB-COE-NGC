import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.1

ApplicationWindow {
    visible: true
    minimumWidth: 820
    minimumHeight: 400
    title: qsTr("Dynamic Tester")
    MainForm {
        anchors.fill: parent
        exitButton.onClicked: Qt.quit();
        newSquareButton.onClicked: {
            constraints.shapesModel.append
            ({
                 shape: "square",
                 r: 255,
                 g: 0,
                 b: 0,
                 sx: 128,
                 sy: 128,
                 theta: 0,
                 size: 5
            });

            constraints.shapesView.currentIndex = constraints.shapesModel.count - 1;
            canvas.requestPaint();
        }

        canvasResolution: 256
        canvasBackgroundColor: Material.color(Material.Grey);
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

        designer {
            canvas.onPaint: {
                var ctx = designer.canvas.getContext("2d");
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

        selection.onPropertiesChanged: designer.canvas.requestPaint()
    }
}
