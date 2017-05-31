import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Material.impl 2.2
import QtQuick.Layouts 1.3

T.ToolBar {
    id: control
    contentWidth: contentItem.implicitWidth || (contentChildren.length === 1 ? contentChildren[0].implicitWidth : 0)
    contentHeight: contentItem.implicitHeight || (contentChildren.length === 1 ? contentChildren[0].implicitHeight : 0)
    Material.elevation: 4
	
    implicitWidth: Math.max(background ? background.implicitWidth : 0, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0, contentHeight + topPadding + bottomPadding)


    Material.foreground: Material.toolTextColor

    background: Rectangle {
        implicitHeight: grid.height
        color: control.Material.toolBarColor

        layer.enabled: control.Material.elevation > 0
        layer.effect: ElevationEffect {
            elevation: control.Material.elevation
            fullWidth: true
        }
    }
	GridLayout {
			id: grid
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

