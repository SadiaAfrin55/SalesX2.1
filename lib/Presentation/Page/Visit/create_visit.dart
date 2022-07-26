
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Bloc/visit_cubit.dart';

import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../main_screen.dart';
class CreateShop extends StatefulWidget {
  final String? shopId;
  const CreateShop({this.shopId,Key? key}) : super(key: key);

  @override
  _CreateShopState createState() => _CreateShopState();
}

class _CreateShopState extends State<CreateShop> {
  bool circle = false;
  bool validate = false;
  File? _image;
  bool imageprocess = false;
  final picker = ImagePicker();
  String? useId;
  final _globalkey = GlobalKey<FormState>();

  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      useId = tokenx.get('userId');
      //BlocProvider.of<VisitCubit>(context).giveVisitShop(useId!);
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
    return BlocListener<VisitCubit, VisitState>(
      listener: (context, state) {
        if (state is MarkVisit) {
          final data = (state as MarkVisit).attendance;
          if (data=="success") {
            showAlertDialog(context);
            //Navigator.pushReplacement(context, PageTransition(MainScreen()));
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
            'Visit',
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
                    height: 20,
                  ),


                  InkWell(
                    onTap: (){
                      setState(() {
                        //circle=true;
                        imageprocess =
                        true;
                        getImage();
                      });
                    },
                    child: Container(
                      height: 54,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: _image != null ? Color(0x88BFDCFC) : Color(0xFF0180F5),
                        borderRadius: BorderRadius.circular(6),
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
                    ),
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
                          BlocProvider.of<VisitCubit>(context).giveVisitShop(_image!, widget.shopId!, useId!);

                          log('photooooooooooooooo  ');
                        } else {
                          setState(() {
                            circle = true;
                          });
                          log('muuuuuuuuuuuuuuuuuuuuuu  ');
                          BlocProvider.of<VisitCubit>(context).giveVisitShop(_image!, widget.shopId!, useId!);
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
                              "Submit",
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
  showAlertDialog(BuildContext context) {
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
            Image.asset('assets/icons/Frame.png'),
            const Text("Done!!",style: TextStyle(color: Color(0XFF000000),fontSize:30,fontWeight: FontWeight.w800 ),textAlign: TextAlign.center,).tr(),
            const Text("You have successfully done your visit",style: TextStyle(color: Color(0XFF000000),fontSize:16,fontWeight: FontWeight.w400 ),textAlign: TextAlign.center,).tr(),
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
                    child: Text("Star your work",style: TextStyle(color: Color(0XFFffffff),fontSize:16 ),textAlign: TextAlign.center,).tr(),
                  ),
                )
            ),
          ],
        ),
      ),
    );
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
