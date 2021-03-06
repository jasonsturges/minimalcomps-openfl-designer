package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.Knob;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class KnobPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _knob:Knob;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _knob = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();
        
        _properties.push(new InputTextProperty("label", _knob.label, _vbox));
        _properties.push(new NumericStepperProperty("value", _knob.value, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("minimum", _knob.minimum, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("maximum", _knob.maximum, 0, 100, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _knob.label = "Label text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}
