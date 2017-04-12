package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.IndicatorLight;
import minimalcomps.designer.panel.property.CheckBoxProperty;
import minimalcomps.designer.panel.property.ColorChooserProperty;
import minimalcomps.designer.panel.property.InputTextProperty;
import openfl.display.DisplayObjectContainer;


class IndicatorLightPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _indicatorLight:IndicatorLight;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _indicatorLight = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("label", _indicatorLight.label, _vbox));
        _properties.push(new CheckBoxProperty("isLit", _indicatorLight.isLit, _vbox));
        _properties.push(new ColorChooserProperty("color", _indicatorLight.color, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _indicatorLight.isLit = true;
        _indicatorLight.label = "Label text";
        _indicatorLight.color = 0xff0000;
    }

    override public function dispose():Void {
        super.dispose();
    }

}
