
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salesx_new_project/Bloc/Product/product_cubit.dart';
import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/InventoryCard/inventory_list.dart';
import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';
import '../../Inventory/inven_card.dart';
import '../../Inventory/inventory_components.dart';
class SecInventoryHistory extends StatefulWidget {
  final String? userid;
  final String? storeIdx;
  const SecInventoryHistory({Key? key,this.storeIdx,this.userid}) : super(key: key);

  @override
  _SecInventoryHistoryState createState() => _SecInventoryHistoryState();
}

class _SecInventoryHistoryState extends State<SecInventoryHistory> {

  String? userId;
  String? storId;
  String? role;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();


  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      storId = tokenx.get('storeId');
      role = tokenx.get('role');
      BlocProvider.of<ProductCubit>(context).getAllProduct(widget.storeIdx==null?storId!: storId!,widget.userid!);

    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
            title: const Text('Gulshan DSS Market’s Inventory list',
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
            elevation: 0.5,
          ),
         body: BlocListener<ProductCubit, ProductState>(
           listener: (context, state) {
             // if(state is AllProduct){
             //   setState(() {
             //
             //   });
             // }
           },
           child: BlocBuilder<ProductCubit, ProductState>(
             builder: (context, state) {
               if (state is  ProductsError) {
                 return  Center(child: Text(state.message),);
               }

               if (state is ProductsLoaded ) {
                 final data = state .productsResponse;
                 final inventory = data?.products!.inventory;

                 if (inventory == null) {
                   return Center(child: Text('No Products found'),);
                 }

                 return Column(
                   children: [
                     Column(
                       children: [

                         // Text('You have total'+data.products!.length.toString()+'products',
                         //   style: TextStyle(
                         //     fontSize:16,
                         //     fontWeight: FontWeight.w500,
                         //     color: Colors.black.withOpacity(0.7),
                         //   ),
                         // ),

                         inventory.isEmpty ?
                         Container(
                           height: MediaQuery.of(context).size.height*0.5,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Image.asset('assets/images/nodata.png'),
                               Text('No data available',style: TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black.withOpacity(0.8)
                               ),),
                             ],
                           ),
                         ) :
                         Container(
                           margin: EdgeInsets.only(top: 20),
                           child: GridView.builder(
                             physics: NeverScrollableScrollPhysics(),
                             shrinkWrap: true,
                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 2,
                                 crossAxisSpacing: 13.0,
                                 mainAxisSpacing: 13.0,
                                 childAspectRatio: 15/14
                             ),
                             itemCount: inventory.length,
                             itemBuilder: (context, index) {

                               final _inventory = inventory[index];
                               final product = _inventory.product;


                               return InventoryModelCard(
                                 name: product?.productName ?? '',
                                 price: product?.promoprice ?? '0',
                                 category: product?.category ?? '',
                               );
                             },
                           ),
                         ),
                       ],
                     ),
                   ],
                 );

               }

               return Center(
                 child: CircularProgressIndicator(),
               );

             },
           ),
         )
        ),
      ),
    );
  }
}
