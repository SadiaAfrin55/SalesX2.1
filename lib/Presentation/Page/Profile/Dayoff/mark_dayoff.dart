//
// import 'dart:developer';
// import 'dart:io';
// import 'dart:math' as Math;
// import 'dart:typed_data';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:logger/logger.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:salesx_new_project/Bloc/Dayoff/dayoff_cubit.dart';
// import 'package:salesx_new_project/Presentation/Page/Training/training_page.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../../../Bloc/Attendence/attendence_cubit.dart';
// import '../../../../Service/LocalDataBase/localdata.dart';
// import '../../../Screens/SplashScreen/splash_screen.dart';
// import '../../../main_screen.dart';
//
//
// class MarkEveningAttendance extends StatefulWidget {
//   const MarkEveningAttendance({Key? key}) : super(key: key);
//
//   @override
//   _MarkEveningAttendanceState createState() => _MarkEveningAttendanceState();
// }
//
// class _MarkEveningAttendanceState extends State<MarkEveningAttendance> {
//
//   TextEditingController remarkController= TextEditingController();
//   TextEditingController note= TextEditingController();
//
//   final _globalkey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//
//     remarkController.dispose();
//     note.dispose();
//     _globalkey.currentState?.dispose();
//
//
//     super.dispose();
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//    final dayOffState =  context.watch<DayoffCubit>().state;
//    final image = dayOffState.file;
//
//
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             backgroundColor: Colors.white,
//             title: const Text('Dayoff Attendance',
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
//           body:Form(
//             key: _globalkey,
//             child: SingleChildScrollView(
//               child: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 25),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     if(image != null)
//                     Container(
//                       height: 356,
//                       width: MediaQuery.of(context).size.width,
//                       child:Image.file(image,fit:BoxFit.cover,),
//                     ),
//                     const SizedBox(height: 16,),
//
//                     if(image == null)
//
//                     TextButton(onPressed: () {
//
//                       context.read<DayoffCubit>().getImage();
//
//
//
//                     }, child: Text('Pick A Photo')),
//
//                     if(image != null)
//                       TextButton(onPressed: () {
//
//                         context.read<DayoffCubit>().markAsDayoffAttendance();
//
//                       }, child: Text('Mark ')),
//
//
//
//
//
//                     // Container(
//                     //   width: MediaQuery.of(context).size.width,
//                     //   child:_image==null?
//                     //   circle? Container():InkWell(
//                     //       onTap: (){
//                     //         setState(() {
//                     //           //circle=true;
//                     //           imageprocess=true;
//                     //           getImage();
//                     //         });
//                     //         //getImage();
//                     //       },
//                     //       child: Container(
//                     //         height: 54,
//                     //         width: MediaQuery.of(context).size.width,
//                     //         decoration: BoxDecoration(
//                     //           color:_image!=null?Color(0x88BFDCFC): Color(0xFF0180F5),
//                     //           borderRadius: BorderRadius.circular(6),
//                     //         ),
//                     //         child: Center(
//                     //           child:RichText(
//                     //             text:  TextSpan(
//                     //                 children: [
//                     //                   WidgetSpan(
//                     //                     child: Container(
//                     //                         margin: EdgeInsets.only(right: 10),
//                     //                         child: Icon(Icons.camera_enhance_sharp, size: 20,color:_image!=null?Color(0xFF0180F5):Colors.white)),
//                     //                   ),
//                     //                   TextSpan(
//                     //                       text: _image!=null?tr('Retake Photo'):tr("Take a photo"),
//                     //                       //text: tr("Take a photo"),
//                     //                       style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: _image!=null?Color(0xFF0180F5):Colors.white)
//                     //                   ),
//                     //                 ]
//                     //             ),
//                     //           ),
//                     //
//                     //         ),
//                     //       )
//                     //   ):Container(),
//                     // ),
//                     //
//                     //
//                     // BlocBuilder<DayoffCubit, DayoffState>(builder: (context, state) {
//                     //
//                     //   log('mh444 $state');
//                     //
//                     //
//                     //   final image = state.file;
//                     //   if (image!=null) {
//                     //     return GestureDetector(child:
//                     //     Container(
//                     //       height: 54,
//                     //       width: MediaQuery.of(context).size.width,
//                     //       decoration: BoxDecoration(
//                     //           color: const Color(0xff0180F5),
//                     //           borderRadius: BorderRadius.circular(6)
//                     //       ),
//                     //       child:
//                     //           Text("Mark your attendance",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),).tr(),
//                     //
//                     //     ));
//                     //   }
//                     //
//                     //
//                     //
//                     //
//                     //   return SizedBox.shrink();
//                     //
//                     //
//                     //
//                     // }),
//                     //
//                     //
//                     //
//                     //
//                     //
//                     // const SizedBox(height: 8,),
//                     // addrerss==null?Container(child: Center(child: Text('address null'),),):_image==null?Container(child: Center(child: Text('image null'),),): circle?Center(child: CircularProgressIndicator(),):InkWell(
//                     //     onTap: (){
//                     //         if (_globalkey.currentState!.validate()) {
//                     //           setState(() {
//                     //             circle=true;
//                     //           });
//                     //           BlocProvider.of<DayoffCubit>(context).markAsDayoffAttendance(_image!);
//                     //
//                     //
//                     //
//                     //
//                     //         }
//                     //       else{
//                     //         setState(() {
//                     //           circle=true;
//                     //         });
//                     //         // BlocProvider.of<AttendenceCubit>(context).giveMorningLateAttendance(_image!,storeId!,businessUnit!,useId!,role!,remarkController.text,addrerss!);
//                     //       }
//                     //
//                     //     },
//                     //
//                     //     child: Container(
//                     //       height: 54,
//                     //       width: MediaQuery.of(context).size.width,
//                     //       decoration: BoxDecoration(
//                     //           color: const Color(0xff0180F5),
//                     //           borderRadius: BorderRadius.circular(6)
//                     //       ),
//                     //       child:  Row(
//                     //         mainAxisAlignment: MainAxisAlignment.center,
//                     //         children: [
//                     //           Text("Mark your attendance",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),).tr(),
//                     //         ],
//                     //       ),
//                     //     )
//                     // ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
