package minimalcomps.designer.event;

import openfl.events.Event;


class PropertyEvent<T> extends Event {

    //------------------------------
    //  constants
    //------------------------------

    public static inline var CHANGE:String = "minimalcomps.designer.event.PropertyEvent.CHANGE";


    //------------------------------
    //  model
    //------------------------------

    public var name:String;
    public var value:T;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(type:String, name:String, value:T) {
        super(type, true);

        this.name = name;
        this.value = value;
    }

}