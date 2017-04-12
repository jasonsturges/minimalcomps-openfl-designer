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


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        var meter:Meter = cast _component;

        _properties.push(new InputTextProperty("label", meter.label, _vbox));
        _properties.push(new NumericStepperProperty("value", meter.value, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("minimum", meter.minimum, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("maximum", meter.maximum, 0, 100, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        var meter:Meter = cast _component;
        meter.label = "label text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}
