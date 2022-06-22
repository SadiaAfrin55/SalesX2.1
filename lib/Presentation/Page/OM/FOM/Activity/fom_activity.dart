
import 'package:flutter/material.dart';
import 'package:salesx_new_project/Presentation/Page/Foe/secActivity/secActivityComponent/secActivity_component.dart';

import '../../../FOM/FomActivity/foe_activity_components.dart';
import 'Components/fom_activity_components.dart';
class FomFoeActivity extends StatelessWidget {
  const FomFoeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('FOE’s Activity',
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
                FomActivityComponents()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
