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


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        var indicatorLight:IndicatorLight = cast _component;

        _properties.push(new InputTextProperty("label", indicatorLight.label, _vbox));
        _properties.push(new CheckBoxProperty("isLit", indicatorLight.isLit, _vbox));
        _properties.push(new ColorChooserProperty("color", indicatorLight.color, _vbox));
    }

    override public function initialize():Void {
        var indicatorLight:IndicatorLight = cast _component;
        indicatorLight.isLit = true;
        indicatorLight.label = "label text";
        indicatorLight.color = 0xff0000;

        super.initialize();
    }

    override public function dispose():Void {
        super.dispose();
    }

}
