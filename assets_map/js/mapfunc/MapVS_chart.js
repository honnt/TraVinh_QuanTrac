function render_line_chart(div_id, data_chart, name_title, key, data_line) {
    am4core.useTheme(am4themes_animated);
    am4core.ready(function () {

        /** Remove Logo **/
        $("g[opacity='0.3']").remove();
        $("g[opacity='0.4']").remove();
        var chart = am4core.create(div_id, am4charts.XYChart);
        chart.data = data_chart;

        chart.logo.height = -500;
        chart.fontSize = 13;
        chart.dateFormatter.inputDateFormat = "HH:mm:ss, dd/MM/yyyy";

        var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
        dateAxis.renderer.minGridDistance = 30;
        dateAxis.baseInterval = {
            "timeUnit": "minute",
            "count": 1
        }
        dateAxis.tooltipDateFormat = "HH:mm:ss, dd/MM/yyyy";

        var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
        valueAxis.title.text = "";

        var series = chart.series.push(new am4charts.LineSeries());
        series.dataFields.valueY = data_line;
        series.dataFields.dateX = key;
        /* series.name = ""; */
        series.strokeWidth = 2;
        series.tensionX = 0.7;
        series.stroke = "#007bff";
        series.fill = "#007bff";
        series.fillOpacity = 0.3;
        series.yAxis = valueAxis;
        series.tooltipText = "{name}\n[bold font-size: 13]{valueY}[/]";

        chart.cursor = new am4charts.XYCursor();
        chart.cursor.lineY.opacity = 0;
        chart.scrollbarX = new am4charts.XYChartScrollbar();
        chart.scrollbarX.series.push(series);

        var title = chart.titles.create();
        title.text = name_title;
        title.fontSize = 25;
        title.fontFamily = "Arial";
        title.marginBottom = 30;

        chart.scrollbarX = new am4charts.XYChartScrollbar();
        chart.scrollbarX.series.push(series);
        chart.scrollbarX.parent = chart.bottomAxesContainer;

        function customizeGrip(grip) {
            grip.icon.disabled = true;
            grip.background.disabled = false;

            var img = grip.createChild(am4core.Rectangle);
            img.width = 10;
            img.height = 10;
            img.fill = am4core.color("#999");
            img.rotation = 45;
            img.align = "center";
            img.valign = "middle";
        }
        customizeGrip(chart.scrollbarX.startGrip);
        customizeGrip(chart.scrollbarX.endGrip);
    });
};
