//
// import 'dart:io';
//
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:logger/logger.dart';
// import 'package:intl/intl.dart';
// import 'package:salesx_new_project/Bloc/Attendence/attendence_cubit.dart';
// import 'package:salesx_new_project/Presentation/Widgets/Button/CustomButoon/custom_button.dart';
// import 'package:salesx_new_project/Presentation/main_screen.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:image/image.dart' as Im;
// import 'package:path_provider/path_provider.dart';
// import 'dart:math' as Math;
//
// import '../../../../Service/LocalDataBase/localdata.dart';
// import '../../../Screens/SplashScreen/splash_screen.dart';
// import '../../../Widgets/Button/CustomButoon/showcurvebtn.dart';
//
// class MarkEveningAttendance extends StatefulWidget {
//   final String? type;
//
//   const MarkEveningAttendance({Key? key, this.type}) : super(key: key);
//   @override
//   _MarkEveningAttendanceState createState() => _MarkEveningAttendanceState();
// }
//
// class _MarkEveningAttendanceState extends State<MarkEveningAttendance> {
//
//
//   TextEditingController note=new TextEditingController();
//
//   bool validate = false;
//   bool circular = false;
//
//   String? storeLan;
//   String? storeLon;
//   String? storeId;
//   String? useId;
//   String? role;
//   String? businessUnit;
//   String? formattedDate;
//   String? userAddress;
//   bool circle=false;
//   bool imageprocess=false;
//   final _globalkey = GlobalKey<FormState>();
//   double _totalDistance=0;
//
//   var imagePicker=ImagePicker();
//
//   String? today;
//
//   File? _iamge;
//   Future getImage() async{
//     final iamge=await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 30);
//     setState(() {
//       _iamge=File(iamge!.path);
//     });
//   }
//
//   LocalDataGet _localDataGet = LocalDataGet();
//
//   getToken() async {
//     var tokenx = await _localDataGet.getData();
//     setState(() {
//       useId = tokenx.get('userId');
//       storeId = tokenx.get('storeId');
//       storeLan = tokenx.get('storelat');
//       storeLon = tokenx.get('storeLon');
//       role = tokenx.get('role');
//       businessUnit = tokenx.get('businessUnit');
//
//       //BlocProvider.of<ProductCubit>(context).getAllProducts();
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     getCureentLocation();
//     getCureentLocationName();
//     getToken();
//
//     DateTime now = DateTime.now();
//     formattedDate = now.hour.toString()+":"+now.minute.toString();
//     String formatdDate =DateFormat('MM-dd-yyyy').format(now);
//     print(formattedDate);
//     print("ooo:"+formatdDate);
//   }
//   void getCureentLocationName()async {
//     var possition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
//     setState(()  {
//       userAddress=placemarks[0].name.toString()+","+placemarks[0].street.toString()
//           +","+placemarks[0].locality.toString()+","+placemarks[0].postalCode.toString()
//           +","+placemarks[0].subLocality.toString()
//           +","+placemarks[0].subAdministrativeArea.toString();
//     });
//   }
//   void getCureentLocation()async{
//     var possition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//     var lastPosition=await Geolocator.getLastKnownPosition();
//     print(lastPosition);
//     print(possition.latitude);
//     print(possition.longitude);
//     if ((await Geolocator.isLocationServiceEnabled())) {
//       var distanceInMeters = await Geolocator.distanceBetween(double.parse(storeLan!),double.parse(storeLon!),possition.latitude,possition.longitude);// lat2 and long2 are global variables with current user's location
//       print("xxx "+distanceInMeters.toString());
//       setState(() {
//         _totalDistance+=distanceInMeters;
//       });
//     }else{
//       print("GPS is off.");
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content: const Text('Make sure your GPS is on in Settings !'),
//               actions: <Widget>[
//                 FlatButton(
//                     child: Text('OK'),
//                     onPressed: () {
//                       Navigator.of(context, rootNavigator: true).pop();
//                     })
//               ],
//             );
//           });
//     }
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<AttendenceCubit>(context).checkLateAttendance(formattedDate!);
//     return BlocListener<AttendenceCubit, AttendenceState>(
//       listener: (context, state) {
//         if(state is MarkDayoffAttendance){
//           showAlertDialogDone(context);
//         }
//       },
//       child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             title: const Text('Attendance ',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.black,
//               ),
//             ),
//             leading: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: IconButton(
//                 onPressed: (){
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.arrow_back,color: Colors.black,size: 27,),
//               ),
//             ),
//             toolbarHeight: 60,
//             elevation: 0.5,
//           ),
//           body:Stack(
//             children: [
//               _totalDistance==-1.0?Center(child: Text('your distance is negetive value:  '+ '$_totalDistance'),):
//               _totalDistance<600? BlocListener<AttendenceCubit, AttendenceState>(
//                 listener: (context, state) {
//                   if(state is MarkEveningAttendances){
//                     showAlertDialogDone(context);
//                   }
//                 },
//                 child: Material(
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 25),
//                     child: Column(
//                       children: [
//                         //AppBar//App bar
//                         //App Bar
//                         const SizedBox(height:3,),
//                         Flexible(
//                           flex:100,
//                           child: Material(
//                             color: Colors.white,
//                             borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
//                             child: Container(
//                               height: MediaQuery.of(context).size.height,
//                               child: SingleChildScrollView(
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
//                                   child: Form(
//                                     key: _globalkey,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         // SizedBox(height: 14,),
//                                         const SizedBox(height:30),
//                                         const Text("Please take a clear photo yourself",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Color(0xFF727272)),),
//                                         Container(
//                                           child: _iamge==null? Container():
//                                           Container(
//                                             height: 356,
//                                             width: MediaQuery.of(context).size.width,
//                                             child:Image.file(_iamge!,fit:BoxFit.cover,),
//                                           ),
//                                           //Image.file(_iamge!,height: 500,),
//                                         ),
//
//                                         const SizedBox(height: 16,),
//
//                                         Container(
//                                           width: MediaQuery.of(context).size.width,
//                                           padding: const EdgeInsets.only(bottom: 10),
//                                           child:circle? Container() : CustomButton(title: _iamge!=null?"Retake Photo":"Click Photo",onTap: (){
//                                             setState(() {
//                                               // circle=true;
//                                               imageprocess=true;
//                                             });
//                                             getImage();
//                                           },
//                                           ),
//                                         ),
//                                         _iamge!=null?circle? Center(child: CircularProgressIndicator(),) : CustomButton(title: widget.type=="morning"?"Give Morning Attendance":widget.type=="evening"?"Give evening Attendance":"Give Dayoff Attendance",onTap: (){
//                                           if(widget.type=="evening"){
//                                             if(_iamge==null){
//                                               showAlertDialog(context);
//                                             }else{
//                                               setState(() {
//                                                 circle=true;
//                                               });
//                                               BlocProvider.of<AttendenceCubit>(context).giveEveningAttendance(_iamge!,storeId!,businessUnit!,useId!);
//                                             }
//                                           }else if(widget.type=="dayoff"){
//                                             if(_iamge==null){
//                                               showAlertDialog(context);
//                                             }else{
//                                               setState(() {
//                                                 circle=true;
//                                               });
//                                               BlocProvider.of<AttendenceCubit>(context).giveDayoffAttendance(_iamge!,storeId!,businessUnit!,useId!,userAddress!);
//                                             }
//
//                                           }
//                                         },
//                                           //width: MediaQuery.of(context).size.width*0.7,color: widget.type=="evening"?Colors.blueGrey: widget.type=="dayoff"?Colors.redAccent:Colors.green,
//                                         ):Container()
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ):Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Center(child: Text('you are not in target shop'),),
//                       Text("You are not in you target shop !!",style: TextStyle(color: Colors.redAccent,fontSize: 18,fontWeight: FontWeight.bold),)
//                     ],
//                   )
//               ),
//
//             ],
//           )
//       ),
//     );
//   }
//
//
//
//
//   // This widget will be passed as Top Card's Widget.
//   Widget topCardWidget() {
//     return Align(
//       alignment: Alignment.center,
//       child: _iamge==null?const Center(child: Text('image is null'),):Image.file(_iamge!,height: 800,),
//     );
//   }
//
//   // This widget will be passed as Bottom Card's Widget.
//   Widget bottomCardWidget() {
//     return ShadowCarveButton(pressed: (){
//       if (_globalkey.currentState!.validate()) {
//         setState(() {
//           validate = true;
//           circular = true;
//         });
//         print(note.text);
//       }},
//     );
//   }
//
//   showAlertDialog(BuildContext context) {
//     // set up the button
//     Widget okButton = TextButton(
//       child: Text("OK"),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: const Text("Warning"),
//       content: const Text("Please Take Your Photo."),
//       actions: [
//         okButton,
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//
//   showAlertDialogDone(BuildContext context) {
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       content: Container(
//         height: 300,
//         width: MediaQuery.of(context).size.width*0.7,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30)
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset('assets/icons/check_grren.png'),
//             const Text("Done!",style: TextStyle(color: Color(0XFF000000),fontSize:30,fontWeight: FontWeight.w800 ),textAlign: TextAlign.center,),
//             const Text("You have successfully mark \n your day-off attendance.\n Have a good day.",style: TextStyle(color: Color(0XFF000000),fontSize:16,fontWeight: FontWeight.w400 ),textAlign: TextAlign.center,),
//             Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child:  InkWell(
//                   onTap: (){
//                     Navigator.pushReplacement(context, PageTransition(MainScreen()));
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.blueAccent
//                     ),
//                     child: const Text("Start your work",style: TextStyle(color: Color(0XFFffffff),fontSize:16 ),textAlign: TextAlign.center,),
//                   ),
//                 )
//             ),
//           ],
//         ),
//       ),
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
// }
