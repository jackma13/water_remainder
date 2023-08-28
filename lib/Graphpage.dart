import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_remainder/globle_var.dart';
import 'package:water_remainder/show-messure.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graphpage extends StatefulWidget {
  const Graphpage({Key? key}) : super(key: key);

  @override
  State<Graphpage> createState() => _GraphpageState();
}

class _GraphpageState extends State<Graphpage> {
  DateTime now = DateTime.now();
  var show;
  List<charts.Series<DeveloperSeries, String>> seriesList = [];
  bool monthbool = true;
  bool weekbool = false;
  bool daybool = false;
  List<DeveloperSeries> waterlist = [];
  List<DeveloperSeries> spwaterlist = [];
  List<DeveloperSeries> miwaterlist = [];
  List<DeveloperSeries> soylist = [];
  List<DeveloperSeries> shackelist = [];
  List<DeveloperSeries> cowlist = [];
  List<DeveloperSeries> kefirlist = [];
  List<DeveloperSeries> lactoselist = [];
  List<DeveloperSeries> coconutlist = [];
  List<DeveloperSeries> ayranlist = [];
  List<DeveloperSeries> almondlist = [];

  createRandomData() {
    waterlist = [];
    spwaterlist = [];
    miwaterlist = [];
    soylist = [];
    shackelist = [];
    cowlist = [];
    kefirlist = [];
    lactoselist = [];
    coconutlist = [];
    ayranlist = [];
    almondlist = [];
    List nameC = [];
    int c = 0;

    var key = historybox2.keys.toList();
    for (var i = 0; i < historybox2.length; i++) {
      var value = historybox2.get(key[i]);
      if (!nameC.contains(value["name"])) {
        nameC.add(value["name"]);
      }
    }

    if (monthbool) {
      for (var j = 0; j < nameC.length; j++) {
        for (int i = 1; i <= 12; i++) {
          c = 0;

          DateTime lastDayOfMonth = DateTime(now.year, i, 0);
          String monthName = DateFormat('MMM').format(DateTime(2000, i));
          for (var i = 0; i < lastDayOfMonth.day + 1; i++) {
            final currentDate = lastDayOfMonth.add(Duration(days: i + 1));
            final dateName2 = DateFormat('MM-dd-yyyy').format(currentDate);

            for (var i = 0; i < historybox2.length; i++) {
              var value = historybox2.get(key[i]);
              if (nameC[j] == value["name"]) {
                int x = value["ml"];
                value["date"].toString() == dateName2 ? c = c + x : c = c + 0;
              }
            }
          }
          liststore(monthName, nameC, j, c);
        }
      }
    } else if (weekbool) {
      List mondays = [];
      List mondays2 = [];
      DateTime date = DateTime(now.year, now.month, 1);
      DateTime lastDay = DateTime(now.year, now.month, 0);

      while (lastDay.weekday != DateTime.sunday) {
        lastDay = lastDay.subtract(const Duration(days: 1));
        mondays.add(lastDay);
        mondays2.add(DateFormat('MM-dd').format(lastDay));
        break;
      }
      while (date.year == now.year && date.month == now.month) {
        if (date.weekday == DateTime.sunday) {
          final dateName2 = DateFormat('MM-dd').format(date);
          mondays.add(date);
          mondays2.add(dateName2);
        }
        date = date.add(const Duration(days: 1));
      }

      for (var j = 0; j < nameC.length; j++) {
        for (var i = 0; i < mondays.length; i++) {
          List alldate = [];

          for (var j = 0; j < 7; j++) {
            final date = DateTime.parse(mondays[i].toString());
            final currentDate = date.add(Duration(days: j + 1));
            final dateName2 = DateFormat('MM-dd-yyyy').format(currentDate);
            alldate.add(dateName2);
          }

          c = 0;
          for (var i = 0; i < historybox2.length; i++) {
            var value = historybox2.get(key[i]);
            if (nameC[j] == value["name"]) {
              int x = value["ml"];
              alldate.contains(value["date"]) ? c = c + x : c = c + 0;
            }
          }

          liststore(mondays2[i], nameC, j, c);
        }
      }
    } else if (daybool) {
      DateTime lastDayOfMonth = DateTime(now.year, now.month, 0);

      for (var j = 0; j < nameC.length; j++) {
        for (var i = 0; i < lastDayOfMonth.day + 1; i++) {
          final currentDate = lastDayOfMonth.add(Duration(days: i + 1));
          final dateName = DateFormat('E').format(currentDate);
          final dateName2 = DateFormat('MM-dd-yyyy').format(currentDate);
          c = 0;
          for (var i = 0; i < historybox2.length; i++) {
            var value = historybox2.get(key[i]);
            if (nameC[j] == value["name"]) {
              int x = value["ml"];
              if (dateName2 == value["date"]) {
                c = c + x;
              }
            }
          }

          liststore((i + 1).toString() + "\n" + dateName, nameC, j, c);
        }
      }
    }
  }

