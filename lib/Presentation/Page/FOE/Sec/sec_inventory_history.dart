
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/InventoryCard/inventory_list.dart';
import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';
class SecInventoryHistory extends StatefulWidget {
  const SecInventoryHistory({Key? key}) : super(key: key);

  @override
  _SecInventoryHistoryState createState() => _SecInventoryHistoryState();
}

class _SecInventoryHistoryState extends State<SecInventoryHistory> {
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
          body: Container(
            margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('You have total products',
                  style: TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 20,),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 19.0,
                      mainAxisSpacing: 17.0,
                      childAspectRatio: 2/2
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InventoryListCard(
                      // name: data.products!.inventory![index].product!.productName,
                      // price: data.products!.inventory![index].product!.productName,
                      // status: data.products!.inventory![index].product!.productName,
                    );

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
