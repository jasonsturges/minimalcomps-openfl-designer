package minimalcomps.designer.panel;

import minimalcomps.components.VBox;
import minimalcomps.components.Component;
import minimalcomps.components.Panel;
import minimalcomps.designer.panel.property.AbstractProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class PropertyPanel extends Panel {

    //------------------------------
    //  model
    //------------------------------

    private var _component:Component;
    private var _properties:Array<AbstractProperty>;
    private var _vbox:VBox;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _component = component;
        _properties = [];

        initialize();

        super(parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _vbox = new VBox(this, 4, 4);
        _vbox.width = this.width - 8;
        _vbox.height = this.height - 8;

        // Common properties
        _properties.push(new NumericStepperProperty("x", _component.x, 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("y", _component.y, 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("width", _component.width, 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("height", _component.height, 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("scaleX", _component.scaleX, 1, 10, _vbox));
        _properties.push(new NumericStepperProperty("scaleY", _component.scaleY, 1, 10, _vbox));
    }

    public function initialize():Void {
    }

    public function dispose():Void {
        while(_properties.length > 0) {
            var p:AbstractProperty = _properties.shift();
            p.dispose();
            _vbox.removeChild(p);
        }
    }

}
