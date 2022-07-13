import 'dart:developer';
import 'dart:io';
import 'dart:math' as Math;
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salesx_new_project/Bloc/Attendence/VmAttendence/vm_attendence_cubit.dart';
import 'package:salesx_new_project/Presentation/Page/Training/training_page.dart';
import 'package:salesx_new_project/Presentation/Widgets/Button/CustomButoon/custom_button.dart';
import 'package:salesx_new_project/Presentation/main_screen.dart';
import 'package:search_choices/search_choices.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Bloc/Attendence/attendence_cubit.dart';
import '../../../../Bloc/Store/store_cubit.dart';
import '../../../../Data/Model/Store/Store.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Screens/SplashScreen/splash_screen.dart';
import '../../../Widgets/Button/CustomButoon/showcurvebtn.dart';
import '../../../Widgets/TextFields/normalTextField.dart';
import '../../Attendence/AttendenceDone/done_attendance.dart';


class OmAttendencePage extends StatefulWidget {
  const OmAttendencePage({Key? key}) : super(key: key);

  @override
  _OmAttendencePageState createState() => _OmAttendencePageState();
}

class _OmAttendencePageState extends State<OmAttendencePage> {
  TextEditingController remarkController = TextEditingController();
  TextEditingController note = TextEditingController();
  bool circular = false;
  bool validate = false;

  bool checkAttendance = false;
  late String formattedTime;
  File? _image;
  bool imageprocess = false;
  final picker = ImagePicker();

  String? lat;
  String? lon;
  String? addrerss;

  String? storeLan;
  String checkSign="load";
  String? storeLon;
  String? storeId;
  String? useId;
  String? role;
  String? businessUnit;
  String? formattedDate;
  String? userAddress;
  bool circle=false;
  String? latx;
  String? lonx;
  String? today;
  String? timeformate;
  String? minuteformat;
  double _totalDistance=-1;

  String? datae;
  bool? islate = false;
  final _globalkey = GlobalKey<FormState>();

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('MM-yyyy');
  static final DateFormat formate = DateFormat('yyyy-MM-dd');
  static final DateFormat formateinfo = DateFormat('MM-dd-yyyy');
  final String formatted = formatter.format(now);
  final String dateIn = formate.format(now);
  final String formatdDate = formateinfo.format(now);

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      today=formatdDate;
      role = tokenx.get('role');
      storeId = tokenx.get('storeId');
      businessUnit = tokenx.get('businessUnit');
      useId = tokenx.get('userId');

      final minuteformat = now.hour.toString()+":"+now.minute.toString();

      BlocProvider.of<StoreCubit>(context).getAllStore();
      BlocProvider.of<AttendenceCubit>(context).checkLateAttendance(minuteformat);
      BlocProvider.of<VmAttendenceCubit>(context).chekVmAttendance(useId!);

      // if(role=="RE"){
      //   BlocProvider.of<VmAttendenceCubit>(context).chekReSignffAttendance(useId!);
      // }else{
      //   BlocProvider.of<VmAttendenceCubit>(context).chekVmSignffAttendance(useId!);
      // }

    });
  }

