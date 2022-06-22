import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../Bloc/Sales/sales_cubit.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/NormalButton/button_material.dart';
import '../../Widgets/LoadAnimation/MapLoadingAnimation.dart';
import '../../main_screen.dart';

class InvoicePage extends StatefulWidget {
  final String customerName;
  final String customerphone;
  final String customerEmail;
  final String customerAge;
  final String model;
  final String productName;
  final String quantity;
  final String color;
  final String price;
  final String remark;


  InvoicePage(
      {required this.customerName,
        required this.customerphone,
        required this.customerEmail,
        required this.customerAge,
        required this.model,
        required this.productName,
        required this.quantity,
        required this.color,
        required this.price,
        required this.remark
      });

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('MM-yyyy');
  static final DateFormat formate = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final String dateIn=formate.format(now);
  String name="";
  late String userId;
  late String storeName;
  late String storeId;
  late String linmanagerid;
  LocalDataGet _localDataGet = new LocalDataGet();
  bool circle=false;
  String? userAddress;
  void getCureentLocationName()async {
    var possition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //location name
    List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
    setState(()  {

      userAddress=placemarks[0].name.toString()+","+placemarks[0].street.toString()
          +","+placemarks[0].locality.toString();
    });
  }
  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      name = tokenx.get('name')?? "";
      userId=tokenx.get('userId')?? "";
      storeName=tokenx.get('storename')?? "";
      storeId=tokenx.get('storeId')?? "";
      linmanagerid= tokenx.get('linmanagerid')?? "";
    });


  }

  @override
  void initState() {
    // TODO: implement initStat

    getCureentLocationName();
    getToken();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    String pricex=widget.price;
    String quantityx=widget.quantity;
    int total=int.parse(pricex)*int.parse(quantityx);
    return BlocListener<SalesCubit, SalesState>(
      listener: (context, state) {
        // TODO: implement listener}
        if(state is SalesCreated){
          Navigator.pushReplacement(context, PageTransition(MainScreen()));
        }
      },
      child: Scaffold(
        backgroundColor: whiteBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black,),
          title: Text("Invoice",style: TextStyle(color: Colors.black),),
          elevation: 0,
        ),
        body:userAddress==null?Center(child: MapLoadingAnimation(),): Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child:Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text("INVOICE",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24,color: Colors.blue[900]),textAlign: TextAlign.center,)
                      ),
                      Padding(padding: EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Bill To:",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),textAlign: TextAlign.start,),
                                Text(widget.customerName,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                                Text(userAddress!.substring(0,20)+'...',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                                Text(storeName,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                                Text(widget.customerEmail,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                                Text(widget.customerphone,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date: $formatted",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(14),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Product",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),textAlign: TextAlign.start,),
                                Text("Price",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),textAlign: TextAlign.start,),
                                Text("Quantity",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),textAlign: TextAlign.start,),
                                Text("Total",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),textAlign: TextAlign.start,),
                              ],
                            ),
                            SizedBox(height: 8,),

                            SizedBox(height: 8,),
                            Divider(
                              height: 2,
                              thickness: 1,
                            ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.productName,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.black),textAlign: TextAlign.start,),
                                Text(widget.price,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.black),textAlign: TextAlign.start,),
                                Text(widget.quantity,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.black),textAlign: TextAlign.start,),
                                Text(total.toString(),style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.black),textAlign: TextAlign.start,),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Divider(
                              height: 2,
                              thickness: 1,
                            ),
                            SizedBox(height: 8,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text("Grand Total: $total",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.black),textAlign: TextAlign.end,),
                            ),

                          ],
                        ),
                      ),
                    ],
                  )),


              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: 200,
                              child:circle? Center(child: CircularProgressIndicator(),) :
                              NormalButton(
                                text: "Submit",
                                color: Colors.blue,
                                textColor: Colors.white,
                                tap: (){
                                  setState(() {
                                    circle=true;
                                  });
                                  BlocProvider.of<SalesCubit>(context).createSale( storeName,name,widget.price,widget.model, formatted,dateIn,widget.customerName, widget.customerphone,
                                      widget.customerEmail,int.parse( widget.quantity),widget.color, widget.customerAge,widget.remark,  userId,  linmanagerid,storeId);

                                }
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Text("Sales Incharge: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),textAlign: TextAlign.end,),
                                Text(name,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.black),textAlign: TextAlign.end,),
                              ],
                            ),)
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
