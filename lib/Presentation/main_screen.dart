import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salesx_new_project/Bloc/Login/login_cubit.dart';

import '../Service/LocalDataBase/localdata.dart';
import 'Page/Foe/foe_homePage.dart';
import 'Page/Foe/foe_profilePage.dart';
import 'Page/Home/home_page.dart';
import 'Page/OM/Home/om_home_page.dart';
import 'Page/FOM/FomHome/fom_home_page.dart';
import 'Page/OM/Profile/om_profile_page.dart';
import 'Page/Profile/profile_page.dart';
import 'Page/FOM/FomProfile/fom_profile_page.dart';
import 'Page/SM/SmHome/sm_home.dart';
import 'Page/SM/SmProfile/Component/sm_profile.dart';
import 'Screens/SplashScreen/splash_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController = PageController();

  //for tabs
  int _currentIndex = 0;
  String?role;
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      role = tokenx.get('role');
    });
  }

  @override
  void initState() {
    getToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          //drawer: Drawer(),
          body: SizedBox.expand(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                role=="SOM"?SMHomePage():role=="FOM"?FOMHomePage():role=="OM"?OMHomePage():role=="FOE"?FoeHomePage():HomePage(),
                role=="SOM"?SMProfilePage():role=="FOM"?FOMProfilePage():role=="OM"?OmProfilePage():role=="FOE"?FoeProfilePage():ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF0180F5),
            unselectedLabelStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            selectedLabelStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items:  [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/bottomhome.svg",color: Colors.black,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/bottomuser.svg",),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
