
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttendenceHistoryNoData extends StatefulWidget {
  AttendenceHistoryNoData({Key? key}) : super(key: key);

  @override
  State<AttendenceHistoryNoData> createState() => _AttendenceHistoryNoDataState();
}

class _AttendenceHistoryNoDataState extends State<AttendenceHistoryNoData> {
  List<Tab>? _kTabs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Attendance History',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.arrow_back,color: Colors.black,size: 27,),
            ),
          ),
          toolbarHeight: 54,
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
          child:Container(
            width: 800,
            height: 870,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 260),
                  child: Column(
                    children: [
                      Image.asset('images/icons/noDataFound.png'),
                      SizedBox(height: 15),
                      const Text('No data available',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    child: SvgPicture.asset('images/icons/maac.svg'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
