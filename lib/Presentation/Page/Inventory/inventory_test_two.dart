
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_choices/search_choices.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../../Bloc/Inventory/inventory_cubit.dart';
import '../../../Bloc/Product/product_cubit.dart';
import '../../../Data/Model/Product/Product.dart';
import '../../Widgets/TextFields/filledTextField.dart';
import '../../Widgets/TextFields/inventory_textfield.dart';
import '../../Widgets/Button/CustomButoon/custom_button.dart';
import '../../main_screen.dart';
import 'inventory_test.dart';


class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String? leaveDate;
  List<String>? _locations = ['sick','casual']; // Option 2
  String? _selectedLocation; // Option 2
  TextEditingController model=new TextEditingController();
  TextEditingController quantity=new TextEditingController();
  TextEditingController remarks=new TextEditingController();
  String? product;
  Product? productId;
  bool validate = false;
  bool circular = false;
  String? userId;
  String? storeId;
  bool calling=false;
  final _globalkey = GlobalKey<FormState>();

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      storeId = tokenx.get('storeId');
      BlocProvider.of<ProductCubit>(context).getAllProducts();
    });
  }
  @override
  void initState() {
    getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryCubit, InventoryState>(
      listener: (context, state) {
        setState(() {
          circular = false;
        });
        Navigator.pushReplacement(context, PageTransition(MainScreen()));
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
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back,color: Colors.black,size: 27,),
              ),
            ),
            toolbarHeight: 60,
            elevation: 0.5,
          ),
          body:Stack(
            children: [
              dhashboard(context)
            ],
          )
      ),
    );
  }

  Widget dhashboard(context){
    return Material(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            SizedBox(height:3,),
            Flexible(
              flex:100,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: RefreshIndicator(
                    key: refreshKey,
                    onRefresh:refreshList ,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _globalkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const Text('Select product',style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:Color(0xFF232C2E)
                                  ),),
                                  const SizedBox(height: 8,),

                                  //      BlocBuilder<ProductCubit, ProductState>(
                                  //        builder: (context, state) {
                                  //          if(state is ProductsLoaded){
                                  //            final data=state.productsResponse;
                                  //            final products = data.products;
                                  //
                                  //            if (products == null) {
                                  //              return Center(child: Text('No Proeducts found'),);
                                  //            }
                                  //
                                  //            return Container(
                                  //                decoration: BoxDecoration(
                                  //                  borderRadius: BorderRadius.circular(12),
                                  //                  color: Color(0xFFF5F7F8),
                                  //                ),
                                  //                padding: const EdgeInsets.all(4),
                                  //                child: SearchChoices.single(
                                  //                  displayClearIcon: false,
                                  //                  searchInputDecoration: InputDecoration(
                                  //                  ),
                                  //                  items:  products.inventory?.map((item) {
                                  //                    return  DropdownMenuItem<Product>(
                                  //                        child: Text(item.product.productName), value: item);
                                  //                  }).toList(),
                                  //                  value: productId,
                                  //                  hint: 'Select product',
                                  //                  searchHint: 'Enter product Name',
                                  //                  onChanged: (value) {
                                  //                    setState(() {
                                  //                      productId = value;
                                  //                      // Logger().d(selectedValueSingleMenu);
                                  //                    });
                                  //                  },
                                  //                  dialogBox: false,
                                  //                  isExpanded: true,
                                  //                  menuConstraints:
                                  //                  BoxConstraints.tight(Size.fromHeight(350)),
                                  //                ),
                                  //              );
                                  //
                                  //          }
                                  //
                                  //          return Center(child: CircularProgressIndicator(),);
                                  //
                                  // },
                                  //      ),

                                  Dropdown(),

                                  const SizedBox(height: 20,),
                                  Container(
                                    color: Colors.lightGreen,
                                    child: Column(
                                      children: [
                                        const Text('Quantity',style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color:Color(0xFF232C2E)
                                        ),),
                                        const SizedBox(height: 8,),
                                      ],
                                    ),
                                  ),
                                  InventoryTextfield(readOnly: false,controller: quantity,hintText: "Enter Quantity",),
                                  const SizedBox(height: 74,),
                                ],
                              ),
                            ),


                            circular? const Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(child: CircularProgressIndicator())) :CustomButton(
                              title: 'Add',
                              onTap: (){
                                if (_globalkey.currentState!.validate()) {
                                  setState(() {
                                    validate = true;
                                    circular = true;
                                  });
                                  print(model.text);
                                  print(remarks.text);
                                  print(quantity.text);
                                  print(storeId);
                                  BlocProvider.of<InventoryCubit>(context).createInventory(
                                      productId!.id!,
                                      quantity.text,
                                      storeId!,
                                      "token");
                                }},
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final DateTime rangeStartDate = args.value.startDate;
      final DateTime rangeEndDate = args.value.endDate;
      setState(() {
        leaveDate=rangeStartDate.year.toString()+"-"+rangeStartDate.month.toString()+"-"+rangeStartDate.day.toString()+" To "+rangeEndDate.year.toString()+"-"+rangeEndDate.month.toString()+"-"+rangeEndDate.day.toString();
      });
      // print(rangeStartDate.toString()+" "+rangeEndDate.toString());
      print(leaveDate);
    } else {
      final List<PickerDateRange> selectedRanges = args.value;
    }
  }

  Future<Null>refreshList() async{
    refreshKey.currentState?.show(atTop: false);
    setState(() {

    });
    return null;
  }

  void showdialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text('Dialog Title'),
            content: Container(
              height: 300,
              width: 400,
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
                showNavigationArrow: true,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                toggleDaySelection: true,
                // selectionMode: DateRangePickerSelectionMode.range,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: _onSelectionChanged,

              ),
            )
        )
    );
  }

  void showReasonDialog() {

  }


}
