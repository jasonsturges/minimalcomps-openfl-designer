package minimalcomps.designer;

import minimalcomps.components.Window;
import minimalcomps.components.WheelMenu;
import minimalcomps.components.VUISlider;
import minimalcomps.components.VSlider;
import minimalcomps.components.VScrollBar;
import minimalcomps.components.VRangeSlider;
import minimalcomps.components.VBox;
import minimalcomps.components.UISlider;
import minimalcomps.components.TextArea;
import minimalcomps.components.Text;
import minimalcomps.components.Slider;
import minimalcomps.components.ScrollPane;
import minimalcomps.components.ScrollBar;
import minimalcomps.components.RotarySelector;
import minimalcomps.components.RangeSlider;
import minimalcomps.components.RadioButton;
import minimalcomps.components.ProgressBar;
import minimalcomps.components.Panel;
import minimalcomps.components.NumericStepper;
import minimalcomps.components.Meter;
import minimalcomps.components.ListItem;
import minimalcomps.components.Label;
import minimalcomps.components.Knob;
import minimalcomps.components.InputText;
import minimalcomps.components.HRangeSlider;
import minimalcomps.components.HSlider;
import minimalcomps.components.IndicatorLight;
import minimalcomps.components.HUISlider;
import minimalcomps.components.HScrollBar;
import minimalcomps.components.HBox;
import minimalcomps.components.ComboBox;
import minimalcomps.components.ColorChooser;
import minimalcomps.components.CheckBox;
import minimalcomps.components.Accordion;
import minimalcomps.components.Calendar;
import openfl.display.DisplayObject;
import minimalcomps.components.FPSMeter;
import minimalcomps.components.List;
import minimalcomps.components.PushButton;
import minimalcomps.components.Style;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.text.Font;


@:font("Assets/Fonts/pf_ronda_seven.ttf") private class RondaSevenFont extends Font {}


class Designer extends Sprite {

    //------------------------------
    //  model
    //------------------------------

    private var _componentList:List;
    private var _componentHolder:Sprite;
    private var _component:DisplayObject;
    private var _width:Float;
    private var _height:Float;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new() {
        super();

        initialize();
    }

    /**
     * initialize
     */
    public function initialize():Void {
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

        #if js
        Style.fontName = Assets.getFont("pf_ronda_seven").fontName;
        #else
        Font.registerFont(RondaSevenFont);
        Style.fontName = (new RondaSevenFont()).fontName;
        #end

        Style.setStyle(Style.DARK);
    }

    /**
     * addedToStageHandler
     */
    private function addedToStageHandler(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);

        _componentList = new List(this);
        _componentList.addItem({label: "Accordion", type: Accordion});
        _componentList.addItem({label: "Calendar", type: Calendar});
        _componentList.addItem({label: "Check Box", type: CheckBox});
        _componentList.addItem({label: "Color Chooser", type: ColorChooser});
        _componentList.addItem({label: "Combo Box", type: ComboBox});
        _componentList.addItem({label: "FPS Meter", type: FPSMeter});
        _componentList.addItem({label: "H Box", type: HBox});
        _componentList.addItem({label: "H Range Slider", type: HRangeSlider});
        _componentList.addItem({label: "H Scroll Bar", type: HScrollBar});
        _componentList.addItem({label: "H Slider", type: HSlider});
        _componentList.addItem({label: "H UI Slider", type: HUISlider});
        _componentList.addItem({label: "Indicator Light", type: IndicatorLight});
        _componentList.addItem({label: "Input Text", type: InputText});
        _componentList.addItem({label: "Knob", type: Knob});
        _componentList.addItem({label: "Label", type: Label});
        _componentList.addItem({label: "List", type: List});
        _componentList.addItem({label: "List Item", type: ListItem});
        _componentList.addItem({label: "Meter", type: Meter});
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

        _componentHolder = new Sprite();
        addChild(_componentHolder);
    }

    public function resize(w:Float, h:Float):Void {
        _width = w;
        _height = h;

        _componentList.x = 10;
        _componentList.y = 10;
        _componentList.width = w * 0.25;
        _componentList.height = h - 20;

        if (_component != null) {
            _component.x = (w * 0.5) - (_component.width * 0.5);
            _component.y = (h * 0.5) - (_component.height * 0.5);
        }
    }

    private function componentSelectHandler(event:Event):Void {
        trace("Selected: " + _componentList.selectedItem.label);
        displayComponent(_componentList.selectedItem.type);
    }

    private function displayComponent<T>(type:Class<T>):Void {
        while (_componentHolder.numChildren > 0) {
            _componentHolder.removeChildAt(0);
        }

        _component = cast Type.createInstance(type, [this._componentHolder]);
        _component.x = (_width * 0.5) - (_component.width * 0.5);
        _component.y = (_height * 0.5) - (_component.height * 0.5);
    }

    /**
     * removedFromStageHandler
     */
    private function removedFromStageHandler(event:Event):Void {
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

        _componentList.removeEventListener(Event.SELECT, componentSelectHandler);
    }

    /**
     * dispose (IDisposable)
     */
    public function dispose():Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
    }
}