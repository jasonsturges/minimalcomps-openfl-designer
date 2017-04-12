package minimalcomps.designer.panel.property;

import minimalcomps.components.CheckBox;
import minimalcomps.designer.event.PropertyEvent;
import openfl.display.DisplayObjectContainer;
import openfl.events.Event;
import openfl.events.MouseEvent;


class CheckBoxProperty extends AbstractProperty {

    //------------------------------
    //  model
    //------------------------------

    private var _component:CheckBox;
    private var _selected:Bool;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(propertyName:String, selected:Bool, parent:DisplayObjectContainer = null) {
        _selected = selected;

        super(propertyName, parent);
    }

    override private function addChildren() {
        super.addChildren();

        _component = new CheckBox(this);
        _component.selected = _selected;

        _component.addEventListener(MouseEvent.CLICK, mouseClickHandler);
    }

    private function mouseClickHandler(event:Event):Void {
        dispatchEvent(new PropertyEvent(PropertyEvent.CHANGE, _propertyName, _component.selected));
    }

    override public function dispose():Void {
        super.dispose();

        _component.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
    }

}
