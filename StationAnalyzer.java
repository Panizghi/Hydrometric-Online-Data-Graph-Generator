package sample;
import org.knowm.xchart.XYChart;

import java.util.ArrayList;
import java.util.stream.DoubleStream;
import java.util.stream.Stream;

public class StationAnalyzer {
    private final Stream<WaterLevel> waterLevelStream;

    public StationAnalyzer(Stream<WaterLevel> waterLevelStream) {
        this.waterLevelStream = waterLevelStream;
    }

    public double averageWaterLevel() {
        /*
         This method should use Java Streams to map the `waterLevelStream` to just its water
         level data, and then use the `average()` method of the `DoubleStream` class. Note that this returns
         an `OptionalDouble`, so you need to convert it to a primitive `double`.
         */
        return this.waterLevelStream.mapToDouble(s -> s.getValue()).average().orElse(0);
    }

    public XYChart createChart() {
        var chart = new XYChart(1920, 1080);
        chart.setTitle("Water Levels");
        chart.setXAxisTitle("Time");
        chart.setYAxisTitle("Value");

        var xData = new ArrayList<Long>();
        var yData = new ArrayList<Double>();

        /*
        Iterate the `waterLevelStream`, and for each `WaterLevel` instance, add the respective data to `xData` and `yData`
         */
        this.waterLevelStream.forEach(waterLevel -> {
            xData.add(waterLevel.getInstant().getEpochSecond());
            yData.add(waterLevel.getValue());
        });
        chart.addSeries("values", xData, yData);

        return chart;
    }
}
