import QtQuick 2.5

SelectionForm {
    property var selected
    signal propertiesChanged
    resolution: 256

    onSelectedChanged: {
        if(selected !== null) {
            sx = Qt.binding(function(){ return selected.sx; });
            sy = Qt.binding(function(){ return selected.sy; });
            theta = Qt.binding(function(){ return selected.theta; });
            size = Qt.binding(function(){ return selected.size; });
            r = Qt.binding(function(){ return selected.r; });
            g = Qt.binding(function(){ return selected.g; });
            b = Qt.binding(function(){ return selected.b; });
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
