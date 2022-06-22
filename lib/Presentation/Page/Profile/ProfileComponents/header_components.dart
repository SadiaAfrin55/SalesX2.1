
import 'package:flutter/material.dart';

import '../../../../Service/LocalDataBase/localdata.dart';
class HeaderComponents extends StatefulWidget {
  const HeaderComponents({Key? key}) : super(key: key);

  @override
  State<HeaderComponents> createState() => _HeaderComponentsState();
}

class _HeaderComponentsState extends State<HeaderComponents> {
  String? name;
  String? role;
  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      name = tokenx.get('name');
      role = tokenx.get('role');
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
      child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 34),
                width: 72,
                height: 72,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/profile_user.png'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(name??"",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xFF232C2E),
                fontFamily: 'Manrope',
              ),
            ),
            SizedBox(height: 4),
            Text(role??"",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF232C2E),
                fontFamily: 'Manrope',
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
    );

  }
}
