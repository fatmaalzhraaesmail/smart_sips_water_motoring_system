import 'dart:math';

import 'package:charts_common/src/chart/common/behavior/legend/legend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/normal%20system/cubit/state.dart';
import 'package:graduation_project/normal%20system/navigation.dart';
import 'package:graduation_project/normal%20system/report.dart';
import 'package:graduation_project/normal%20system/drinking_dashboard/blocs/dashboard_bloc.dart';
import 'package:graduation_project/shared/component/component.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/shared/style/style.dart';

const Color blueColor = Color(0xff1565C0);
const Color orangeColor = Color(0xffFFA000);

enum Tab { one, two, three }

class LegendOptions extends StatefulWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final bool? animate;

  const LegendOptions({this.animate = true});

  @override
  State<LegendOptions> createState() => _LegendOptionsState();
}

class _LegendOptionsState extends State<LegendOptions> {
  Tab _selectedTab = Tab.one;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<DashboardCubit>();

    Future<void> notification() async {
      if ((bloc.repo.model?.result!.Potability ?? 0) == 0.0) {
        print('==========================');
        print((bloc.repo.model?.result!.Potability ?? 0) == 0.0);
        bloc
            .sendNotificationApi(
                body: "Drinking Water isnot in good quailty ",
                title: "Smart Sips")
            .then((value) {});

        // bloc.insertToDatabase(title: "title", body: "body");
      }
    }

    // notification();
    // @override
    // initState() {
    //   print('fvvvvvvvvvvvvvv');

    //   super.initState();
    // }
    setState(() {
      notification();
    });

