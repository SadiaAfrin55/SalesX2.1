
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../../Bloc/Sales/sales_cubit.dart';
import '../../../../Data/Model/Sale/Sale.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/TextFields/materialSearchField.dart';
import '../Components/sales_list_components.dart';


class SalesSearchHomePage extends StatefulWidget {
  const SalesSearchHomePage({Key? key}) : super(key: key);

  @override
  _SalesSearchHomePageState createState() => _SalesSearchHomePageState();
}

class _SalesSearchHomePageState extends State<SalesSearchHomePage> with TickerProviderStateMixin {

  TextEditingController searchController= TextEditingController();
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
    print(month);
    print("xxxxxxxxx");
    saveMonth=formattedmonth.toString();
    leaveDate=formattedDate.toString();

    getToken();
    super.initState();
  }

  TextEditingController titlesearch = TextEditingController();
  TextEditingController writtersearch = TextEditingController();
  List<Sale> totalsale = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Sales search',
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
              toolbarHeight: 60,
              elevation: 1,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                   Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                          child: TextFormField(
                            readOnly: false,
                            controller: titlesearch,
                            onChanged: SearchBookTitle,
                            decoration: const InputDecoration(
                              prefixIcon:  Padding(
                                  padding: EdgeInsets.only( top: 15, left: 5, right: 0, bottom: 15),
                                  child: Icon(Icons.search)
                              ),
                              labelText: 'Name',
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color:Colors.black12, width: 1.0),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 8,
                      //   child: Container(
                      //     margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                      //     child: TextFormField(
                      //       readOnly: false,
                      //       controller: writtersearch,
                      //       onChanged: SearchBookWritter,
                      //       decoration: const InputDecoration(
                      //         prefixIcon:  Padding(
                      //             padding: EdgeInsets.only( top: 15, left: 5, right: 0, bottom: 15),
                      //             child: Icon(Icons.search)
                      //         ),
                      //         labelText: 'Price',
                      //         contentPadding:
                      //         EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      //         ),
                      //         enabledBorder: OutlineInputBorder(
                      //           borderSide:
                      //           BorderSide(color:Colors.black12, width: 1.0),
                      //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      //         ),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderSide:
                      //           BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                   SalesListComponents(),
                ],
              ),
            ),

          )),
    );
  }

  void SearchBookTitle(String query) {
    final suggestion = totalsale.where((books){
      final booktitle = books.productName!.toLowerCase();
      final input = query.toLowerCase();
      return booktitle.contains(input);
    }).toList();
    setState(() {
      totalsale = suggestion;
    });
  }

  void SearchBookWritter(String query) {
    List<Sale> searchresult = [];

    final suggestion = searchresult.where((books){
      final bookwritter = books.price!.toLowerCase();
      final input = query.toLowerCase();
      return bookwritter.contains(input);
    }).toList();
    setState(() {
      totalsale = suggestion;
    });
  }

}
