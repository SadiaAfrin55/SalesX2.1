import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final String formatted = formate.format(now);
  final String dateIn=formate.format(now);
  String name="";
  late String userId;
  bool circul = false;
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
          circul=false;
          circul==false?showAlertDialog(context):
          Navigator.pushReplacement(context, PageTransition(MainScreen()));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black,),
          title: const Text("Create Invoice",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
          elevation: 0.5,
        ),

        body:userAddress==null?Center(child: MapLoadingAnimation(),): Container(
          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child:Container(
                    margin:const EdgeInsets.only(top:14),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 224,
                          child: Column(
                            children: [
                              Container(
                                margin:const EdgeInsets.only(top:14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/invoice.svg'),
                                    const SizedBox(width: 14,),
                                    Text("Invoice",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.blue[900]),textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 17.0),
                                child: DottedLine(dashColor: Colors.black26,),
                              ),

                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Bill To:",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Colors.blue)),
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/Time.svg',color: Colors.black),
                                        const SizedBox(width: 5,),
                                        Text("$formatted",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(widget.customerName,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Colors.black),textAlign: TextAlign.start,),
                                        const SizedBox(height: 6,),
                                        // Text(userAddress!.substring(0,20)+'...',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black),textAlign: TextAlign.start,),
                                        Text(storeName,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Colors.black),textAlign: TextAlign.start,),
                                        const SizedBox(height: 6,),
                                        Text(widget.customerEmail,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Colors.black),textAlign: TextAlign.start,),
                                        const SizedBox(height: 6,),
                                        Text(widget.customerphone,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color: Colors.black),textAlign: TextAlign.start,),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16,),
                        Container(
                          color: Colors.white,
                          height: 218,
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const[
                                  Expanded(
                                      flex: 2,
                                      child: Text("Product",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black),textAlign: TextAlign.start,)),
                                  Expanded(
                                      flex: 1,
                                      child: Text("Price",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black),textAlign: TextAlign.start,)),
                                  Expanded(
                                      flex: 1,
                                      child: Text("Quantity",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black),textAlign: TextAlign.start,)),
                                  Expanded(
                                      flex: 1,
                                      child: Text("Total",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black),textAlign: TextAlign.start,)),
                                ],
                              ),
                              const SizedBox(height: 10,),

                              const Divider(
                                height: 1,
                                thickness: 1,
                              ),
                              const SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(
                                      flex:2,
                                      child: Text(widget.productName,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Colors.black),textAlign: TextAlign.start,)),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/takaIcon.svg',color: Colors.black,),
                                        const SizedBox(width: 4,),
                                        Text(widget.price,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Colors.black),textAlign: TextAlign.start,),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(widget.quantity,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Colors.black),textAlign: TextAlign.start,)),
                                  Expanded(
                                      flex:1,
                                      child: Text(total.toString(),style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 11,color: Colors.black),textAlign: TextAlign.start,)),
                                ],
                              ),
                              const SizedBox(height: 16,),
                              const Divider(
                                height: 2,
                                thickness: 1,
                              ),
                              const SizedBox(height: 8,),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Grand Total: ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Colors.black),textAlign: TextAlign.end,),
                                        const SizedBox(width: 4,),
                                        SvgPicture.asset('assets/icons/takaIcon.svg',color: Colors.black,),
                                        const SizedBox(width: 2,),
                                        Text("$total",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Colors.black),textAlign: TextAlign.end,),

                                      ],
                                    ),

                                    const SizedBox(height: 30,),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(name,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.black),textAlign: TextAlign.right,),
                                        const SizedBox(height: 4,),
                                        Text("Sales Incharge",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11,color: Colors.black.withOpacity(0.3)),textAlign: TextAlign.right,),
                                      ],
                                    ),

                                  ],
                                ),
                              ),



                            ],
                          ),
                        ),
                      ],
                    ),
                  )),


              Container(
                width: MediaQuery.of(context).size.width,
                height: 54,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 300,
        width: MediaQuery.of(context).size.width*0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/Frame.png'),
            const Text("Done!!",style: TextStyle(color: Color(0XFF000000),fontSize:30,fontWeight: FontWeight.w800 ),textAlign: TextAlign.center,),
            const Text("You have successfully done your sales",style: TextStyle(color: Color(0XFF000000),fontSize:16,fontWeight: FontWeight.w400 ),textAlign: TextAlign.center,),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child:  InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, PageTransition(MainScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent
                    ),
                    child: Text("Star your work",style: TextStyle(color: Color(0XFFffffff),fontSize:16 ),textAlign: TextAlign.center,),
                  ),
                )
            ),
          ],
        ),
      ),
    );
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
