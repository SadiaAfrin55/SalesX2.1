
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.5,
            leading:  BackButton(
                color: Colors.black
            ),
            backgroundColor: Colors.white,
            title: Text("Forget Password",style: TextStyle(color: Colors.black,fontSize:16,fontWeight: FontWeight.w700 ),),
          ),
          body: Container(
            color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/images/up.png",),),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 20,left: 8,right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/phonecall.svg"),
                          SizedBox(height:18 ,),
                          const Text("To reset your password\ncontact with your organization.",textAlign: TextAlign.center,style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                          ),
                          ),
                        ],
                      )
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset("assets/images/down.png"),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
