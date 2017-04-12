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


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        var knob:Knob = cast _component;

        _properties.push(new NumericStepperProperty("value", knob.value, 0, 100, _vbox));
        _properties.push(new InputTextProperty("label", "", _vbox));
    }

    override public function initialize():Void {
        super.initialize();
    }

    override public function dispose():Void {
        super.dispose();
    }

}
