
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Widgets/Button/CustomButoon/showcurvebtn.dart';
import '../../../Widgets/TextFields/normalTextField.dart';


class OmAttendencePage extends StatefulWidget {
  @override
  _OmAttendencePageState createState() => _OmAttendencePageState();
}

class _OmAttendencePageState extends State<OmAttendencePage> {

  String? leaveDate;
  List<String> _reason = ['Waltone','Bimillah']; // Option 2
  String? _selectedReason; // Option 2
  TextEditingController note=new TextEditingController();

  bool validate = false;
  bool circular = false;

  String? storeLan;
  String? storeLon;

  bool circle=false;

  final _globalkey = GlobalKey<FormState>();
  double _totalDistance=0;

  var imagePicker=ImagePicker();

  File? _iamge;
  Future getImage() async{
    final iamge=await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 30);
    setState(() {
      _iamge=File(iamge!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    getCureentLocation();
    SharedPreferences.getInstance().then((prefValue) => {
      setState(() {
        storeLan= prefValue.getString('storelat')?? "";
        storeLon= prefValue.getString('storeLon')?? "";
      })
    });
  }



  @override
  void dispose() {

    super.dispose();
  }

  void getCureentLocation()async{
    var possition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition=await Geolocator.getLastKnownPosition();
    print(lastPosition);
    print(possition.latitude);
    print(possition.longitude);
    if ((await Geolocator.isLocationServiceEnabled())) {
      var distanceInMeters = await Geolocator.distanceBetween(23.70577364304015, 90.36430696730294,possition.latitude,possition.longitude);// lat2 and long2 are global variables with current user's location
      print("xxx "+distanceInMeters.toString());
      setState(() {
        _totalDistance+=distanceInMeters;
      });
    }else{
      print("GPS is off.");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text('Make sure your GPS is on in Settings !'),
              actions: <Widget>[
                FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    })
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Mark Attendance"),
        elevation: 0,
        toolbarHeight: 60,
      ),
      body:_totalDistance==0?Center(child: CircularProgressIndicator(),): _totalDistance<300? Material(
        elevation: 30.0,
        shadowColor: Colors.blueAccent,
        color: Colors.blue,
        child: Container(
          padding: EdgeInsets.only(left: 0,right:0,top: 0),
          child: Column(
            children: [
              //AppBar//App bar
              //App Bar
              SizedBox(height:3,),
              Flexible(
                flex:100,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        child: Form(
                          key: _globalkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MaterialTextField(readOnly:false,lable: "Enter Note",controller: note,hintText: "Please Enter Your Note",),
                              SizedBox(height:30),
                              Text("Click a clear photo of yourself",textAlign: TextAlign.center,),
                              Container(
                                child: _iamge==null? Container():Image.file(_iamge!),
                              ),

                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  width: 200,
                                  child:circle? Center(child: CircularProgressIndicator(),) : ShadowCarveButton(pressed: (){
                                    setState(() {
                                      // circle=true;
                                    });
                                    getImage();
                                  },
                                    width: 120,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ):Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(),
              Text("You are not in you target shop !!",style: TextStyle(color: Colors.redAccent,fontSize: 18,fontWeight: FontWeight.bold),)
            ],
          )
      ),
    );
  }




  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget() {
    return Align(
      alignment: Alignment.center,
      child: _iamge==null?Container():Image.file(_iamge!,height: 800,),
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget() {
    return ShadowCarveButton(pressed: (){
      if (_globalkey.currentState!.validate()) {
        setState(() {
          validate = true;
          circular = true;
        });
        print(note.text);
        print(_selectedReason);

      }},
    );
  }

  void setdata() {
    setState(() {
      // photoUrl="sss";
    });
    // print(photoUrl);
  }

}