    // if ((bloc.repo.model?.result!.Potability ?? 0) == 0.0) {
    //   print('==========================');
    //   print((bloc.repo.model?.result!.Potability ?? 0) == 0.0);
    //   bloc.sendNotificationApi(
    //       body: "Drinking Water isnot in good quailty ", title: "Smart Sips");
    // } else {
    //   print('object');
    // }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement((context),
              MaterialPageRoute(builder: (context) => NavigationScreen())),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: textColor,
          ),
        ),
        title: Text(
          'Chart',
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 3,
        shadowColor: textColor,
      ),

      /////////////////////// end appbar
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            CupertinoSegmentedControl<Tab>(
              unselectedColor: Colors.white,
              selectedColor: textColor,
              borderColor: textColor,
              children: {
                Tab.one: Text(
                  'Daily',
                  style: user,
                ),
                Tab.two: Text(
                  'Weekly',
                  style: user,
                ),
                Tab.three: Text(
                  ' Monthly',
                  style: user,
                ),
              },
              onValueChanged: (value) {
                setState(() {
                  _selectedTab = value;
                });
              },
              groupValue: _selectedTab,
            ),
            Builder(builder: (context) {
              switch (_selectedTab) {
                ////////daily
                case Tab.one:
                  return Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //here we gonna to create chart
                          Container(
                            height: 330,
                            child: BlocBuilder<DashboardCubit, AppStates>(
                                builder: (context, state) {
                              if (state is Empty) {
                                return Container();
                              } else if (state is Loading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (state is Error) {
                                return Container();
                              } else {
                                List<charts.Series<dynamic, String>>
                                    seriesList = [
                                  charts.Series<OrdinalReadings, String>(
                                    id: 'expense',
                                    domainFn: (OrdinalReadings sales, _) =>
                                        sales.element,
                                    measureFn: (OrdinalReadings sales, _) =>
                                        sales.value,
                                    data: [
                                      OrdinalReadings(
                                          'Ca',
                                          bloc.repo.model!.result!.Calcium ??
                                              0),

                                      OrdinalReadings(
                                          'Hco3',
                                          bloc.repo.model!.result!.Carbonate ??
                                              0),
                                      OrdinalReadings(
                                          'Cl-',
                                          bloc.repo.model!.result!.Chloride ??
                                              0),
                                      OrdinalReadings('EC',
                                          bloc.repo.model!.result!.EC ?? 0),
                                      OrdinalReadings(
                                          'Mg',
                                          bloc.repo.model!.result!.Magnesium ??
                                              0),
                                      // OrdinalSales('Pr', 0.0),
                                      OrdinalReadings(
                                          'K',
                                          bloc.repo.model!.result!.Potassium ??
                                              0),
                                      OrdinalReadings('Na',
                                          bloc.repo.model!.result!.Sodium ?? 0),
                                      OrdinalReadings(
                                          'So4',
                                          bloc.repo.model!.result!.Sulphate ??
                                              0),
                                      OrdinalReadings('TDS',
                                          bloc.repo.model!.result!.TDS ?? 0),
                                      OrdinalReadings('TH',
                                          bloc.repo.model!.result!.TH ?? 0),
                                      OrdinalReadings('WQI',
                                          bloc.repo.model!.result!.WQI ?? 0),
                                      OrdinalReadings('pH',
                                          bloc.repo.model!.result!.pH ?? 0),
                                    ],
                                    colorFn: (_, __) =>
                                        charts.ColorUtil.fromDartColor(
                                            orangeColor),
                                    labelAccessorFn: (OrdinalReadings readings,
                                            _) =>
                                        'expense: ${readings.value.toString()}',
                                    displayName: "Device 1",
                                  ),
                                ];
                                return Center(
                                  child: Container(
                                    margin: EdgeInsets.all(20),
                                    height: 300,
                                    child: charts.BarChart(
                                      seriesList,
                                      animate: true,
                                      barGroupingType:
                                          charts.BarGroupingType.grouped,
                                      defaultRenderer: charts.BarRendererConfig(
                                          cornerStrategy:
                                              const charts.ConstCornerStrategy(
                                                  2)),
                                      primaryMeasureAxis:
                                          charts.NumericAxisSpec(
                                        tickProviderSpec:
                                            charts.BasicNumericTickProviderSpec(
                                          desiredMinTickCount: 6,
                                          desiredMaxTickCount: 10,
                                        ),
                                      ),
                                      secondaryMeasureAxis:
                                          charts.NumericAxisSpec(
                                              tickProviderSpec: charts
                                                  .BasicNumericTickProviderSpec(
                                                      desiredTickCount: 6,
                                                      desiredMaxTickCount: 10)),
                                      selectionModels: [
                                        charts.SelectionModelConfig(
                                            changedListener:
                                                (charts.SelectionModel model) {
                                          if (model.hasDatumSelection) {
                                            print(model.selectedSeries[0]
                                                .measureFn(model
                                                    .selectedDatum[0].index));
                                          }
                                        })
                                      ],
                                      behaviors: [
                                        charts.SeriesLegend.customLayout(
                                          CustomLegendBuilder(),
                                          position: charts.BehaviorPosition.top,
                                          outsideJustification:
                                              charts.OutsideJustification.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }),
                          ),
                          // bloc..createDatabase();

                          BlocBuilder<DashboardCubit, AppStates>(
                              builder: (context, state) {
                           
                            if (state is Loading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is Empty) {
                              return Container();
                            }
                            if ((bloc.repo.model?.result!.Potability ?? 0) ==
                                0.0) {
                              return Text(
                                'Water is not good quailty',

                                style:
                                    TextStyle(color: Colors.red, fontSize: 22),
                              );
                            } else {
                              return Text(
                                'Water is good quailty',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 22),
                              );
                            }
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<DashboardCubit, AppStates>(
                              builder: (context, AppStates state) {
                            if (state is Empty) {
                              return Container();
                            } else if (state is Loading) {
                              return Center(child: CircularProgressIndicator());
                            } else if (state is Error) {
                              return Container();
                            } else {
                              return Column(
                                children: [
                                  ////////ca
                                  elementContainer(
                                    element: 'Ca',
                                    description: 'Residual sodium carbonate',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.Calcium ??
                                                0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.Calcium ?? 0}%',
                                    color: (bloc.repo.model!.result!.Calcium ??
                                                0) <
                                            75
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////////Hco3
                                  elementContainer(
                                    element: 'Hco3',
                                    description: 'Residual sodium carbonate',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.Carbonate ??
                                                0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.Carbonate ?? 0}%',
                                    color:
                                        ((bloc.repo.model!.result!.Carbonate ??
                                                        0) >
                                                    120 &&
                                                (bloc.repo.model!.result!
                                                            .Carbonate ??
                                                        0) <
                                                    200)
                                            ? Colors.green
                                            : Colors.red,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  //////cl

                                  elementContainer(
                                    element: 'Cl',
                                    description: 'Residual sodium carbonate',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.Chloride ??
                                                0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.Chloride ?? 0}%',
                                    color: (bloc.repo.model!.result!.Chloride ??
                                                0) >
                                            300
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ////EC
                                  elementContainer(
                                    element: 'EC',
                                    description: 'Residual Ec carbonate',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.EC ?? 0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.EC ?? 0}%',
                                    color:
                                        (bloc.repo.model!.result!.EC ?? 0) > 170
                                            ? Colors.red
                                            : Colors.green,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////Mg
                                  elementContainer(
                                    element: 'Mg',
                                    description: 'Residual Mg carbonate',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.Magnesium ??
                                                0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.Magnesium ?? 0}%',
                                    color:
                                        (bloc.repo.model!.result!.Magnesium ??
                                                    0) >
                                                50
                                            ? Colors.red
                                            : Colors.green,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////K

                                  elementContainer(
                                    element: 'K',
                                    description: 'Residual Potassium',
                                    description2: 'concentration is Potassium',
                                    percent:
                                        ((bloc.repo.model!.result!.Potassium ??
                                                0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.Potassium ?? 0}%',
                                    color:
                                        (bloc.repo.model!.result!.Potassium ??
                                                    0) >
                                                12
                                            ? Colors.red
                                            : Colors.green,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////Na

                                  elementContainer(
                                    element: 'Na',
                                    description: 'Residual sodium ',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.Sodium ??
                                                0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.Sodium ?? 0}%',
                                    color:
                                        (bloc.repo.model!.result!.Sodium ?? 0) >
                                                40
                                            ? Colors.red
                                            : Colors.green,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////So4

                                  elementContainer(
                                    element: 'So4',
                                    description: 'Residual So4 ',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.Sulphate ??
                                                0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.Sulphate ?? 0}%',
                                    color: (bloc.repo.model!.result!.Sulphate ??
                                                0) >
                                            500
                                        ? Colors.red
                                        : Colors.green,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////tds

                                  elementContainer(
                                    element: 'TDS',
                                    description: 'Residual TDS',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.TDS ?? 0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.TDS ?? 0}%',
                                    color: (bloc.repo.model!.result!.TDS ?? 0) >
                                            1200
                                        ? Colors.red
                                        : Colors.green,
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////th
                                  elementContainer(
                                    element: 'TH',
                                    description: 'Residual TH',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.TH ?? 0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.TH ?? 0}%',
                                    color: ((bloc.repo.model!.result!.TH ?? 0) <
                                                100 &&
                                            (bloc.repo.model!.result!.TH ?? 0) >
                                                300)
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  ////PH
                                  elementContainer(
                                    element: 'PH',
                                    description: 'Residual PH',
                                    description2: 'concentration is dangerous',
                                    percent:
                                        ((bloc.repo.model!.result!.pH ?? 0) /
                                            100),
                                    textPercent:
                                        '${bloc.repo.model!.result!.pH ?? 0}%',
                                    color: ((bloc.repo.model!.result!.pH ?? 0) >
                                                75 &&
                                            (bloc.repo.model!.result!.pH ?? 0) <
                                                9.5)
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  );

                /////////end of daily
                case Tab.two:
                  //weekly
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('image/cart qw.png'),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                          onPressed: () => Navigator.pushReplacement(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => ReportScreen())),
                          child:
                              defaultButton(color: textColor, text: 'Report'))
                    ],
                  );
                //end of week;y
                case Tab.three:
                  //////monthly
                  return Center(child: Image.asset('image/cart qw month.png'));
                /////end of monthly
              }
            }),
          ],
        ),
      ),
    );
  }
}

class CustomLegendBuilder extends charts.LegendContentBuilder {
  @override
  Widget build(BuildContext context, LegendState<dynamic> legendState,
      Legend<dynamic> legend,
      {bool? showMeasures}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        // ignore: invalid_use_of_protected_member
        children: legend.chart.currentSeriesList
            .map<Widget>((e) => InkWell(
                  //Here i Want to show and hide series when click on the legend
                  onTap: () {},
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Text(
                        e.displayName!,
                        style: TextStyle(color: Colors.white),
                      )),
                ))
            .toList()
          ..add(Spacer())
          ..add(Transform.rotate(
            angle: 360 * (pi / 180),
            child: Container(
              height: 50,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('danger'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.square,
                        size: 15,
                        color: Colors.red[300],
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text('warning'),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     Icon(
                  //       Icons.square,
                  //       size: 15,
                  //       color: Colors.yellow,
                  //     )
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('normal'),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.square,
                        size: 15,
                        color: Colors.green[300],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )));
  }
}

class OrdinalReadings {
  final String element;
  final double value;

  OrdinalReadings(this.element, this.value);
}
