package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.UISlider;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class UISliderPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _uiSlider:UISlider;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _uiSlider = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("label", _uiSlider.label, _vbox));
        _properties.push(new NumericStepperProperty("value", _uiSlider.value, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("minimum", _uiSlider.minimum, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("maximum", _uiSlider.maximum, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("labelPrecision", _uiSlider.labelPrecision, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("tick", _uiSlider.tick, 0, 100, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _uiSlider.label = "Label text";
    }

    override public function dispose():Void {
        super.dispose();
    }

}
