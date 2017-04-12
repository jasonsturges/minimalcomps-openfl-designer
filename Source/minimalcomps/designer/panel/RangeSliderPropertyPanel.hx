package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.RangeSlider;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class RangeSliderPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _rangeSlider:RangeSlider;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _rangeSlider = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new NumericStepperProperty("minimum", _rangeSlider.minimum, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("maximum", _rangeSlider.maximum, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("lowValue", _rangeSlider.lowValue, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("highValue", _rangeSlider.highValue, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("labelPrecision", _rangeSlider.labelPrecision, 0, 100, _vbox));
        _properties.push(new NumericStepperProperty("tick", _rangeSlider.tick, 0, 100, _vbox));
    }

    override public function initialize():Void {
        super.initialize();
    }

    override public function dispose():Void {
        super.dispose();
    }

}
