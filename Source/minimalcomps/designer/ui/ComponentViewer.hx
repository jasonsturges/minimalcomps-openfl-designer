package minimalcomps.designer.ui;

import minimalcomps.components.Component;
import minimalcomps.components.ScrollPane;
import openfl.display.DisplayObjectContainer;
import openfl.events.Event;


class ComponentViewer extends ScrollPane {

    //------------------------------
    //  model
    //------------------------------

    private var _component:Component;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(parent, xpos, ypos);

        color = 0x7a7a7a;
        showGrid = true;
        gridSize = 10;
        gridColor = 0x9a9aa0;
    }

    override private function addChildren() {
        super.addChildren();
    }

    override private function onInvalidate(event:Event):Void {
        super.onInvalidate(event);
    }

    public function bind(component:Component):Void {
        if (_component != null) {
            removeChild(_component);
        }

        _component = component;
        addChild(component);
    }

}
