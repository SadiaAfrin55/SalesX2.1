import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import '../../../Bloc/Product/product_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Card/InventoryCard/inventory_list.dart';
import '../../Widgets/Card/Survey/phone_card.dart';
import '../../Widgets/LoadAnimation/MapLoadingAnimation.dart';
import '../Survey/survey_noData.dart';
import 'inven_card.dart';
import 'inventory_components.dart';

class InventoryList extends StatefulWidget {
  final String? storeIdx;
  const InventoryList({this.storeIdx,Key? key}) : super(key: key);

  @override
  _InventoryListState createState() => _InventoryListState();
}

class _InventoryListState extends State<InventoryList> {

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
      BlocProvider.of<ProductCubit>(context).getAllProduct(widget.storeIdx==null?storId!: storId!,userId!);

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
    //BlocProvider.of<ProductCubit>(context).getAllProduct(widget.storeIdx ?? storId!,userId!);
    // widget.storeIdx==null?storId!:widget.storeIdx,userId!

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Inventory list',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,size: 27,),
          ),
        ),
        toolbarHeight: 54,
        elevation: 0.5,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 21),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InventoryListComponents(),
              ],
            ),
          ),
        ),
      );
  }

}
