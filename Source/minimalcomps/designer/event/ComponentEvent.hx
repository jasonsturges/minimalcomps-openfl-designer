package minimalcomps.designer.event;

import openfl.events.Event;


class ComponentEvent<T> extends Event {

    //------------------------------
    //  constants
    //------------------------------

    public static inline var CHANGE:String = "minimalcomps.designer.event.ComponentEvent.CHANGE";


    //------------------------------
    //  model
    //------------------------------

    public var classType:Class<T>;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(type:String, classType:Class<T>) {
        super(type);

        this.classType = classType;
    }

}