// 2. compress file and get file.
  Future<Uint8List?> testCompressFile(File file) async {
    print("testCompressFile");
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 40,
      rotate: 360,
    );

    Uint8List? imageInUnit8List = result; // store unit8List image here ;
    final tempDir = await getTemporaryDirectory();
    File filex = await File('${tempDir.path}/image.png').create();
    filex.writeAsBytesSync(imageInUnit8List!);
    setState(() {
      _image = filex;
    });
    print(result);
    // print(provider);
    return result;
  }

  Future getImage() async {
    final iamge = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      testCompressFile(File(iamge!.path));
    });
  }

  void getCureentLocationName()async {
    var possition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //location name
    List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
    setState(()  {
      userAddress=placemarks[0].name.toString()+","+placemarks[0].street.toString()
          +","+placemarks[0].locality.toString()+","+placemarks[0].postalCode.toString()
          +","+placemarks[0].subLocality.toString()
          +","+placemarks[0].subAdministrativeArea.toString();
    });
  }
  void getCurrentLanLot()async{
    var possition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {

      setState(() {
        latx=possition.latitude.toString();
        lonx=possition.longitude.toString();
      });
    });
  }
  void getCureentLocation(double lat,double lon)async{
    var possition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition=await Geolocator.getLastKnownPosition();
    print(lastPosition);
    if ((await Geolocator.isLocationServiceEnabled())) {
      var distanceInMeters = await Geolocator.distanceBetween(lat, lon,possition.latitude,possition.longitude);// lat2 and long2 are global variables with current user's location
      print("xxx "+distanceInMeters.toString());
      setState(() {
        _totalDistance=distanceInMeters;
        setState(() {
          latx=possition.latitude.toString();
          lonx=possition.longitude.toString();
          _totalDistance=distanceInMeters;
          print("dddd"+_totalDistance.toString());
        });
        print("dddd"+_totalDistance.toString());
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

  Store? selectedValue;

  @override
  void initState() {
    getCureentLocationName();
    getCurrentLanLot();
    getToken();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<VmAttendenceCubit, VmAttendenceState>(
      builder: (context, state) {
        if(state is !CheckVmAtendance){
          return Center(child: CircularProgressIndicator(),);
        }
        var data = (state as CheckVmAtendance).attendance;
        log("vm attendence"+data!);
        return data=="yes"? DoneAttendance():Container(
          color: Colors.white,
          child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    title: const Text(
                      'Attendance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    leading: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 27,
                        ),
                      ),
                    ),
                    toolbarHeight: 60,
                    elevation: 0.5,
                  ),
                  body: Stack(
                    children: [
                      BlocListener<VmAttendenceCubit, VmAttendenceState>(
                        listener: (context, state) {
                          if (state is GiveVmAttendance) {
                            setState(() {
                              circular = false;
                              Navigator.pushReplacement(context, PageTransition(MainScreen()));
                            });
                          }
                        },
                        child: Material(
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                            child: Column(
                              children: [
                                //AppBar//App bar
                                //App Bar
                                SizedBox(height: 3,),
                                Flexible(
                                  flex: 100,
                                  child: Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: Form(
                                            key: _globalkey,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .center,
                                              children: [
                                                SizedBox(height: 14,),
                                                BlocBuilder<StoreCubit,
                                                    StoreState>(
                                                  builder: (context, state) {
                                                    if (state is !GetAllStore) {
                                                      return Center(
                                                        child: CircularProgressIndicator());
                                                    }
                                                    final data = (state as GetAllStore).storeGetResponse;
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8.0),
                                                        border: Border.all(color: Colors.black12)
                                                      ),
                                                      padding: EdgeInsets.all(8),
                                                      child: SearchChoices.single(
                                                        displayClearIcon: false,
                                                        searchInputDecoration: const InputDecoration(
                                                          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                                                          border: OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0)),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey,
                                                                width: 1.0),
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0)),
                                                          ),
                                                        ),
                                                        items: data!.stores!.map((
                                                            item) {
                                                          return DropdownMenuItem<Store>(
                                                              child: Text(item.storename!),
                                                              value: item);
                                                        }).toList(),
                                                        value: selectedValue,
                                                        hint: 'Select store',
                                                        searchHint: 'Enter store Name',
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectedValue = value;
                                                            // Logger().d(selectedValueSingleMenu);
                                                          });
                                                        },
                                                        dialogBox: false,
                                                        isExpanded: true,
                                                        menuConstraints:
                                                        BoxConstraints.tight(Size
                                                            .fromHeight(350)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                SizedBox(height: 14,),
                                                MaterialTextField(lable: "Note",
                                                  controller: note,
                                                  hintText: "Enter note", readOnly: false,),
                                                SizedBox(height: 20),
                                                const Text(
                                                  "Click a clear photo of yourself",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF727272)
                                                  ),
                                                  textAlign: TextAlign.center,),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: _image == null
                                                      ? Center(child: Text(''),)
                                                      : Image.file(
                                                    _image!,height: 350,),
                                                ),


                                                const SizedBox(
                                                  height: 16,
                                                ),


                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: _image == null
                                                      ? circle
                                                      ? Container()
                                                      : InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          //circle=true;
                                                          imageprocess = true;
                                                          getImage();
                                                        });
                                                        //getImage();
                                                      },
                                                      child: Container(
                                                        height: 54,
                                                        width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                          color: _image != null
                                                              ? Color(0x88BFDCFC)
                                                              : Color(0xFF0180F5),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                        ),
                                                        child: Center(
                                                          child: RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  WidgetSpan(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                            10),
                                                                        child: Icon(
                                                                            Icons
                                                                                .camera_enhance_sharp,
                                                                            size:
                                                                            20,
                                                                            color: _image !=
                                                                                null
                                                                                ? Color(0xFF0180F5)
                                                                                : Colors.white)),
                                                                  ),
                                                                  TextSpan(
                                                                      text: _image !=
                                                                          null
                                                                          ? tr(
                                                                          'Retake Photo')
                                                                          : tr(
                                                                          "Take a photo"),
                                                                      //text: tr("Take a photo"),
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                          fontSize:
                                                                          16,
                                                                          color: _image !=
                                                                              null
                                                                              ? Color(
                                                                              0xFF0180F5)
                                                                              : Colors
                                                                              .white)),
                                                                ]),
                                                          ),
                                                        ),
                                                      ))
                                                      : Container(),
                                                ),


                                                _image != null ? circle
                                                    ? Center(
                                                  child: CircularProgressIndicator(),)
                                                    : CustomButton(
                                                  title: 'Mark Attendance',
                                                  onTap: (){
                                                    print(note.text);
                                                    print(_totalDistance);
                                                    if (_image == null) {
                                                      Container();
                                                    } else {
                                                      setState(() {
                                                        circle = true;
                                                      });

                                                      if (role == "RE") {
                                                        BlocProvider.of<VmAttendenceCubit>(context).giveReAttendance(_image!, selectedValue == null ? "" : selectedValue!.id!, businessUnit!, useId!, note.text == "" ? "N/A" : note.text, latx!, lonx!, userAddress!);
                                                      } else {
                                                        BlocProvider.of<
                                                            VmAttendenceCubit>(
                                                            context)
                                                            .giveVmAttendance(
                                                            _image!,
                                                            selectedValue == null
                                                                ? ""
                                                                : selectedValue!
                                                                .id!,
                                                            businessUnit!,
                                                            useId!,
                                                            note.text == ""
                                                                ? "N/A"
                                                                : note.text,
                                                            latx!,
                                                            lonx!,
                                                            userAddress!);
                                                      }
                                                    }
                                                  },
                                                ) :


                                                imageprocess ? selectedValue != null ? _totalDistance == -1.0
                                                    ? Text(
                                                    "Select Store or Take Photo")
                                                    : _totalDistance < 50 ? circle
                                                    ? Center(
                                                  child: CircularProgressIndicator(),)
                                                    : CustomButton(
                                                       title: 'Mark Your Attendence',
                                                  onTap: (){
                                                    print(note.text);
                                                    print(_totalDistance);
                                                    if (_image == null) {
                                                      showAlertDialog(context);
                                                    } else {
                                                      setState(() {
                                                        circle = true;
                                                      });
                                                      BlocProvider.of<
                                                          VmAttendenceCubit>(
                                                          context)
                                                          .giveVmAttendance(
                                                          _image!,
                                                          selectedValue == null
                                                              ? ""
                                                              : selectedValue!
                                                              .id!,
                                                          businessUnit!,
                                                          useId!,
                                                          note.text == ""
                                                              ? "N/A"
                                                              : note.text,
                                                          latx!,
                                                          lonx!,
                                                          userAddress!);
                                                    }
                                                  },
                                                ): Text("You are not in store")
                                                    : Container() : Container()
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
                        )
                      ),

                    ],
                  )
              )
          ),

        );
      },
    );
  }

  Widget topCardWidget() {
    return Align(
      alignment: Alignment.center,
      child: _image==null?Text('first card'):Image.file(_image!,height: 800,),
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
      }},
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("Please Take Your Photo."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogForImage(BuildContext context,String text) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text(text),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  showAlertDialogDone(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 300,
        width: MediaQuery.of(context).size.width*0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/check_grren.png'),
            const Text("Done!",style: TextStyle(color: Color(0XFF000000),fontSize:30,fontWeight: FontWeight.w800 ),textAlign: TextAlign.center,),
            const Text("You have successfully mark \n your attendance.",style: TextStyle(color: Color(0XFF000000),fontSize:16,fontWeight: FontWeight.w400 ),textAlign: TextAlign.center,),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child:  InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, PageTransition(MainScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent
                    ),
                    child: Text("Start your work",style: TextStyle(color: Color(0XFFffffff),fontSize:16 ),textAlign: TextAlign.center,),
                  ),
                )
            ),
          ],
        ),
      ),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
