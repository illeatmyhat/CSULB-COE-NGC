import QtQuick 2.5

SelectionForm {
    property var selected
    signal propertiesChanged
    resolution: 256

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

    function updateModel(model, field, viewmodel) {
        model[field] = viewmodel;
        propertiesChanged();
    }

    onSxChanged: updateModel(selected, "sx", sx);
    onSyChanged: updateModel(selected, "sy", sy);
    onThetaChanged: updateModel(selected, "theta", theta);
    onSizeChanged: updateModel(selected, "size", size);
    onRChanged: updateModel(selected, "r", r);
    onGChanged: updateModel(selected, "g", g);
    onBChanged: updateModel(selected, "b", b);
}
