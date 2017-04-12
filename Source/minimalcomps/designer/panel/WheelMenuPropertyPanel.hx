package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.WheelMenu;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class WheelMenuPropertyPanel extends PropertyPanel {

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
    }

    override public function initialize():Void {
        super.initialize();
        
        var wheelMenu:WheelMenu = cast _component;
        wheelMenu.setItem(1, "One", "One");
        wheelMenu.setItem(2, "Two", "Two");
        wheelMenu.setItem(3, "Three", "Three");
        wheelMenu.setItem(4, "Four", "Four");
        wheelMenu.setItem(5, "Five", "Five");
    }

    override public function dispose():Void {
        super.dispose();
    }

}
