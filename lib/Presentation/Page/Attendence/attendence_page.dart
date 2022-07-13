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
import 'package:path_provider/path_provider.dart';
import 'package:salesx_new_project/Presentation/Page/Training/training_page.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Bloc/Attendence/attendence_cubit.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/CustomButoon/customiIcon_button.dart';
import '../../Widgets/TextFields/normalTextField.dart';
import '../../main_screen.dart';
import '../FOE/Attendence/foe_attendence_page.dart';
import '../OM/OmAttendence/om_attendence.dart';
import 'AttendenceDone/done_attendance.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  _AttendencePageState createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  TextEditingController remarkController = TextEditingController();
  TextEditingController note = TextEditingController();
  bool circle = false;
  bool validate = false;
  bool checkAttendance = false;
  late String formattedTime;
  File? _image;
  bool imageprocess = false;
  final picker = ImagePicker();
  String? lat;
  String? lon;
  String? addrerss;

  String? token;
  String? role;
  String? storeId;
  String? businessUnit;
  String? useId;
  String? timeformate;

  String? datae;
  bool? islate = false;
  final _globalkey = GlobalKey<FormState>();

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('MM-yyyy');
  static final DateFormat formate = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final String dateIn = formate.format(now);

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      token = tokenx.get('token');
      role = tokenx.get('role');
      storeId = tokenx.get('storeId');
      businessUnit = tokenx.get('businessUnit');
      useId = tokenx.get('userId');
      BlocProvider.of<AttendenceCubit>(context).chekUserAttendance(useId!);
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

  void getCureentLocationName() async {
    // Test if location services are enabled.
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("'Location Permission Denied'");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var possition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //location name
    List<Placemark> placemarks =
        await placemarkFromCoordinates(possition.latitude, possition.longitude);
    setState(() {
      lat = possition.latitude.toString();
      lon = possition.longitude.toString();
      addrerss = placemarks[0].name.toString() +
          "," +
          placemarks[0].street.toString() +
          "," +
          placemarks[0].locality.toString() +
          "," +
          placemarks[0].postalCode.toString() +
          "," +
          placemarks[0].subLocality.toString() +
          "," +
          placemarks[0].subAdministrativeArea.toString();
    });
  }

  @override
  void initState() {
    getCureentLocationName();
    // print(addrerss);
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: role == "OM"
            ? OmAttendencePage()
            : role == "FOM"
                ? OmAttendencePage()
                : role == "FOE"
                    ? OmAttendencePage()
                    : role == "SOM"
                        ? OmAttendencePage()
                        : BlocBuilder<AttendenceCubit, AttendenceState>(
                            builder: (context, state) {
                              if (state is! CheckUserAttendance) {
                                return Container();
                              }
                              var data =
                                  (state as CheckUserAttendance).attendance;

                              return data == "yes"
                                  ? DoneAttendance()
                                  : BlocListener<AttendenceCubit,
                                      AttendenceState>(
                                      listener: (context, state) {
                                        if (state is MarkMorningAttendance) {
                                          final data =
                                              (state as MarkMorningAttendance)
                                                  .attendance;
                                          if (data!) {
                                            Navigator.pushReplacement(context,
                                                PageTransition(MainScreen()));
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
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
                                                      BlocBuilder<
                                                          AttendenceCubit,
                                                          AttendenceState>(
                                                        builder:
                                                            (context, state) {
                                                          if (state
                                                              is CheckMoringLateAttendance) {
                                                            final dataLate =
                                                                state.status;
                                                            return dataLate ==
                                                                    "yes"
                                                                ? Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        const SizedBox(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                        const Text(
                                                                          "You are late, Please tell us why you late?",
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ).tr(),
                                                                        const SizedBox(
                                                                          height:
                                                                              16,
                                                                        ),
                                                                        MaterialTextField(
                                                                          lable:
                                                                              tr("Remark"),
                                                                          hintText:
                                                                              tr("type your reasons"),
                                                                          readOnly:
                                                                              false,
                                                                          controller:
                                                                              remarkController,
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              16,
                                                                        ),
                                                                      ],
                                                                    ))
                                                                : Container(
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          'perfect'),
                                                                    ),
                                                                  );
                                                          }
                                                          return Shimmer
                                                              .fromColors(
                                                            baseColor:
                                                                Colors.grey,
                                                            highlightColor:
                                                                Colors.white,
                                                            child: Container(
                                                              height: 50,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      const Text(
                                                        "Please take a clear photo yourself",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Color(
                                                                0xFF727272)),
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
                                                          width: MediaQuery.of(
                                                                  context)
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
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: _image == null
                                                        ? circle
                                                            ? Container()
                                                            : InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    //circle=true;
                                                                    imageprocess =
                                                                        true;
                                                                    getImage();
                                                                  });
                                                                  //getImage();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 54,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: _image !=
                                                                            null
                                                                        ? Color(
                                                                            0x88BFDCFC)
                                                                        : Color(
                                                                            0xFF0180F5),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(6),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        RichText(
                                                                      text: TextSpan(
                                                                          children: [
                                                                            WidgetSpan(
                                                                              child: Container(margin: EdgeInsets.only(right: 10), child: Icon(Icons.camera_enhance_sharp, size: 20, color: _image != null ? Color(0xFF0180F5) : Colors.white)),
                                                                            ),
                                                                            TextSpan(
                                                                                text: _image != null ? tr('Retake Photo') : tr("Take a photo"),
                                                                                //text: tr("Take a photo"),
                                                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: _image != null ? Color(0xFF0180F5) : Colors.white)),
                                                                          ]),
                                                                    ),
                                                                  ),
                                                                ))
                                                        : Container(),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  addrerss == null
                                                      ? Container()
                                                      : _image == null
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
                                                                      setState(
                                                                          () {
                                                                        circle =
                                                                            true;
                                                                      });
                                                                      BlocProvider.of<AttendenceCubit>(context).giveMorningAttendance(
                                                                          _image!,
                                                                          storeId!,
                                                                          businessUnit!,
                                                                          useId!,
                                                                          role!,
                                                                          addrerss!);

                                                                      log('photooooooooooooooo  ');
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        circle =
                                                                            true;
                                                                      });
                                                                      log('muuuuuuuuuuuuuuuuuuuuuu  ');
                                                                      BlocProvider.of<AttendenceCubit>(context).giveMorningAttendance(
                                                                          _image!,
                                                                          storeId!,
                                                                          businessUnit!,
                                                                          useId!,
                                                                          role!,
                                                                          addrerss!);
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 54,
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(
                                                                            0xff0180F5),
                                                                        borderRadius:
                                                                            BorderRadius.circular(6)),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "Mark your attendance",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600),
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
                            },
                          ),
      ),
    );
  }
}
