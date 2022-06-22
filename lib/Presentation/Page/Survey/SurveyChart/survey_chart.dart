
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'bar_chart_model.dart';


class SurveyChart extends StatefulWidget {
  SurveyChart({Key? key}) : super(key: key);

  @override
  State<SurveyChart> createState() => _SurveyChartState();
}

class _SurveyChartState extends State<SurveyChart> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isClicked = true;
  List<Tab>? _kTabs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =  TabController(length:4, vsync: this);
    _kTabs =[
      Tab(text: 'January'),
      Tab(text:'February'),
      Tab(text:'March'),
      Tab(text:'April'),
      Tab(text:'May'),
      Tab(text:'June'),
      Tab(text:'July'),
      Tab(text:'Auguest'),
      Tab(text:'September'),
      Tab(text:'October'),
      Tab(text:'November'),
      Tab(text:'December'),
    ];
  }
  final List<chartModel> data = [
    chartModel(
        week: 'Sa',
        user: 100,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    chartModel(
      week: 'Su',
      user: 300,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    chartModel(
      week: 'Mo',
      user: 450,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    chartModel(
      week: 'Tu',
      user: 550,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    chartModel(
      week: 'We',
      user: 1200,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    chartModel(
      week: 'Th',
      user: 900,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    chartModel(
      week: 'Fr',
      user: 1500,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<chartModel,String>>series = [
      charts.Series(
        id: "User",
        data: data,
        domainFn:(chartModel series,_)=>series.week,
        measureFn: (chartModel series,_)=>series.user,
        colorFn: (chartModel series,_)=>series.color,
      ),
    ];
    return DefaultTabController(
      length: 12,
      child: Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Survey Chart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close,color: Colors.black,size: 27,),
              ),
            ),
            toolbarHeight: 60,
            elevation: 0.5,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: TabBar(
                isScrollable: true,
                labelColor: Colors.lightBlue,
                unselectedLabelColor: Colors.black,
                tabs: _kTabs!,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text('Statistics',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF121826)
                  ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 304,
                    child: charts.BarChart(
                      series,
                      animate: true,
                      defaultRenderer: new charts.BarRendererConfig(
                          cornerStrategy: const charts.ConstCornerStrategy(30)),

                    ),
                  ),
                  const SizedBox(height: 24),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: DefaultTabController(
                  length: 4,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 24,
                              //padding:const EdgeInsets.symmetric(vertical: 30),
                              margin:const EdgeInsets.symmetric(horizontal: 42),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:TabBar(
                                controller: _tabController,
                                labelColor: Colors.white,
                                unselectedLabelColor: const Color(0xFF232C2E),
                                labelStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w700),
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xFF0180F5),
                                ),
                                tabs: const [
                                  Tab(
                                      child: Text('1W')
                                  ),
                                  Tab(
                                      child: Text('2W')
                                  ),
                                  Tab(
                                      child: Text('3W')
                                  ),
                                  Tab(
                                      child: Text('4W')
                                  ),
                                ],
                              )
                          ),
                        ),
                        const SizedBox(height: 17,),
                        Expanded(
                          flex: 24,
                          child: TabBarView(
                              controller: _tabController,
                              children: [
                                Container(height: 50,width: 50),
                                Container(height: 50,width: 50,),
                                Container(height: 50,width: 50,),
                                Container(height: 50,width: 50,),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}
