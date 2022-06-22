import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:search_choices/search_choices.dart';
import '../../../Bloc/Inventory/inventory_cubit.dart';
import '../../../Bloc/Product/product_cubit.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Data/Model/Product/Inventory.dart';
import '../../../Data/Model/Product/Product.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/CustomButoon/custom_button.dart';
import '../../Widgets/Button/NormalButton/button_material.dart';
import '../../Widgets/LoadAnimation/MapLoadingAnimation.dart';
import '../../Widgets/TextFields/materialTextFieldTwo.dart';
import '../../Widgets/TextFields/normal_background_textdield.dart';
import '../../Widgets/TextFields/normal_textdield.dart';
import '../../main_screen.dart';

class InventoryDropdownPage extends StatefulWidget {
  const InventoryDropdownPage({Key? key}) : super(key: key);

  @override
  _InventoryDropdownPageState createState() => _InventoryDropdownPageState();
}

class _InventoryDropdownPageState extends State<InventoryDropdownPage> {
  bool calling=false;
  bool validate = false;
  bool circular = false;
  Product? ProductId;
  
  TextEditingController quantity= TextEditingController();

  String? userId;
  String? storeId;
  String? lan;
  String? product;
  String? productId="";
  List<DropdownMenuItem> items = [];
  final _globalkey = GlobalKey<FormState>();
  Inventory? selectedValueSingleMenu;
  LocalDataGet _localDataGet = new LocalDataGet();
  String? datae;

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId= tokenx.get('userId')?? "";
      storeId= tokenx.get('storeId')?? "";
    });
    BlocProvider.of<ProductCubit>(context).getAllProduct(storeId!,userId!);
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
          listener: (context, state) {
            if((state is ProductsLoaded)){
              final data=state.productsResponse;
              data?.products!.inventory?.forEach((pro) {
                setState(() {
                  items.add(DropdownMenuItem(
                    child: Row(
                      children: [
                        Container(
                          height: 40,
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
              padding: EdgeInsets.only(left: 0,right:0,top: 0),
              child: Column(
                children: [
                  Flexible(
                    flex:100,
                    child: BlocBuilder<ProductCubit, ProductState>(
                      builder: (context, state) {
                        if(!(state is ProductsLoaded)){
                          return Container();
                        }
                        final data=state.productsResponse;

                        return Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                child: Form(
                                  key: _globalkey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
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
                                          ],
                                        ),
                                      ),
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
