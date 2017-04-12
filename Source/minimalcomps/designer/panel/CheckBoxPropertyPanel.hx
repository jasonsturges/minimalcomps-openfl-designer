package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.designer.panel.property.InputTextProperty;
import openfl.display.DisplayObjectContainer;


class CheckBoxPropertyPanel extends PropertyPanel {

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

        _properties.push(new InputTextProperty("label", "", _vbox));
    }

    override public function initialize():Void {
        super.initialize();
    }

    override public function dispose():Void {
        super.dispose();
    }

}
