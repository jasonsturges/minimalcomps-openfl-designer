package minimalcomps.designer.panel;

import minimalcomps.components.Accordion;
import minimalcomps.components.Component;
import openfl.display.DisplayObjectContainer;


class AccordionPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _accordion:Accordion;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _accordion = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();
    }

    override public function initialize():Void {
        super.initialize();

        _accordion.addWindow("Window 1");
        _accordion.addWindow("Window 2");
        _accordion.addWindow("Window 3");
    }

    override public function dispose():Void {
        super.dispose();
    }

}
