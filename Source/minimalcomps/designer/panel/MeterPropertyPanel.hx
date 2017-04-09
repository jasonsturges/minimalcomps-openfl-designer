package minimalcomps.designer.panel;

import minimalcomps.components.Label;
import minimalcomps.components.Meter;
import minimalcomps.components.NumericStepper;

import openfl.display.DisplayObjectContainer;
import openfl.events.Event;


class MeterPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var valueLabel:Label;
    private var valueComponent:NumericStepper;

    private var minimumLabel:Label;
    private var minimumComponent:NumericStepper;

    private var maximumLabel:Label;
    private var maximumComponent:NumericStepper;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(parent, xpos, ypos);

        valueLabel = new Label(this, PropertyPanel.LABEL_X, PropertyPanel.VERTICAL_OFFSET * 1);
        valueLabel.text = "Value";
        valueComponent = new NumericStepper(this, PropertyPanel.COMPONENT_X, PropertyPanel.VERTICAL_OFFSET * 1);
        valueComponent.minimum = 0;
        valueComponent.addEventListener(Event.CHANGE, valueChangeHandler);

        minimumLabel = new Label(this, PropertyPanel.LABEL_X, PropertyPanel.VERTICAL_OFFSET * 2);
        minimumLabel.text = "Minimum";
        minimumComponent = new NumericStepper(this, PropertyPanel.COMPONENT_X, PropertyPanel.VERTICAL_OFFSET * 2);
        valueComponent.minimum = 0;
        minimumComponent.addEventListener(Event.CHANGE, minimumChangeHandler);

        maximumLabel = new Label(this, PropertyPanel.LABEL_X, PropertyPanel.VERTICAL_OFFSET * 3);
        maximumLabel.text = "Maximum";
        maximumComponent = new NumericStepper(this, PropertyPanel.COMPONENT_X, PropertyPanel.VERTICAL_OFFSET * 3);
        valueComponent.minimum = 0;
        maximumComponent.addEventListener(Event.CHANGE, maximumChangeHandler);
    }

    private function valueChangeHandler(event:Event):Void {
        var c:Meter = cast component;

        c.value = valueComponent.value;
    }

    private function minimumChangeHandler(event:Event):Void {
        var c:Meter = cast component;

        c.minimum = minimumComponent.value;
    }

    private function maximumChangeHandler(event:Event):Void {
        var c:Meter = cast component;

        c.maximum = maximumComponent.value;
    }

    override public function dispose():Void {
        valueComponent.removeEventListener(Event.CHANGE, valueChangeHandler);
        minimumComponent.removeEventListener(Event.CHANGE, minimumChangeHandler);
        maximumComponent.removeEventListener(Event.CHANGE, maximumChangeHandler);
    }

}
