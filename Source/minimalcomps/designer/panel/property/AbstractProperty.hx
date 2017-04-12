package minimalcomps.designer.panel.property;

import minimalcomps.components.Label;
import minimalcomps.components.HBox;
import openfl.display.DisplayObjectContainer;


class AbstractProperty extends HBox {

    //------------------------------
    //  model
    //------------------------------

    private var _propertyName:String;
    private var _label:Label;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(propertyName:String, parent:DisplayObjectContainer = null) {
        _propertyName = propertyName;

        super(parent);
    }

    override private function addChildren():Void {
        super.addChildren();

        _label = new Label(this);
        _label.text = _propertyName;
        _label.autoSize = false;
        _label.width = 100;
    }

    public function dispose():Void {
        _label = null;
    }

}
