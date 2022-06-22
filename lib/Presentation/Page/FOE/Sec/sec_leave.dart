
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Attendence/attendencelist_card.dart';
import '../../../Widgets/Card/ProfileCard/profile_Card.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../../Widgets/Card/Sec/survey_card.dart';
import '../../../Widgets/Card/Sec/target_card.dart';
import '../../Attendence/Component/attendance_list-component.dart';
class SecLeave extends StatefulWidget {
  const SecLeave({Key? key}) : super(key: key);

  @override
  _SecLeaveState createState() => _SecLeaveState();
}

class _SecLeaveState extends State<SecLeave> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Leave',
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
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 20 / 19,
                            crossAxisSpacing: 13,
                            mainAxisSpacing: 13),
                        itemCount: 3,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, SEC_LEAVE_HISTORY_PAGE);
                            },
                            child: TargetCard(
                              cardImage: Image.asset('assets/images/secimg.png',fit: BoxFit.cover,),
                              title: 'Sadia',
                              subtitle: 'Target Details' ,
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
