import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4

Item {
    Layout.minimumHeight: 400
    Layout.minimumWidth: 800

    SplitView {
        id: selectorSplitter
        width: parent.width
        height: parent.height
        Layout.fillHeight: true
        Layout.fillWidth: true

        Calendar {
            id: calendar
            Layout.fillWidth: true
            Layout.margins: 10
        }

        Selection {
            id: selection
            Layout.margins: 10
        }
    }
}
