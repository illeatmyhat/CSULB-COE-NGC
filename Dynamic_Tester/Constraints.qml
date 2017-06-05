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
    }
}
