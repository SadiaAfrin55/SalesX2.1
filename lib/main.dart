import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:salesx_new_project/Bloc/Attendence/VmAttendence/vm_attendence_cubit.dart';
import 'package:salesx_new_project/Bloc/DayoffAttendance/dayoff_attendance_cubit.dart';
import 'package:salesx_new_project/Bloc/List/list_cubit.dart';
import 'package:salesx_new_project/Bloc/Notification/notification_cubit.dart';
import 'package:salesx_new_project/Bloc/Store/store_cubit.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Bloc/visit_cubit.dart';
import 'Bloc/Attendence/FoeAttendence/foe_attendence_cubit.dart';
import 'Bloc/Attendence/attendence_cubit.dart';
import 'Bloc/Dayoff/dayoff_cubit.dart';
import 'Bloc/Inventory/inventory_cubit.dart';
import 'Bloc/Leave/leave_cubit.dart';
import 'Bloc/Product/product_cubit.dart';
import 'Bloc/Sales/sales_cubit.dart';
import 'Bloc/Survey/survey_cubit.dart';
import 'Bloc/Target/target_cubit.dart';
import 'Bloc/User/user_cubit.dart';
import 'Constants/Colors/app_colors.dart';
import 'Route/app_route.dart';
void main() async{
  HttpOverrides.global =  MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('users');
  runApp( MyApp(router: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter router;
  const MyApp({Key? key,  required this.router}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
        BlocProvider<SurveyCubit>(
          create: (context) => SurveyCubit(),
        ),
        BlocProvider<AttendenceCubit>(
          create: (context) => AttendenceCubit(),
        ),
        BlocProvider<FoeAttendenceCubit>(
          create: (context) => FoeAttendenceCubit(),
        ),
        BlocProvider<InventoryCubit>(
          create: (context) => InventoryCubit(),
        ),
        BlocProvider<ProductCubit>(
          create: (context) => ProductCubit(),
        ),
        BlocProvider<SalesCubit>(
          create: (context) => SalesCubit(),
        ),
        BlocProvider<LeaveCubit>(
          create: (context) => LeaveCubit(),
        ),
        BlocProvider<TargetCubit>(
          create: (context) => TargetCubit(),
        ),
        BlocProvider<StoreCubit>(
          create: (context) => StoreCubit(),
        ),
        BlocProvider<DayoffAttendanceCubit>(
          create: (context) => DayoffAttendanceCubit(),
        ),
        BlocProvider<NotificationCubit>(
          create: (context) => NotificationCubit(),
        ),
        BlocProvider<VmAttendenceCubit>(
          create: (context) => VmAttendenceCubit(),
        ),
        BlocProvider<ListCubit>(
          create: (context) => ListCubit(),
        ),
        BlocProvider<VisitCubit>(
          create: (context) => VisitCubit(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SalesX',
        theme: ThemeData(
          // primarySwatch:Colors.blue,
          fontFamily: 'Manrope',
            primaryColor: kPrimaryColorx
        ),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {

    return super.createHttpClient(context) ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}