  void liststore(year, nameC, j, iceGiants) {
    waterlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Water" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xffc36289),
      ),
      cat: "Water",
    ));
    spwaterlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Sparkling water" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xff40a1bf),
      ),
      cat: "Sparkling water",
    ));
    miwaterlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Mineral water" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xffccc03f),
      ),
      cat: "Mineral water",
    ));
    soylist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Soy Milk" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xff4e9dd5),
      ),
      cat: "Soy Milk",
    ));
    shackelist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Milk shake" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xff3ec73e),
      ),
      cat: "Milk shake",
    ));
    cowlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Cow milk" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xff7377f4),
      ),
      cat: "Cow milk",
    ));
    kefirlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Kefir" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xff718ea9),
      ),
      cat: "Kefir",
    ));
    lactoselist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Lactose free milk" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xffcf7175),
      ),
      cat: "Lactose free milk",
    ));
    coconutlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Coconut milk" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        const Color(0xff8d5399),
      ),
      cat: "Coconut milk",
    ));
    ayranlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "ayran" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        Color.fromARGB(255, 107, 251, 119),
      ),
      cat: "ayran",
    ));
    almondlist.add(DeveloperSeries(
      year: year,
      amount: nameC[j] == "Almond milk" ? iceGiants : 0,
      barColor: charts.ColorUtil.fromDartColor(
        Color.fromARGB(255, 217, 116, 237),
      ),
      cat: "Almond milk",
    ));
  }

  @override
  void initState() {
    createRandomData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    seriesList = [
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: waterlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: spwaterlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: miwaterlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: soylist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: miwaterlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: cowlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: kefirlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: lactoselist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: coconutlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: ayranlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
      charts.Series<DeveloperSeries, String>(
        id: 'Sales',
        data: almondlist,
        domainFn: (DeveloperSeries sales, _) => sales.year,
        measureFn: (DeveloperSeries sales, _) => sales.amount,
        colorFn: (DeveloperSeries sales, _) => sales.barColor,
      ),
    ];
    barChart() {
      return charts.BarChart(seriesList,
          animate: true,
          barGroupingType: charts.BarGroupingType.grouped,
          defaultRenderer: charts.BarRendererConfig(
            groupingType: charts.BarGroupingType.groupedStacked,
            weightPattern: [2, 1],
          ),
          behaviors: [
            charts.SlidingViewport(
              charts.SelectionModelType.action,
            ),
            charts.LinePointHighlighter(
              symbolRenderer: TextSymbolRenderer(() => show.toString()),
            ),
            charts.PanBehavior(),
          ],
          selectionModels: [
            charts.SelectionModelConfig(
                changedListener: (charts.SelectionModel model) {
              if (model.hasDatumSelection) {
                show =
                    "${model.selectedSeries[0].measureFn(model.selectedDatum[0].index)} ${model.selectedSeries[0].data[model.selectedDatum[0].index!].cat}";
                setState(() {});
                print(model.selectedSeries[0]
                    .measureFn(model.selectedDatum[0].index));
              }
            })
          ],
          domainAxis: charts.OrdinalAxisSpec(
              viewport: charts.OrdinalViewport(
                  daybool
                      ? "15"
                      : monthbool
                          ? "8"
                          : weekbool
                              ? "0"
                              : "5",
                  6)));
    }

    return WillPopScope(
      onWillPop: () {
        routes("/Homenavigation", context);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Graph",
            style: heading,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: heightD * 0.02,
            ),
            Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            monthbool = true;
                            weekbool = false;
                            daybool = false;
                            createRandomData();
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: monthbool
                                    ? AppColors.bgcolor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Month",
                              style: normaltext.copyWith(
                                  color: monthbool
                                      ? Colors.white
                                      : AppColors.bgcolor),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            monthbool = false;
                            weekbool = true;
                            daybool = false;
                            createRandomData();
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color:
                                    weekbool ? AppColors.bgcolor : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Week",
                              style: normaltext.copyWith(
                                  color: weekbool
                                      ? Colors.white
                                      : AppColors.bgcolor),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              monthbool = false;
                              weekbool = false;
                              daybool = true;
                              createRandomData();
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: daybool
                                      ? AppColors.bgcolor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Day",
                                style: normaltext.copyWith(
                                    color: daybool
                                        ? Colors.white
                                        : AppColors.bgcolor),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: heightD * 0.03,
                    ),
                    SizedBox(height: heightD / 2, child: barChart()),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
