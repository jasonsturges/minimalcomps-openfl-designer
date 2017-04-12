package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.FPSMeter;
import minimalcomps.designer.panel.property.InputTextProperty;
import openfl.display.DisplayObjectContainer;


class FPSMeterPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _fpsMeter:FPSMeter;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _fpsMeter = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("prefix", _fpsMeter.prefix, _vbox));
    }

    override public function initialize():Void {
        super.initialize();
    }

    override public function dispose():Void {
        super.dispose();
    }

}
