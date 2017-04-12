package minimalcomps.designer.panel;

import minimalcomps.components.Component;
import minimalcomps.components.ComboBox;
import minimalcomps.designer.panel.property.CheckBoxProperty;
import minimalcomps.designer.panel.property.ColorChooserProperty;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class ComboBoxPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _comboBox:ComboBox;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _comboBox = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _properties.push(new InputTextProperty("defaultLabel", _comboBox.defaultLabel, _vbox));
        _properties.push(new NumericStepperProperty("listItemHeight", _comboBox.listItemHeight, 0, 50, _vbox));
        _properties.push(new NumericStepperProperty("numVisibleItems", _comboBox.numVisibleItems, 0, 10, _vbox));
        _properties.push(new CheckBoxProperty("autoHideScrollBar", _comboBox.autoHideScrollBar, _vbox));
        _properties.push(new CheckBoxProperty("alternateRows", _comboBox.alternateRows, _vbox));
        _properties.push(new ColorChooserProperty("defaultColor", _comboBox.defaultColor, _vbox));
        _properties.push(new ColorChooserProperty("selectedColor", _comboBox.selectedColor, _vbox));
        _properties.push(new ColorChooserProperty("alternateColor", _comboBox.alternateColor, _vbox));
        _properties.push(new ColorChooserProperty("rolloverColor", _comboBox.rolloverColor, _vbox));
    }

    override public function initialize():Void {
        super.initialize();

        _comboBox.defaultLabel = "Default label";
        _comboBox.addItem({label: "Item 1"});
        _comboBox.addItem({label: "Item 2"});
        _comboBox.addItem({label: "Item 3"});
    }

    override public function dispose():Void {
        super.dispose();
    }

}
