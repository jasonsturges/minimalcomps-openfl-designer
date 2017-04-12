package minimalcomps.designer.panel.property;

import minimalcomps.components.ColorChooser;
import minimalcomps.designer.event.PropertyEvent;
import openfl.display.DisplayObjectContainer;
import openfl.events.Event;


class ColorChooserProperty extends AbstractProperty {

    //------------------------------
    //  model
    //------------------------------

    private var _component:ColorChooser;
    private var _value:UInt;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(propertyName:String, value:UInt = 0xff0000, parent:DisplayObjectContainer = null) {
        _value = value;

        super(propertyName, parent);
    }

    override private function addChildren() {
        super.addChildren();

        _component = new ColorChooser(this);
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
