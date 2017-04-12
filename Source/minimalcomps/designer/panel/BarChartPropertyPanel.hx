package minimalcomps.designer.panel;

import minimalcomps.charts.BarChart;
import minimalcomps.components.Component;
import minimalcomps.designer.data.DataProvider;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class BarChartPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _barChart:BarChart;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _barChart = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();
    }

    override public function initialize():Void {
        super.initialize();
        
        _barChart.data = DataProvider.randomSeries();
    }

    override public function dispose():Void {
        super.dispose();
    }

}
