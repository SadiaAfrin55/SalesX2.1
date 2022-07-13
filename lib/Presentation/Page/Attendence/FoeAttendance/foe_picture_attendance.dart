
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salesx_new_project/Bloc/Attendence/FoeAttendence/foe_attendence_cubit.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Bloc/visit_cubit.dart';
import 'package:salesx_new_project/Presentation/Screens/SplashScreen/splash_screen.dart';

import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/TextFields/normalTextField.dart';
import '../../../main_screen.dart';


class FoePictureAttendencePage extends StatefulWidget {
  final String? shopId;
  const FoePictureAttendencePage({this.shopId,Key? key}) : super(key: key);

  @override
  _FoePictureAttendencePageState createState() => _FoePictureAttendencePageState();
}

class _FoePictureAttendencePageState extends State<FoePictureAttendencePage> {
  bool circle = false;
  bool validate = false;
  File? _image;
  bool imageprocess = false;
  final picker = ImagePicker();
  String? useId;
  String? businessunit;
  String? lat;
  String? lon;
  String? addrerss;
  TextEditingController note=new TextEditingController();
  final _globalkey = GlobalKey<FormState>();

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      useId = tokenx.get('userId');
      businessunit = tokenx.get('businessUnit');
      //BlocProvider.of<VisitCubit>(context).giveVisitShop(useId!);
    });
  }

  void getCureentLocationName()async {
    var possition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //location name
    List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
    setState(()  {
      addrerss=placemarks[0].name.toString()+","+placemarks[0].street.toString()
          +","+placemarks[0].locality.toString()+","+placemarks[0].postalCode.toString()
          +","+placemarks[0].subLocality.toString()
          +","+placemarks[0].subAdministrativeArea.toString();
    });
  }
  void getCurrentLanLot()async{
    var possition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {

      setState(() {
        lat=possition.latitude.toString();
        lon=possition.longitude.toString();
      });
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

  @override
  void initState() {
    getToken();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<FoeAttendenceCubit, FoeAttendenceState>(
      listener: (context, state) {
        if (state is GiveFoeAttendance) {
          final data = (state as GiveFoeAttendance).status;
          if (data==true) {
            Navigator.pushReplacement(context, PageTransition(MainScreen()));
          }
        } else {
          circle = false;
        }
      },
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
        body: Form(
          key: _globalkey,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 16, vertical: 25),
              child: Column(
                children: [

                  Column(
                    children: [
                      MaterialTextField(lable: "Note",controller: note,hintText: "Enter note", readOnly: false,),
                      SizedBox(height:30),
                      const Text(
                        "Please take a clear photo yourself",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF727272)),
                      ).tr(),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),

                  _image == null
                      ? Container()
                      : Container(
                    height: 356,
                    width: MediaQuery.of(context)
                        .size
                        .width,
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
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

                  const SizedBox(
                    height: 8,
                  ),

                  _image == null
                      ? Container(
                    child: Center(
                      child: Text(''),
                    ),
                  )
                      : circle
                      ? Center(
                    child:
                    Text(''),
                  )
                      : InkWell(
                      onTap: () {
                        if (_globalkey
                            .currentState!
                            .validate()) {
                          setState(() {
                            circle = true;
                          });
                          BlocProvider.of<FoeAttendenceCubit>(context).giveFoeAttendance(_image!, widget.shopId!, useId!,businessunit!,lat!,lon!,note.text==""?"N/A":note.text);
                          print(_image);
                          print(widget.shopId);
                          print(useId);
                          print(businessunit);
                          print(lat);
                          print(lon);
                          print(note.text);

                          log('photooooooooooooooo  ');
                        } else {
                          setState(() {
                            circle = true;
                          });
                          log('muuuuuuuuuuuuuuuuuuuuuu  ');
                          BlocProvider.of<FoeAttendenceCubit>(context).giveFoeAttendance(_image!, widget.shopId!, useId!,businessunit!,lat!,lon!,note.text==""?"N/A":note.text);
                        }
                      },
                      child: Container(
                        height: 54,
                        width:
                        MediaQuery.of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            color:
                            Color(0xff0180F5),
                            borderRadius:
                            BorderRadius
                                .circular(6)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                          children: [
                            Text(
                              "Mark your attendance",
                              style: TextStyle(
                                  color: Colors
                                      .white,
                                  fontSize: 16,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            ).tr(),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
