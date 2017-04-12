package minimalcomps.designer.panel;

import minimalcomps.components.CheckBox;
import minimalcomps.components.Component;
import minimalcomps.designer.panel.property.CheckBoxProperty;
import minimalcomps.designer.panel.property.InputTextProperty;
import openfl.display.DisplayObjectContainer;


class CheckBoxPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _checkBox:CheckBox;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _checkBox = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("label", _checkBox.label, _vbox));
        _properties.push(new CheckBoxProperty("selected", _checkBox.selected, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _checkBox.label = "Label text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}
