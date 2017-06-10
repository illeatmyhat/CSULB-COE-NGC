import QtQuick 2.5
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Styles 1.3
Item {
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
                    Material.background: ListView.isCurrentItem ? Material.BlueGrey : parent.Material.background
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height - 12
                        border.width: 2
                        border.color: Material.primary
                        color: "transparent"

                    }

                    Button {
                        id: shapeDelete
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.topMargin: 5
                        anchors.rightMargin: 5
                        width: 20
                        height: 32 //-12 for actual height, blame Qt devs
                        text: "X"
                        Material.background: Material.Red
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
