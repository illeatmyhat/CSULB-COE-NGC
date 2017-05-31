import QtQuick 2.5
SelectionForm {
    property int resolution: 256
    property var selected: ({})
    property var updateSelected: (function() {
        rSpinBox.value = selected.r
        gSpinBox.value = selected.g
        bSpinBox.value = selected.b
        xSpinBox.value = selected.sx
        ySpinBox.value = selected.sy
        thetaSpinBox.value = selected.theta
        sizeSpinBox.value = selected.size
        visible = true
    })
    property var onValueChanged: (function() {})
    visible: true
    xSpinBox.to: resolution - 1
    ySpinBox.to: resolution - 1
    sizeSpinBox.to: resolution - 1

    xSpinBox.onValueChanged: {
        selected.sx = xSpinBox.value
        onValueChanged()
    }
    ySpinBox.onValueChanged: {
        selected.sy = ySpinBox.value
        onValueChanged()
    }
    thetaSpinBox.onValueChanged: {
        selected.theta = thetaSpinBox.value
        onValueChanged()
    }
    sizeSpinBox.onValueChanged: {
        selected.size = sizeSpinBox.value
        onValueChanged()
    }
    rSpinBox.onValueChanged: {
        selected.r = rSpinBox.value
        rSlider.value = selected.r
        onValueChanged()
    }
    rSlider.onValueChanged: {
        selected.r = parseInt(rSlider.value)
        rSpinBox.value = selected.r
        onValueChanged()
    }
    gSpinBox.onValueChanged: {
        selected.g = gSpinBox.value
        gSlider.value = selected.g
    }
    gSlider.onValueChanged: {
        selected.g = parseInt(gSlider.value)
        gSpinBox.value = selected.g
        onValueChanged()
    }
    bSpinBox.onValueChanged: {
        selected.b = bSpinBox.value
        bSlider.value = selected.b
    }
    bSlider.onValueChanged: {
        selected.b = parseInt(bSlider.value)
        bSpinBox.value = selected.b
        onValueChanged()
    }
}
