package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.Window;
import minimalcomps.designer.panel.property.CheckBoxProperty;
import minimalcomps.designer.panel.property.ColorChooserProperty;
import minimalcomps.designer.panel.property.InputTextProperty;
import openfl.display.DisplayObjectContainer;


class WindowPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _window:Window;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _window = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("title", _window.title, _vbox));
        _properties.push(new CheckBoxProperty("hasCloseButton", _window.hasCloseButton, _vbox));
        _properties.push(new CheckBoxProperty("hasMinimizeButton", _window.hasMinimizeButton, _vbox));
        _properties.push(new CheckBoxProperty("draggable", _window.draggable, _vbox));
        _properties.push(new CheckBoxProperty("shadow", _window.shadow, _vbox));
        _properties.push(new ColorChooserProperty("color", _window.color, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _window.title = "Title text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}
