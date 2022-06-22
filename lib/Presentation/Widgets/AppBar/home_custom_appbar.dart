import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LocalDataBase/localdata.dart';
class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String? userAddress;

  void getCureentLocationName()async {
    var possition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //location name
    List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
    if(mounted)setState(()  {

      userAddress=placemarks[0].name.toString()+","+placemarks[0].street.toString();
    });
  }
  String? name;

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      name = tokenx.get('name');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    getCureentLocationName();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.5)),
        )
      ),

      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //profile
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child:Image.asset("assets/icons/profile_user.png"),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name??" ",style: const TextStyle(fontSize:15,fontWeight: FontWeight.bold ),),
                  Wrap(
                    children: [
                      Text(userAddress??"LOADING",style: const TextStyle(fontSize:12,fontWeight: FontWeight.w300 ))
                    ],
                  ),
                ],
              )
            ],
          ),

          Expanded(
              flex: 1,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, CONTACT_ADMIN_PAGE);
                      },
                      icon: SvgPicture.asset('assets/icons/admin.svg')
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.pushNamed(context, NOTIFICATION_PAGE);
                      },
                      icon: SvgPicture.asset('assets/icons/notification.svg')
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
