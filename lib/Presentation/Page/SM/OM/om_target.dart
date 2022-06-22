
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Sec/target_card.dart';

class OmTarget extends StatefulWidget {
  const OmTarget({Key? key}) : super(key: key);

  @override
  _OmTargetState createState() => _OmTargetState();
}

class _OmTargetState extends State<OmTarget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Target',
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
                              Navigator.pushNamed(context, SEC_TARGET_HISTORY_PAGE);
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
