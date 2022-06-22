import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../Bloc/Sales/sales_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Card/Survey/phone_card.dart';
import 'Components/sales_list_components.dart';


class SalesHistory extends StatefulWidget {
  const SalesHistory({Key? key}) : super(key: key);

  @override
  _SalesHistoryState createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory> with TickerProviderStateMixin {

  bool isClicked = true;
  String? userId;
  String? leaveDate;
  String? saveMonth;
  String? showDateInfo;
  String? month;
  DateTime? selectedDate;
  DateTime initialDate=DateTime.now();
  String? Storename;
  var dateParse;
  int? tabPosition=0;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!, leaveDate!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    var date = new DateTime.now().toString();
    dateParse = DateTime.parse(date);

    if(dateParse.month.toString().length<2){
      month="0"+dateParse.month.toString();
    }else{
      // selectedDate.month.toString().length<2 ? "0"+selectedDate.month.toString():selectedDate.month.toString()
      month=dateParse.month.toString();
    }

    var formattedDate = "$month-${dateParse.year}";
    var formattedmonth = "$month";
    setState(() {
      switch (month.toString()){
        case "01":
          tabPosition=0;
          break;
        case "02":
          tabPosition=1;
          break;
        case "03":
          tabPosition=2;
          break;
        case "04":
          tabPosition=3;
          break;
        case "05":
          tabPosition=4;
          break;
        case "06":
          tabPosition=5;
          break;
        case "07":
          tabPosition=6;
          break;
        case "08":
          tabPosition=7;
          break;
        case "09":
          tabPosition=8;
          break;
        case "10":
          tabPosition=9;
          break;
        case "11":
          tabPosition=10;
          break;
        case "12":
          tabPosition=11;
          break;

      }

    });
    print(month);
    print("xxxxxxxxx");
    saveMonth=formattedmonth.toString();
    leaveDate=formattedDate.toString();

    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Sales History',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back, color: Colors.black, size: 27,),
                ),
              ),
              actions: [
                InkWell(
                  onTap: (){
                    //Navigator.pushNamed(context, SALES_CHART);
                    Navigator.pushNamed(context, COMMINGSOON);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
                    child: SvgPicture.asset('assets/icons/Chart.svg'),
                  ),
                ),
              ],
              toolbarHeight: 60,
              elevation: 0.5,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 12,
                      initialIndex:tabPosition! ,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 12),
                        height: 49,
                        child: TabBar(
                          onTap: (index){
                            print(index);
                            switch(index){
                              case 0:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"01-"+dateParse.year.toString());

                                break;
                              case 1:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"02-"+dateParse.year.toString());

                                break;
                              case 2:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"03-"+dateParse.year.toString());

                                break;
                              case 3:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"04-"+dateParse.year.toString());

                                break;
                              case 4:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"05-"+dateParse.year.toString());

                                break;
                              case 5:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"06-"+dateParse.year.toString());

                                break;
                              case 6:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"07-"+dateParse.year.toString());

                                break;
                              case 7:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"08-"+dateParse.year.toString());

                                break;
                              case 8:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"09-"+dateParse.year.toString());

                                break;
                              case 9:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"10-"+dateParse.year.toString());

                                break;
                              case 10:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"11-"+dateParse.year.toString());

                                break;
                              case 11:
                                BlocProvider.of<SalesCubit>(context).getUserSaleByMonth(userId!,"12-"+dateParse.year.toString());

                                break;

                            }
                            // BlocProvider.of<AttendenceCubit>(context).loadUserAttendanceByMonth(userId!,leaveDate!);
                          },
                          isScrollable: true,
                          indicatorColor: Colors.blue,
                          indicatorWeight: 2,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.blue,
                          labelStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),
                          unselectedLabelColor: Colors.black,

                          tabs:const [
                            Text('January'),
                            Text('February'),
                            Text('March'),
                            Text('April'),
                            Text('May'),
                            Text('June'),
                            Text('July'),
                            Text('August'),
                            Text('September'),
                            Text('October'),
                            Text('November'),
                            Text('December'),
                          ],),
                      ),
                    ),
                    SalesListComponents(),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),

          )),
    );
  }

}
