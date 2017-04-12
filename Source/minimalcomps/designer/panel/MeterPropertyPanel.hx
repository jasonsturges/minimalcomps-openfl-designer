package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.Meter;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class MeterPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _meter:Meter;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _meter = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("label", _meter.label, _vbox));
        _properties.push(new NumericStepperProperty("value", _meter.value, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("minimum", _meter.minimum, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("maximum", _meter.maximum, 0, 100, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _meter.label = "label text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}
