package minimalcomps.designer.panel.property;

import minimalcomps.components.InputText;
import minimalcomps.designer.event.PropertyEvent;
import openfl.display.DisplayObjectContainer;
import openfl.events.Event;


class InputTextProperty extends AbstractProperty {

    //------------------------------
    //  model
    //------------------------------

    private var _component:InputText;
    private var _text:String;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(propertyName:String, text:String, parent:DisplayObjectContainer = null) {
        _text = text;

        super(propertyName, parent);
    }

    override private function addChildren() {
        super.addChildren();

        _component = new InputText(this);
        _component.text = _text;

        _component.addEventListener(Event.CHANGE, changeHandler);
    }

    private function changeHandler(event:Event):Void {
        dispatchEvent(new PropertyEvent(PropertyEvent.CHANGE, _propertyName, _component.text));
    }

    override public function dispose():Void {
        super.dispose();

        _component.removeEventListener(Event.CHANGE, changeHandler);
    }

}
