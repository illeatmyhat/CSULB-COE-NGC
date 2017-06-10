import QtQuick 2.0

//This is a MultiDelegate composed of multiple Components.
//The appropriate Component is chosen and loaded.
Item {
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
            x: sx - size / 2
            y: sy - size / 2
            transform: Rotation {
                origin.x: size / 2
                origin.y: size / 2
                angle: theta
            }
            width: size
            height: size
            color: Qt.rgba(r/255., g/255., b/255.)
            antialiasing: true
        }
    }
}
