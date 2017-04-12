package minimalcomps.designer;

import minimalcomps.components.Component;
import minimalcomps.components.Style;
import minimalcomps.designer.event.ComponentEvent;
import minimalcomps.designer.event.PropertyEvent;
import minimalcomps.designer.panel.PropertyPanel;
import minimalcomps.designer.ui.ComponentLibrary;
import minimalcomps.designer.ui.ComponentProperties;
import minimalcomps.designer.ui.ComponentViewer;
import openfl.display.Sprite;
import openfl.events.Event;


class Designer extends Sprite {

    //------------------------------
    //  model
    //------------------------------

    public static inline var COMPONENT_LIST_WIDTH:Int = 150;
    public static inline var PROPERTY_PANEL_WIDTH:Int = 250;
    public static inline var PADDING:Int = 4;

    private var _component:Component;
    private var _componentLibrary:ComponentLibrary;
    private var _componentProperties:ComponentProperties;
    private var _componentViewer:ComponentViewer;
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

        Style.setStyle(Style.DARK);
    }

    /**
     * addedToStageHandler
     */
    private function addedToStageHandler(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);

        _componentLibrary = new ComponentLibrary(this);
        _componentLibrary.addEventListener(ComponentEvent.CHANGE, componentChangeHandler);

        _componentViewer = new ComponentViewer(this);

        _componentProperties = new ComponentProperties(this);
        _componentProperties.addEventListener(PropertyEvent.CHANGE, propertyChangeHandler);
    }

    public function resize(w:Float, h:Float):Void {
        _width = w;
        _height = h;

        _componentLibrary.x = PADDING;
        _componentLibrary.y = PADDING;
        _componentLibrary.width = COMPONENT_LIST_WIDTH;
        _componentLibrary.height = h - (PADDING * 2);

        _componentViewer.x = COMPONENT_LIST_WIDTH + (PADDING * 2);
        _componentViewer.y = PADDING;
        _componentViewer.width = w - COMPONENT_LIST_WIDTH - PROPERTY_PANEL_WIDTH - (PADDING * 4);
        _componentViewer.height = h - (PADDING * 2);

        _componentProperties.x = w - PROPERTY_PANEL_WIDTH - 4;
        _componentProperties.y = PADDING;
        _componentProperties.width = PROPERTY_PANEL_WIDTH;
        _componentProperties.height = h - (PADDING * 2);
    }

    private function componentChangeHandler<T>(event:ComponentEvent<T>):Void {
        displayComponent(event.classType);
    }

    private function displayComponent<T>(type:Class<T>):Void {
        _component = cast Type.createInstance(type, []);
        _componentViewer.bind(_component);
        _componentProperties.bind(_component);
    }

    private function propertyChangeHandler<T>(event:PropertyEvent<T>):Void {
        Reflect.setProperty(_component, event.name, event.value);
    }

    /**
     * removedFromStageHandler
     */
    private function removedFromStageHandler(event:Event):Void {
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    /**
     * dispose
     */
    public function dispose():Void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
    }
}