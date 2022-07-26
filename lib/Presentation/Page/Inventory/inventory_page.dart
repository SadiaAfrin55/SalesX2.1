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
  bool circle=false;
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

          });
          circular=false;
          circular==false?showAlertDialog(context):
          Navigator.pushReplacement(context, PageTransition(MainScreen()));
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Inventory',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back, color: Colors.black, size: 27,),
              ),
            ),
            toolbarHeight: 60,
            elevation: 0.5,
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
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                      child: Form(
                        key: _globalkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20,),
                                const Text('Select product',style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:Color(0xFF232C2E)
                                ),),
                                const SizedBox(height: 8,),
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
                                SizedBox(height: 20,),
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
            const Text("You have successfully done your inventory",style: TextStyle(color: Color(0XFF000000),fontSize:16,fontWeight: FontWeight.w400 ),textAlign: TextAlign.center,),
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
