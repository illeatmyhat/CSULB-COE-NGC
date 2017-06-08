import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
Item {
    property alias shapesModel: ctx.shapesModel
    property alias shapesView: ctx.shapesView
    ConstraintsForm {
        id: ctx
        anchors.fill:parent
        shapesDelegate:
            Component{
            Button {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: childrenRect.height
                    onClicked: shapesView.currentIndex = index
                    Button {
                        id: shapeDelete
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.topMargin: 10
                        anchors.rightMargin: 5
                        width: childrenRect.width
                        height: 20
                        Text {
                            text: " X "
                        }
                        MouseArea {
                            onClicked: {
                                shapesModel.remove(index);
                            }
                            anchors.fill: parent
                            hoverEnabled: true
                        }
                    }
                    ColumnLayout {
                        Row {
                            Layout.topMargin: 7.5
                            Layout.leftMargin: 5
                            Layout.rightMargin: 5
                            spacing: 145
                            Text {
                                text: shape
                            }
                        }
                        Row {
                            Layout.leftMargin: 5
                            Layout.rightMargin: 5
                            spacing: 10
                            Text {
                                text: "R: " + r
                            }
                            Text {
                                text: "G: " + g
                            }
                            Text {
                                text: "B: " + b
                            }
                        }
                        Row {
                            Layout.leftMargin: 5
                            Layout.rightMargin: 5
                            Layout.bottomMargin: 10
                            spacing: 10
                            Text {
                                text: "X: " + sx
                            }
                            Text {
                                text: "Y: " + sy
                            }
                            Text {
                                text: "θ: " + theta
                            }
                            Text {
                                text: "size: " + size
                            }
                        }
                    }
                }
        }
    }

}
