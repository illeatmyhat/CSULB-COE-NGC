import QtQuick 2.5

SelectionForm {
    property int resolution: 256
    property var selected
    signal propertiesChanged

    xSpinBox.to: resolution - 1
    ySpinBox.to: resolution - 1
    sizeSpinBox.to: resolution - 1

    onSelectedChanged: {
        if(selected !== null) {
            sx = selected.sx;
            sy = selected.sy;
            theta = selected.theta;
            size = selected.size;
            r = selected.r;
            g = selected.g;
            b = selected.b;
        }
    }

    onSxChanged: {
        xSpinBox.value = sx;
        selected.sx = sx;
        propertiesChanged();
    }

    onSyChanged: {
        ySpinBox.value = sy;
        selected.sy = sy;
        propertiesChanged();
    }

    onThetaChanged: {
        thetaSpinBox.value = theta;
        selected.theta = theta;
        propertiesChanged();
    }

    onSizeChanged: {
        sizeSpinBox.value = size;
        selected.size = size;
        propertiesChanged();
    }

    onRChanged: {
        rSpinBox.value = r;
        rSlider.value = r;
        selected.r = r;
        propertiesChanged();
    }

    onGChanged: {
        gSpinBox.value = g;
        gSlider.value = g;
        selected.g = g;
        propertiesChanged();
    }

    onBChanged: {
        bSpinBox.value = b;
        bSlider.value = b;
        selected.b = b;
        propertiesChanged();
    }
}
