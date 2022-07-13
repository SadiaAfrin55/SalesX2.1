import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/Product/product_cubit.dart';
import '../../../../Bloc/Sales/sales_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import 'inven_card.dart';


class InventoryListComponents extends StatefulWidget {
  final String? newStore;
  const InventoryListComponents({this.newStore,Key? key}) : super(key: key);

  @override
  _InventoryListComponentsState createState() => _InventoryListComponentsState();
}

class _InventoryListComponentsState extends State<InventoryListComponents> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCubit, ProductState>(
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
                            price: _inventory.quantity?.toString() ?? '5',
                            //category: product?.category ?? '',
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
    );
  }
}
