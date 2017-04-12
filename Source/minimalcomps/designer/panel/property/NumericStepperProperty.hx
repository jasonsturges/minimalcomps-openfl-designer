package minimalcomps.designer.panel.property;

import minimalcomps.components.NumericStepper;
import minimalcomps.designer.event.PropertyEvent;
import openfl.display.DisplayObjectContainer;
import openfl.events.Event;


class NumericStepperProperty extends AbstractProperty {

    //------------------------------
    //  model
    //------------------------------

    private var _component:NumericStepper;
    private var _minimum:Float;
    private var _maximum:Float;
    private var _value:Float;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(propertyName:String, value:Float = 0, minimum:Float = 0, maximum:Float = 100, parent:DisplayObjectContainer = null) {
        _minimum = minimum;
        _maximum = maximum;
        _value = value;

        super(propertyName, parent);
    }

    override private function addChildren() {
        super.addChildren();

        _component = new NumericStepper(this);
        _component.minimum = _minimum;
        _component.maximum = _maximum;
        _component.value = _value;

        _component.addEventListener(Event.CHANGE, changeHandler);
    }

    private function changeHandler(event:Event):Void {
        dispatchEvent(new PropertyEvent(PropertyEvent.CHANGE, _propertyName, _component.value));
    }

    override public function dispose():Void {
        super.dispose();

        _component.removeEventListener(Event.CHANGE, changeHandler);
    }

}
