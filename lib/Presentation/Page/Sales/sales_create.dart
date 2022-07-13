import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:search_choices/search_choices.dart';
import '../../../Bloc/Product/product_cubit.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Data/Model/Product/Inventory.dart';
import '../../../Data/Model/Product/Product.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Button/NormalButton/button_material.dart';
import '../../Widgets/LoadAnimation/MapLoadingAnimation.dart';
import '../../Widgets/TextFields/materialTextFieldTwo.dart';
import '../../Widgets/TextFields/normal_background_textdield.dart';
import '../../Widgets/TextFields/normal_textdield.dart';
import '../../Widgets/TextFields/salescreate/sales_create_number.dart';
import '../../Widgets/TextFields/salescreate/sales_create_remarks.dart';

class SalesCreate extends StatefulWidget {
  const SalesCreate({Key? key}) : super(key: key);

  @override
  _SalesCreateState createState() => _SalesCreateState();
}

class _SalesCreateState extends State<SalesCreate> {
  bool calling=false;
  late String leaveDate;
  List<String> _locations = ['sick','casual']; // Option 2
  late String _selectedLocation; // Option 2
  TextEditingController name = TextEditingController();
  TextEditingController contactNumber= TextEditingController();
  TextEditingController age= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController purchasedModel= TextEditingController();
  TextEditingController quantity= TextEditingController();
  TextEditingController price= TextEditingController();
  TextEditingController color= TextEditingController();
  TextEditingController remarks= TextEditingController();
  late String userId;
  late String storeId;
  late String lan;
  late String product;
  late String productId="";
  List<DropdownMenuItem> items = [];
  final _globalkey = GlobalKey<FormState>();
  Inventory? selectedValueSingleMenu;
  LocalDataGet _localDataGet = new LocalDataGet();
  String? datae;
  bool circuler=false;
  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId= tokenx.get('userId')?? "";
      storeId= tokenx.get('storeId')?? "";
    });

    BlocProvider.of<ProductCubit>(context).getAllProduct(storeId,userId);
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black,),
          title: Text("Sales Form",style: TextStyle(color: Colors.black),),
          elevation: 0.5,
          toolbarHeight: 60,
        ),
        body: BlocListener<ProductCubit, ProductState>(
          listener: (context, state) {
            if((state is ProductsLoaded)){
              final data=state.productsResponse;
              data?.products!.inventory?.forEach((pro) {
                setState(() {
                  items.add(DropdownMenuItem(
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child:  Container(
                                  padding:  const EdgeInsets.only(right: 13.0),
                                  child:  Text(
                                    pro.product!.productName!,
                                    overflow: TextOverflow.ellipsis,
                                    style:  const TextStyle(
                                      fontSize: 13.0,
                                      fontFamily: 'Roboto',
                                      color:  Color(0xFF212121),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    value: pro,
                  ));
                });
              });

            }
          },
          child: Material(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 15,right:15,top: 0),
              child: Column(
                children: [
                  //AppBar//App bar
                  //App Bar
                  SizedBox(height:3,),
                  Flexible(
                    flex:100,
                    child: BlocBuilder<ProductCubit, ProductState>(
                      builder: (context, state) {
                        if(!(state is ProductsLoaded)){
                          return MapLoadingAnimation();
                        }
                        final data=state.productsResponse;

                        return Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                                child: Form(
                                  key: _globalkey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      SalesCreateTextfield(lable: "Name",controller: name,hintText: "Customer Name", readOnly: false, isNumber: false,),
                                      SizedBox(height: 14,),

                                      MaterialBackgroundTextField(lable: "Number",controller: contactNumber,hintText: "Customer Number", readOnly: false, isNumber: true,),

                                      SizedBox(height: 14,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child:MaterialBackgroundTextField(lable: "Age",controller: age,hintText: "Enter Age", readOnly: false, isNumber: true,),
                                          ),
                                          SizedBox(width: 8,),
                                          Expanded(
                                            flex: 4,
                                            child:TextFormField(
                                              validator: (val) => val!.isEmpty || !val.contains("@")
                                                  ? "enter a valid eamil"
                                                  : null,
                                              controller: email,
                                              decoration: const InputDecoration(
                                                hintText: "Email",
                                                hintStyle: TextStyle(color: Colors.grey),
                                                labelText: "Please Enter Email",
                                                fillColor: Color(0xFFF5F7F8),
                                                filled: true,
                                                contentPadding:
                                                EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color:Colors.white, width: 1.0),
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: Colors.white, width: 2.0),
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 14,),
                                      items.isEmpty
                                          ? const Center(child: Text("No item found"),)
                                          : Container(
                                            width: MediaQuery.of(context).size.width,

                                            color:Color(0xFFF5F7F8) ,
                                            child: SearchChoices.single(
                                        displayClearIcon: false,
                                        menuBackgroundColor: Color(0xFFF5F7F8),
                                        searchInputDecoration: const InputDecoration(
                                            fillColor: Color(0xFFF5F7F8),
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 20.0, horizontal: 12.0),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: textFieldBorder, width: 1.0),
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                        ),
                                        items: items,
                                        value: selectedValueSingleMenu,
                                        hint:'Select Product',
                                        searchHint:'Enter Product Name',
                                        onChanged: (value) {
                                            print("object");
                                            selectedValueSingleMenu = value;
                                            print(value.toString());
                                            setState(() {
                                              selectedValueSingleMenu = value;
                                              productId=selectedValueSingleMenu!.product!.id!.toString();
                                              print(productId);
                                              print(value);
                                            });
                                        },
                                        dialogBox: false,
                                        isExpanded: true,
                                        menuConstraints:
                                        BoxConstraints.tight(Size.fromHeight(350)),
                                      ),
                                          ),
                                      SizedBox(height: 14,),
                                      productId==""?Container(): productId!=null? Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child:FutureBuilder(
                                                  future: getquantity(storeId,productId),
                                                  builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                                                    if(snapshot.hasData){
                                                      Map? content = snapshot.data;
                                                      return  MaterialBackgroundTextField(lable:content!['product']['inventory'][0]['quantity'].toString()+" Quantity" ,controller: quantity,hintText: "Quantity Number", readOnly: false, isNumber: true,);
                                                    }else {
                                                      return MaterialBackgroundTextField(lable: "Quantity",controller: quantity,hintText: "Quantity Number", readOnly: false, isNumber: true,);
                                                    }
                                                  }
                                              )
                                          ),
                                          SizedBox(width: 8,),
                                          productId==""?Container():  Expanded(
                                              flex: 4,
                                              child:FutureBuilder(
                                                  future: getWeather(productId),
                                                  builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                                                    if(snapshot.hasData){
                                                      Map? content = snapshot.data;
                                                      color.text=content!['product']['color'].toString();
                                                      remarks.text=" ";
                                                      return  SalesCreateTextfield(lable: "Color",controller: color,hintText: "Device Color", isNumber: false, readOnly: true,);
                                                    }else {
                                                      return MaterialBackgroundTextField(
                                                        lable: "Select Product For Color ",
                                                        controller: color,
                                                        hintText: "Device Color", readOnly: true, isNumber: false,);
                                                    }
                                                  }
                                              )

                                          )
                                        ],
                                      ):Container(),
                                      SizedBox(height: 14,),
                                      productId==""?Container(): productId!=null? FutureBuilder(
                                          future: getWeather(productId),
                                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                                            if(snapshot.hasData){
                                              Map? content = snapshot.data;
                                              price.text=content!['product']['recomendedprice'].toString();
                                              product=content['product']['productName'].toString();
                                              return MaterialBackgroundTextField(lable: "Per Price",controller: price,hintText: "Entet Per Price", readOnly: true, isNumber: true,);
                                            }else {
                                              return MaterialBackgroundTextField(lable: "Wait..",controller: price,hintText: "Entet Per Price", isNumber: true, readOnly: false,);
                                            }
                                          }
                                      ):Container(),
                                      SizedBox(height: 14,),
                                      SalesCreateRemarkTextfield(lable: "Remark(S)",controller: remarks,hintText: "Enter Remarks(optional)", readOnly: false, isNumber: false,),
                                      SizedBox(height: 34,),
                                      productId==""?Container(): FutureBuilder(
                                          future: lastcall(storeId,productId),
                                          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                                            if(snapshot.hasData){
                                              Map? content = snapshot.data;
                                              if(content!['product']['inventory'][0]['quantity']>0){
                                                return  calling? Container(
                                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                                  child: NormalButton(
                                                    text: "Submit",
                                                    color: Colors.blue,
                                                    textColor: Colors.white,
                                                    tap: (){
                                                      if (_globalkey.currentState!.validate()) {
                                                        setState(() {

                                                        });
                                                        Navigator.pushNamed(context, INVOICE_PAGE,
                                                            arguments: {
                                                              'customerName':name.text,
                                                              'customerEmail':email.text,
                                                              'customerPhone':contactNumber.text,
                                                              'age':age.text,
                                                              'model':productId,
                                                              'productName':product,
                                                              'quantity':quantity.text,
                                                              'color':color.text,
                                                              'price':price.text,
                                                              'remarks':remarks.text
                                                            });
                                                      }
                                                    },

                                                  ),
                                                ):Center(child: CircularProgressIndicator());
                                              }else{
                                                return Center(child: Text("Sorry Product StockOut",style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.w900),));
                                              }
                                            }else {
                                              return Container();
                                            }
                                          }
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }






  Future<Map> getWeather(String productId) async {
    // Logger().d("message");
    http.Response response = await http.get(Uri.parse(BASE_URL+"products/"+productId));
    Logger().d(json.decode(response.body));
    return json.decode(response.body);
  }

  Future<Map> lastcall(String storeId,String productId) async {
    // Logger().d("message");
    http.Response response = await http.get(Uri.parse(BASE_URL+"stores/singproduct/"+storeId+"/"+productId));
    Logger().d(json.decode(response.body));
    calling=true;
    return json.decode(response.body);
  }


  Future<Map> getquantity(String storeId,String productId) async {
    Logger().d("message");
    http.Response response = await http.get(Uri.parse(BASE_URL+"stores/singproduct/"+storeId+"/"+productId));
    Logger().d(json.decode(response.body));
    return json.decode(response.body);
  }


}
