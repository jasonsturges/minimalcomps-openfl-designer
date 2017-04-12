package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.ColorChooser;
import minimalcomps.designer.panel.property.CheckBoxProperty;
import openfl.display.DisplayObjectContainer;


class ColorChooserPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _colorChooser:ColorChooser;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _colorChooser = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new CheckBoxProperty("usePopup", _colorChooser.usePopup, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _colorChooser.usePopup = true;
    }

    override public function dispose():Void {
        super.dispose();
    }

}
