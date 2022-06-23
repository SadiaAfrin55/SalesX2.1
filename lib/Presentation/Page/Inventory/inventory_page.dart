import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_choices/search_choices.dart';
import '../../../Bloc/Inventory/inventory_cubit.dart';
import '../../../Bloc/Product/product_cubit.dart';
import '../../../Data/Model/Product/Product.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/CustomButoon/custom_button.dart';
import '../../Widgets/TextFields/inventory_textfield.dart';
import '../../main_screen.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  bool calling=false;
  bool validate = false;
  bool circular = false;
  Product? ProductId;

  TextEditingController quantity= TextEditingController();
  String? userId;
  String? storeId;
  String? product;
  String? productId="";
  String? datae;
  bool circuler=false;
  List<DropdownMenuItem> items = [];
  final _globalkey = GlobalKey<FormState>();
  Product? selectedValueSingleMenu;

  LocalDataGet _localDataGet = new LocalDataGet();
  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId= tokenx.get('userId')?? "";
      storeId= tokenx.get('storeId')?? "";
    });
    BlocProvider.of<ProductCubit>(context).getAllProducts();
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryCubit, InventoryState>(
      listener: (context, state) {
        if(state is InventoryCreate){
          setState(() {
            circular = false;
          });
          Navigator.pushReplacement(context, PageTransition(MainScreen()));
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: BackButton(color: Colors.black,),
            title: Text("Inventory Form",style: TextStyle(color: Colors.black),),
            elevation: 0,
          ),
          body: BlocListener<ProductCubit, ProductState>(
            listener: (context, state) {
              if((state is allProducts)){
                final data=(state as allProducts).loadAllProducts;
                data!.product!.forEach((pro) {
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
                                  child: Container(
                                    padding:  EdgeInsets.only(right: 13.0),
                                    child:  Text(
                                      pro.productName!,
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
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if(!(state is allProducts)){
                  return Center(child: CircularProgressIndicator(),);
                }
                return SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Form(
                        key: _globalkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                    searchInputDecoration:  const InputDecoration(
                                      fillColor: Color(0xFFF5F7F8),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 12.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.0),
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
                                        productId=selectedValueSingleMenu!.id!.toString();
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
                                const Text('Quantity',style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:Color(0xFF232C2E)
                                ),),
                                const SizedBox(height: 8,),
                                InventoryTextfield(readOnly: false,controller: quantity,hintText: "Enter Quantity",),
                              ],
                            ),


                            circular? const Center(child: CircularProgressIndicator()) :
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomButton(
                                title: 'Add',
                                onTap: (){
                                  if (_globalkey.currentState!.validate()) {
                                    setState(() {
                                      validate = true;
                                      circular = true;
                                    });

                                    print("product id: "+productId!);
                                    print("quantity text: "+quantity.text);
                                    print("storeid id: "+storeId!);
                                    BlocProvider.of<InventoryCubit>(context).createInventory(
                                        productId!,
                                        quantity.text,
                                        storeId!,
                                        "token");
                                  }},
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
      ),
    );
  }

}
