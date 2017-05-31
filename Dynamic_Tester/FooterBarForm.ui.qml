import QtQuick 2.5
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.1

Item {
    Material.color: Material.toolBarColor
    Material.elevation: 4
    Material.theme: Material.Dark

    GridLayout {
            width: parent.width
            Label {
                id: statusLabel
                text: qsTr("Reclassifying Image...")
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Most Recent Classification:")
            }

            Label {
                id: classificationLabel
                text: qsTr("Positive")
                Layout.minimumWidth: 50
            }
        }
}

