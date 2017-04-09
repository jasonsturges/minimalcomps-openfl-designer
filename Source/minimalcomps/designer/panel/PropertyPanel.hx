package minimalcomps.designer.panel;

import minimalcomps.components.ColorChooser;
import minimalcomps.components.IndicatorLight;
import minimalcomps.components.InputText;
import minimalcomps.components.CheckBox;
import minimalcomps.components.Component;
import minimalcomps.components.Label;
import minimalcomps.components.NumericStepper;
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


    private var _component:Component;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(parent, xpos, ypos);
    }

    public function attach(component:Component, ?properties:Array<String>):Void {
        _component = component;

        if (properties == null)
            return;

        var dy:Float = 10;

        for (property in properties) {
            var label:Label = new Label(this, LABEL_X, dy);
            label.text = property;

            switch(property) {
                case "label":
                    var it:InputText;
                    it = new InputText(this, COMPONENT_X, dy, function(event:Event):Void {
                        Reflect.setProperty(_component, "label", it.text);
                    });

                case "color":
                    var cc:ColorChooser;
                    cc = new ColorChooser(this, COMPONENT_X, dy, 0xff0000, function(event:Event):Void {
                        Reflect.setProperty(_component, property, cc.value);
                    });
                    Reflect.setProperty(_component, property, cc.value);

                case "value", "minimum", "maximum":
                    var ns:NumericStepper;
                    ns = new NumericStepper(this, COMPONENT_X, dy, function(event:Event):Void {
                        Reflect.setProperty(_component, property, ns.value);
                    });
                    ns.minimum = 0;
                    ns.maximum = 100;

                case "selected", "isLit":
                    var cb:CheckBox;
                    cb = new CheckBox(this, COMPONENT_X, dy, function(event:Event):Void {
                        Reflect.setProperty(_component, property, cb.selected);
                    });
                    cb.selected = Reflect.getProperty(_component, property);

                case "flash":
                    var flash:CheckBox;
                    flash = new CheckBox(this, COMPONENT_X, dy, function(event:Event):Void {
                        var indicator:IndicatorLight = cast(_component, IndicatorLight);
                        if(indicator.isFlashing)
                            indicator.flash(0);
                        else
                            indicator.flash(500);
                    });
            }

            dy += VERTICAL_OFFSET;
        }
    }

    public function dispose():Void {
    }

}
