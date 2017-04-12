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

        super(parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _vbox = new VBox(this);
        _vbox.width = this.width;
        _vbox.height = this.height;

        // Common properties
        _properties.push(new NumericStepperProperty("x", 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("y", 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("width", 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("height", 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("scaleX", 0, 1000, _vbox));
        _properties.push(new NumericStepperProperty("scaleY", 0, 1000, _vbox));
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
