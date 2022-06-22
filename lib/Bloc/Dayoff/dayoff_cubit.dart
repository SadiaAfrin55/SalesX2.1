// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:bloc/bloc.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:logger/logger.dart';
// import 'package:meta/meta.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:salesx_new_project/Service/LocalDataBase/localdata.dart';
//
// import '../../Repository/Attendence/attendence_repository.dart';
// import '../Attendence/attendence_cubit.dart';
//
// part 'dayoff_state.dart';
//
// class DayoffCubit extends Cubit<DayoffState> {
//   DayoffCubit() : super(DayoffState());
//
//   final picker = ImagePicker();
//   var logger = Logger();
//
//   final localRepo = LocalDataGet();
//   Future getImage() async{
//     final image=await picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//     emit(state.copyWith(file: File(image.path)));
//
//     }
//
//
//   }
//
//
//   Future<void> markAsDayoffAttendance() async {
//
//     if (state.file == null) {
//       return emit(DayoffState(error: "Image can't be empty"));
//     }
//
//
//
//     final result =await localRepo.getData();
//     // final storeId = result['storeId'];
//     // final businessUnit = result['businessUnit'];
//     // final useId = result['userId'];
//
//     final placemarks= await getCureentLocationName();
//
//
//
//
//     if(placemarks.isNotEmpty) {
//       AttendanceRepository().giveDayoffAttendance(state.file!,'656','bUnit','442',placemarks.first.toString()).then((data) => {
//         logger.d(data['success']),
//         if(data['success']){
//           emit(DayoffState(attendance: data['success']))
//         }
//       });
//     }
//
//
//
//
//
//
//
//   }
//
//   void chekUserDayoffAttendance(String userId) {
//     AttendanceRepository().chekUserDayoffAttendance(userId).then((value) => {
//       // logger.d(value['attendance']),
//       if(value!=null){
//         emit(DayoffState(attendance: value['attendance']))
//       }
//     });
//   }
// }
//
// String checkDate() {
//   final DateTime now = DateTime.now();
//   final DateFormat formatter = DateFormat('MM-yyyy');
//   final DateFormat formate = DateFormat('yyyy-MM-dd');
//   final String formatted = formatter.format(now);
//   final String dateIn=formate.format(now);
//
//   return dateIn;
// }
//
//
//
// Future<List<Placemark>> getCureentLocationName()async {
//   // Test if location services are enabled.
//   var serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
//   var permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       print("'Location Permission Denied'");
//       return Future.error('Location permissions are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }
//
//
//   var possition = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//   //location name
//   List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
//   // setState(()  {
//   //   lat=possition.latitude.toString();
//   //   lon=possition.longitude.toString();
//   //   addrerss=placemarks[0].name.toString()+","+placemarks[0].street.toString()
//   //       +","+placemarks[0].locality.toString()+","+placemarks[0].postalCode.toString()
//   //       +","+placemarks[0].subLocality.toString()
//   //       +","+placemarks[0].subAdministrativeArea.toString();
//   // });
//
//   return placemarks;
// }
//
// Future<Uint8List?> testCompressFile(File file) async {
//   final result = await FlutterImageCompress.compressWithFile(
//     file.absolute.path,
//     quality: 40,
//     rotate: 360,
//   );
//
//   Uint8List? imageInUnit8List = result;// store unit8List image here ;
//   final tempDir = await getTemporaryDirectory();
//   File filex = await File('${tempDir.path}/image.png').create();
//   filex.writeAsBytesSync(imageInUnit8List!);
//
//   return result;
// }
