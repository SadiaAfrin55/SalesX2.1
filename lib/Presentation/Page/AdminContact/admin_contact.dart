import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Button/AdminBtn/admin_contact_btn.dart';

class ContactAdmin extends StatefulWidget {
  const ContactAdmin({Key? key}) : super(key: key);

  @override
  _ContactAdminState createState() => _ContactAdminState();
}

class _ContactAdminState extends State<ContactAdmin> {

  String? linemanagername;
  String? role;
  String? businessUnit;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      linemanagername = tokenx.get('linmanagerName');
      role = tokenx.get('role');
      businessUnit = tokenx.get('businessUnit');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
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
              title: const Text('Contact with admin',
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
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset("assets/images/down.png"),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                  role=="OM"?Positioned(
                    top: 60,
                    right: 20,
                    left: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(businessUnit?? " ",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ):role=="FOE"?Positioned(
                        top: 60,
                        right: 20,
                        left: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(businessUnit?? " ",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      ):Positioned(
                    top: 60,
                    right: 20,
                    left: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(linemanagername?? " ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),


                  const SizedBox(height: 24,),
                  Positioned(
                    top: 100,
                    right: 20,
                    left: 20,
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: AdminContactBtn(
                              title: 'Call',
                              img: SvgPicture.asset('assets/images/call.svg'),
                              pressed: () {
                                launch('tel:+0173245678');
                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            flex: 6,
                            child: AdminContactBtn(
                              title: 'Message',
                              img: SvgPicture.asset('assets/images/sms.svg'),
                              pressed: () {
                                launch('sms:+0173245678');
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
