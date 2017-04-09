package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.Panel;

import openfl.display.DisplayObjectContainer;
import openfl.events.Event;


class PropertyPanel extends Panel {

    //------------------------------
    //  model
    //------------------------------

    public static inline var LABEL_X:Int = 10;
    public static inline var COMPONENT_X:Int = 100;
    public static inline var VERTICAL_OFFSET:Int = 24;


    public var component:Component;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(parent, xpos, ypos);
    }

    public function dispose():Void {
    }

}
