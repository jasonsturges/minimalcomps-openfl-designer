package minimalcomps.designer.ui;

import minimalcomps.components.Accordion;
import minimalcomps.components.Calendar;
import minimalcomps.components.ColorChooser;
import minimalcomps.components.ComboBox;
import minimalcomps.components.CheckBox;
import minimalcomps.components.FPSMeter;
import minimalcomps.components.HBox;
import minimalcomps.components.HRangeSlider;
import minimalcomps.components.HScrollBar;
import minimalcomps.components.HSlider;
import minimalcomps.components.HUISlider;
import minimalcomps.components.IndicatorLight;
import minimalcomps.components.InputText;
import minimalcomps.components.Knob;
import minimalcomps.components.Label;
import minimalcomps.components.List;
import minimalcomps.components.ListItem;
import minimalcomps.components.Meter;
import minimalcomps.components.NumericStepper;
import minimalcomps.components.Panel;
import minimalcomps.components.PushButton;
import minimalcomps.components.ProgressBar;
import minimalcomps.components.RadioButton;
import minimalcomps.components.RangeSlider;
import minimalcomps.components.RotarySelector;
import minimalcomps.components.ScrollBar;
import minimalcomps.components.ScrollPane;
import minimalcomps.components.Slider;
import minimalcomps.components.Text;
import minimalcomps.components.TextArea;
import minimalcomps.components.UISlider;
import minimalcomps.components.VBox;
import minimalcomps.components.VRangeSlider;
import minimalcomps.components.VScrollBar;
import minimalcomps.components.VSlider;
import minimalcomps.components.VUISlider;
import minimalcomps.components.WheelMenu;
import minimalcomps.components.Window;

import minimalcomps.designer.event.ComponentEvent;

import openfl.display.DisplayObjectContainer;
import openfl.events.Event;


class ComponentLibrary extends Panel {

    //------------------------------
    //  model
    //------------------------------

    private var _titleLabel:Label;
    private var _componentList:List;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();

        _titleLabel = new Label(this, 4, 4);
        _titleLabel.text = "Library";

        _componentList = new List(this, 2, 30);
        _componentList.addItem({label: "Accordion", type: Accordion});
        _componentList.addItem({label: "Calendar", type: Calendar});
        _componentList.addItem({label: "Check Box", type: CheckBox, props: ["label", "selected"]});
        _componentList.addItem({label: "Color Chooser", type: ColorChooser});
        _componentList.addItem({label: "Combo Box", type: ComboBox});
        _componentList.addItem({label: "FPS Meter", type: FPSMeter});
        _componentList.addItem({label: "H Box", type: HBox});
        _componentList.addItem({label: "H Range Slider", type: HRangeSlider});
        _componentList.addItem({label: "H Scroll Bar", type: HScrollBar});
        _componentList.addItem({label: "H Slider", type: HSlider});
        _componentList.addItem({label: "H UI Slider", type: HUISlider});
        _componentList.addItem({label: "Indicator Light", type: IndicatorLight, props: ["label", "color", "isLit", "flash"]});
        _componentList.addItem({label: "Input Text", type: InputText});
        _componentList.addItem({label: "Knob", type: Knob});
        _componentList.addItem({label: "Label", type: Label});
        _componentList.addItem({label: "List", type: List});
        _componentList.addItem({label: "List Item", type: ListItem});
        _componentList.addItem({label: "Meter", type: Meter, props: ["value", "minimum", "maximum"]});
        _componentList.addItem({label: "Numeric Stepper", type: NumericStepper});
        _componentList.addItem({label: "Panel", type: Panel});
        _componentList.addItem({label: "Progress Bar", type: ProgressBar});
        _componentList.addItem({label: "Push Button", type: PushButton});
        _componentList.addItem({label: "Radio Button", type: RadioButton});
        _componentList.addItem({label: "Range Slider", type: RangeSlider});
        _componentList.addItem({label: "Rotary Selector", type: RotarySelector});
        _componentList.addItem({label: "Scroll Bar", type: ScrollBar});
        _componentList.addItem({label: "Scroll Pane", type: ScrollPane});
        _componentList.addItem({label: "Slider", type: Slider});
        _componentList.addItem({label: "Text", type: Text});
        _componentList.addItem({label: "Text Area", type: TextArea});
        _componentList.addItem({label: "UI Slider", type: UISlider});
        _componentList.addItem({label: "V Box", type: VBox});
        _componentList.addItem({label: "V Range Slider", type: VRangeSlider});
        _componentList.addItem({label: "V Scroll Bar", type: VScrollBar});
        _componentList.addItem({label: "V Slider", type: VSlider});
        _componentList.addItem({label: "V UI Slider", type: VUISlider});
        _componentList.addItem({label: "Wheel Menu", type: WheelMenu});
        _componentList.addItem({label: "Window", type: Window});

        _componentList.addEventListener(Event.SELECT, componentSelectHandler);
    }

    override private function onInvalidate(event:Event):Void {
        super.onInvalidate(event);

        _componentList.setSize(width - 4, height - 32);
    }

    private function componentSelectHandler(event:Event):Void {
        var selectedItem:Dynamic = _componentList.selectedItem;

        dispatchEvent(new ComponentEvent(ComponentEvent.CHANGE, selectedItem.type));
    }

}
