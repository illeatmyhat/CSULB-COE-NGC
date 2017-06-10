import QtQuick 2.0

//This is a MultiDelegate composed of multiple Components.
//The appropriate Component is chosen and loaded.
Item {
    property int resolution: 256
    function selectDelegate(shape) {
        switch(shape) {
        case "square":
            return squareDelegate;
        }
    }

    Loader {
        sourceComponent: selectDelegate(shape)
    }

    Component {
        id: squareDelegate
        Rectangle {
            id: rect
            x: sx - width / 2
            onXChanged: {
                sx = x + width / 2
                if(sx < 0) sx = 0
                if(sx > resolution - 1) sx = resolution - 1
            }
            y: sy - height / 2
            onYChanged: {
                sy = y + width / 2
                if(sy < 0) sy = 0
                if(sy > resolution - 1) sy = resolution - 1
            }

            transform: Rotation {
                origin.x: width / 2
                origin.y: height / 2
                angle: theta
            }
            width: size * 2
            height: size * 2
            color: Qt.rgba(r/255., g/255., b/255.)
            antialiasing: true

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                drag.target: parent
            }
        }
    }
}
