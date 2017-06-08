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
                    ColumnLayout {
                        Row {
                            Layout.topMargin: 7.5
                            Layout.leftMargin: 5
                            Layout.rightMargin: 5
                            spacing: 145
                            Text {
                                text: shape
                            }
                            Button {
                                id: shapeDelete
                                width: rectChild.width
                                height: 20
                                Text {
                                    id: rectChild
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
