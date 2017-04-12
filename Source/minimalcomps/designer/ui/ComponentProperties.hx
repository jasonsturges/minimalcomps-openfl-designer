package minimalcomps.designer.ui;

import minimalcomps.components.CheckBox;
import minimalcomps.components.VBox;
import minimalcomps.components.Component;
import minimalcomps.components.ScrollPane;
import minimalcomps.designer.panel.PropertyPanel;
import minimalcomps.designer.panel.PropertyPanel;
import minimalcomps.designer.panel.CheckBoxPropertyPanel;
import openfl.display.DisplayObjectContainer;


class ComponentProperties extends ScrollPane {

    //------------------------------
    //  model
    //------------------------------

    private var _component:Component;
    private var _panels:Array<PropertyPanel>;
    private var _vbox:VBox;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        super(parent, xpos, ypos);

        _panels = [];
    }

    override private function addChildren() {
        super.addChildren();

        _vbox = new VBox(this, 4, 4);
        _vbox.width = this.width - 8;
        _vbox.height = this.height - 8;
    }

    public function bind(component:Component):Void {
        _component = component;

        clearPanels();

        var panel:PropertyPanel;

        switch(Type.getClass(_component)) {
            case CheckBox:
                panel = new CheckBoxPropertyPanel(_component, _vbox);

            default:
                panel = new PropertyPanel(_component, _vbox);
        }

        if (panel != null) {
            _panels.push(panel);
            panel.width = width;
            panel.height = height;
        }
    }

    private function clearPanels():Void {
        while (_panels.length > 0) {
            var panel:PropertyPanel = _panels.shift();
            panel.dispose();
            _vbox.removeChild(panel);
        }
    }

}
