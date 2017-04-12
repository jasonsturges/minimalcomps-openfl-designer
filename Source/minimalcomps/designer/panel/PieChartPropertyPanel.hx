package minimalcomps.designer.panel;

import minimalcomps.charts.PieChart;
import minimalcomps.components.Component;
import minimalcomps.designer.data.DataProvider;
import minimalcomps.designer.panel.property.InputTextProperty;
import minimalcomps.designer.panel.property.NumericStepperProperty;
import openfl.display.DisplayObjectContainer;


class PieChartPropertyPanel extends PropertyPanel {

    //------------------------------
    //  model
    //------------------------------

    private var _pieChart:PieChart;


    //------------------------------
    //  lifecycle
    //------------------------------

    public function new(component:Component, parent:DisplayObjectContainer = null, xpos:Float = 0.0, ypos:Float = 0.0) {
        _pieChart = cast component;

        super(component, parent, xpos, ypos);
    }

    override private function addChildren() {
        super.addChildren();
    }

    override public function initialize():Void {
        super.initialize();
        
        _pieChart.data = DataProvider.randomDistribution();
    }

    override public function dispose():Void {
        super.dispose();
    }

}
