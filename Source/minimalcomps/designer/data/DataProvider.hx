package minimalcomps.designer.data;

class DataProvider {

    /**
     *  Random series generation for bar and line chart data.
     *  
     *  @param min Minimum value sof the series.
     *  @param max Maximum value sof the series
     *  @param length Data points in series
     *  @return Array<Dynamic>
     */
    public static function randomSeries(min:Float = 0, max:Float = 10, length:Int = 10):Array<Dynamic> {
        var data:Array<Dynamic> = [];

        for (i in 0 ... length) {
            data.push(cast(Math.random() * 10, Float));
        }

        return data;
    }

    /**
     *  Random distribution generation for pie chart data.
     *  
     *  @param divisions Number of slices in the pie chart
     *  @return Array<Dynamic>
     */
    public static function randomDistribution(divisions:Int = 5):Array<Dynamic> {
        var data:Array<Dynamic> = [];

        for (i in 0 ... divisions) {
            data.push({
                value: Math.random() * 100,
                label: "Value: " + Std.string(i + 1)
            });
        }

        return data;
    }

}