package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.Label;
import minimalcomps.designer.panel.property.CheckBoxProperty;
import minimalcomps.designer.panel.property.InputTextProperty;
import openfl.display.DisplayObjectContainer;


class LabelPropertyPanel extends PropertyPanel {

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

        var label:Label = cast _component;

        _properties.push(new InputTextProperty("text", label.text, _vbox));
        _properties.push(new CheckBoxProperty("autoSize", label.autoSize, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        var label:Label = cast _component;
        label.text = "label text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}
