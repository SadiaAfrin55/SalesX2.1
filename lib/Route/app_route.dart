import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesx_new_project/Bloc/Attendence/VmAttendence/vm_attendence_cubit.dart';
import 'package:salesx_new_project/Bloc/Leave/leave_cubit.dart';
import 'package:salesx_new_project/Presentation/Page/Visit/Bloc/visit_cubit.dart';
import '../Bloc/Attendence/attendence_cubit.dart';
import '../Bloc/Inventory/inventory_cubit.dart';
import '../Bloc/List/list_cubit.dart';
import '../Bloc/Login/login_cubit.dart';
import '../Bloc/Product/product_cubit.dart';
import '../Bloc/Sales/sales_cubit.dart';
import '../Bloc/Survey/survey_cubit.dart';
import '../Bloc/User/user_cubit.dart';
import '../Constants/Strings/app_strings.dart';
import '../Presentation/Page/AdminContact/admin_contact.dart';
import '../Presentation/Page/Attendence/AttendenceDone/back_home.dart';
import '../Presentation/Page/Attendence/FoeAttendance/foe_picture_attendance.dart';
import '../Presentation/Page/Attendence/attendence_history.dart';
import '../Presentation/Page/Attendence/attendence_page.dart';
import '../Presentation/Page/CommingSoon/comming_soon.dart';
import '../Presentation/Page/Dayoff/mark_dayoff_attendance.dart';
import '../Presentation/Page/FOE/Sec/LeaveRequest/approved_request.dart';
import '../Presentation/Page/FOE/Sec/SecTrainingComponents/sec_training_components.dart';
import '../Presentation/Page/FOE/Sec/sec_sales_details.dart';
import '../Presentation/Page/FOE/Sec/sec_survey_history_details.dart';
import '../Presentation/Page/FOE/Sec/sec_training_history.dart';
import '../Presentation/Page/FOE/Sec/seclist_details.dart';
import '../Presentation/Page/FOM/FOE/foe_attendence_history.dart';
import '../Presentation/Page/FOM/FOE/foe_leave.dart';
import '../Presentation/Page/FOM/FOE/foe_target.dart';
import '../Presentation/Page/FOM/FoeList/fom_foe_list.dart';
import '../Presentation/Page/FOM/FomHome/fom_home_page.dart';
import '../Presentation/Page/FOM/FomProfile/fom_profile_page.dart';
import '../Presentation/Page/Feedback/feedback_page.dart';
import '../Presentation/Page/Foe/Attendence/foe_attendence_page.dart';
import '../Presentation/Page/Foe/Sec/sec_attendence_history.dart';
import '../Presentation/Page/Foe/Sec/sec_inventory.dart';
import '../Presentation/Page/Foe/Sec/sec_inventory_history.dart';
import '../Presentation/Page/Foe/Sec/sec_leave.dart';
import '../Presentation/Page/Foe/Sec/sec_leave_history.dart';
import '../Presentation/Page/Foe/Sec/sec_leave_request.dart';
import '../Presentation/Page/Foe/Sec/sec_list.dart';
import '../Presentation/Page/Foe/Sec/sec_sales_history.dart';
import '../Presentation/Page/Foe/Sec/sec_survey_history.dart';
import '../Presentation/Page/Foe/Sec/sec_target.dart';
import '../Presentation/Page/Foe/Sec/sec_target_history.dart';
import '../Presentation/Page/Foe/foe_homePage.dart';
import '../Presentation/Page/Foe/foe_profilePage.dart';
import '../Presentation/Page/Foe/secActivity/sec_activity_page.dart';
import '../Presentation/Page/Inventory/inventory_list.dart';
import '../Presentation/Page/Inventory/inventory_page.dart';
import '../Presentation/Page/Invoice/InvoiceScreen.dart';
import '../Presentation/Page/Leave/leave_history.dart';
import '../Presentation/Page/Leave/leave_page.dart';
import '../Presentation/Page/Login/login_page.dart';
import '../Presentation/Page/Notification/notification_page.dart';
import '../Presentation/Page/OM/FOM/Activity/FOMactivity/fom_attendence.dart';
import '../Presentation/Page/OM/FOM/Activity/FOMactivity/fom_leave.dart';
import '../Presentation/Page/OM/FOM/Activity/FOMactivity/fom_target.dart';
import '../Presentation/Page/OM/FOM/Activity/FoeActivity/fom_foe_activity.dart';
import '../Presentation/Page/OM/FOM/Activity/fom_activity.dart';
import '../Presentation/Page/OM/FoeActivity/om_foe_activity.dart';
import '../Presentation/Page/OM/OmDayoff/om_dayoff.dart';
import '../Presentation/Page/Profile/Dayoff/mark_dayoff.dart';
import '../Presentation/Page/Profile/profile_page.dart';
import '../Presentation/Page/SM/OM/om_attendance.dart';
import '../Presentation/Page/SM/OM/om_leave.dart';
import '../Presentation/Page/SM/OM/om_target.dart';
import '../Presentation/Page/SM/SmActivity/sm_activity.dart';
import '../Presentation/Page/Sales/Chart/sales_chart.dart';
// import '../Presentation/Page/Sales/sales_chart.dart';
import '../Presentation/Page/Sales/Search/search_home_page.dart';
import '../Presentation/Page/Sales/sales_create.dart';
import '../Presentation/Page/Sales/sales_details.dart';
import '../Presentation/Page/Sales/sales_history.dart';
import '../Presentation/Page/Sales/sales_noData.dart';
import '../Presentation/Page/StoreLatLon/update_lat_lon.dart';
import '../Presentation/Page/Survey/SurveyChart/SurveyTest/surveyModel.dart';
import '../Presentation/Page/Survey/SurveyChart/survey_chart.dart';
import '../Presentation/Page/Survey/survey_details.dart';
import '../Presentation/Page/Survey/survey_details_info.dart';
import '../Presentation/Page/Survey/survey_history.dart';
import '../Presentation/Page/Survey/survey_noData.dart';
import '../Presentation/Page/Survey/survey_page.dart';
import '../Presentation/Page/OM/FOM/Activity/fom_activity.dart';
import '../Presentation/Page/OM/FOM/Activity/FoeActivity/fom_foe_activity.dart';

//import '../Presentation/Page/Target/target_page.dart';
import '../Presentation/Page/Target/target_page.dart';
import '../Presentation/Page/Training/training_page.dart';
import '../Presentation/Page/Visit/create_visit.dart';
import '../Presentation/Page/Visit/select_shop.dart';
import '../Presentation/Page/Visit/visit_history.dart';
import '../Presentation/Screens/ForgetPass/forget_password_page.dart';
import '../Presentation/Screens/SplashScreen/splash_screen.dart';
import '../Presentation/main_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final Map? arguments=settings.arguments as Map?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN_PAGE:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<UserCubit>(
                  create: (context) => UserCubit(),
                ),
                BlocProvider<LoginCubit>(
                  create: (context) => LoginCubit(),
                ),
              ],
              child: LoginPage(),

            ));
      case FORGET_PASSWORD_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: ForgetPassword(),
            ));
      case CONTACT_ADMIN_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: ContactAdmin(),
            ));
      case NOTIFICATION_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: NotificationPage(),
            ));
      case SALES_CREATE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ProductCubit(),
              child: SalesCreate(),
            ));
      case INVOICE_PAGE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => SalesCubit(),
              // Profile(userAddress: arguments['userAddress'],));
              child: InvoicePage(
                customerName: arguments!['customerName'],
                customerphone: arguments['customerPhone'],
                customerEmail: arguments['customerEmail'],
                customerAge: arguments['age'],
                model: arguments['model'],
                productName: arguments['productName'],
                quantity: arguments['quantity'],
                color: arguments['color'],
                price: arguments['price'],
                remark: arguments['remarks'],
              ),
            ));
    case SALES_DETAILS:
      return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => SalesCubit(),
            child: SalesDetails(
                productname:arguments!['productname'],
                price:arguments['price'],
                customername:arguments['customername'],
                mobile:arguments['mobile'],
                age:arguments['age'],
                email:arguments['email'],
                remark:arguments['remark'],
                qunty:arguments['qunty'],
            ),
          ));
      case SALES_HISTORY:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SalesCubit(),
              child: SalesHistory(),
            ));


      case SALES_SEARCH_HOME_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SalesCubit(),
              child: SalesSearchHomePage(),
            ));
      case SALES_SEARCH:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SalesCubit(),
              child: SalesHistory(),
            ));
      case FOE_HOME_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SalesCubit(),
              child: FoeHomePage(),
            ));
      case FOE_PROFILE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SalesCubit(),
              child: FoeProfilePage(),
            ));

      case SEC_ACTIVITY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SalesCubit(),
              child: FoeActivity(),
            ));

    case SALES_NODATA:
      return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => SalesCubit(),
            child: SalesNoDataPage(),
          ));

    case SALES_CHART:
      return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => SalesCubit(),
            child: SalesChart(),
          ));

      case HOME_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: MainScreen(),
            ));
      case PROFILE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: ProfilePage(),
            ));

      case ATTENDANCE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => AttendenceCubit(),
              child: AttendencePage(),
            ));

    case ATTENDANCE_HISTORY:
      return MaterialPageRoute(
          builder: (BuildContext context) => BlocProvider(
            create: (context) => AttendenceCubit(),
            child: AttendenceHistory(),
          ));

      case LEAVE_HISTORY:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: LeaveHistory(),
            ));
      case LEAVE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: ApplyLeave(),
            ));
      case SURVEY_HISTORY:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SurveyCubit(),
              child: SurveyHistory(),
            ));
      case SURVEY_DETAILS:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SurveyCubit(),
              child: SurveyDetails(
                name:arguments!['name'],
                mobile:arguments['mobile'],
                age:arguments['age'],
                email:arguments['email'],
                interestIn:arguments['interestIn'],
                minbudget:arguments['minbudget'],
                maxbudget:arguments['maxbudget'],
                currentContact:arguments['currentContact'],
              ),
            ));
      case SURVEY_NODATA:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SurveyCubit(),
              child: SurveyNoDataPage(),
            ));
      case SURVEY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SurveyCubit(),
              child: SurveyPage(),
            ));
      case SURVEY_CHART:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SurveyCubit(),
              child: SurveyChart(),
            ));
      case SURVEY_CHART:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => SurveyCubit(),
              child: SurveyTest(),
            ));

      case INVENTORY_HISTORY:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: InventoryList(),
            ));
      case INVENTORY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: InventoryPage(),
            ));
      case TRAINING_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => AttendenceCubit(),
              child: TrainingPage(),
            ));
      case TARGET_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => AttendenceCubit(),
              child: TargetPage(),
            ));
      case FEEDBACK_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FeedbackPage(),
            ));


        //Foe
      case SEC_ATTENDENCE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecAttendenceSurvey(),
            ));

      case SEC_TRAINING_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ListCubit(),
              child: SecTrainingHistory(),
            ));

      case SEC_SALES_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecSalesHistory(),
            ));
      case SEC_SALES_DETAILS_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ListCubit(),
              child: SecDetailsInfo(
                name:arguments!['name'],
                mobile:arguments['mobile'],
                age:arguments['age'],
                email:arguments['email'],
                remark:arguments['remark'],
                takenname:arguments['takenname'],
                date:arguments['date'],
                productname:arguments['productname'],
                productprice:arguments['productprice'],
              ),
            ));
      case SEC_SURVEY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecSurveyHistory(),
            ));

      case SEC_SURVEY_DETAILS_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ListCubit(),
              child: SecSurveyDetails(
                name:arguments!['name'],
                phone:arguments['phone'],
                age:arguments['age'],
                email:arguments['email'],
                interestedin:arguments['interestedin'],
                minbud:arguments['minbud'],
                maxbud:arguments['maxbud'],
                date:arguments['date'],
              ),
            ));

      case SEC_TARGET_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecTarget(),
            ));
      case SEC_TARGET_HISTORY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ListCubit(),
              child: SecTargetHistory(
                cusname:arguments!['cusname'],
                sale:arguments['sale'],
                target:arguments['target'],
                targetAchive:arguments['targetAchive'],
              ),
            ));
      case SEC_INVENTORY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecInventory(),
            ));
      case SEC_INVENTORY_HISTORY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecInventoryHistory(
                userid:arguments!['userid'],
              ),
            ));
      case SEC_LEAVE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecLeave(),
            ));
      case SEC_LEAVE_HISTORY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SecLeaveHistory(name:arguments!['name'],),
            ));
      case SEC_LEAVE_REQUEST_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => LeaveCubit(),
              child: SecLeaveRequest(),
            ));
        case SEC_LIST_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ListCubit(),
              child: SecListPage(),
            ));

      case SEC_LIST_DETAILES_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => ListCubit(),
              child: SeclistDetails(
                name:arguments!['name'],
                personalemail:arguments['personalemail'],
                officeemail:arguments['officeemail'],
                phone:arguments['phone'],
                area:arguments['area'],
                teritory:arguments['teritory'],
                rigion:arguments['rigion'],
              ),
            ));

      case VISIT_SHOP_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SelectShop(),
            ));

      case VISIT_CREATE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: CreateShop(
                shopId:arguments!['shopId'],
              ),
            ));

      case FOE_ATTENDANCE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FoePictureAttendencePage(
                shopId:arguments!['shopId'],
              ),
            ));

      case VISIT_HISTORY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => VisitCubit(),
              child: VisitHistory(),
            ));

        //om

      case OM_DAYOFF:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => VmAttendenceCubit(),
              child: OmDayoff(),
            ));

      case FOM_ACTIVITY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: OMActivity(),
            ));

      case FOM_FOE_ACTIVITY_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: OmFoeActivityPage(),
            ));
      case OM_FOM_ATTENDANCE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FomAttendenceSurvey(),
            ));
      case OM_FOM_TARGET:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FomTarget(),
            ));
      case OM_FOM_LEAVE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FomLeave(),
            ));
      case OM_FOM_TRAINING:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: OmFoeActivityPage(),
            ));

    //fom
      case FOM_HOME_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FOMHomePage(),
            ));

      case FOM_PROFILE_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FOMProfilePage(),
            ));
      case FOM_FOE_LIST:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FomFoeListPage(),
            ));
      case FOM_FOE_ATTENDANCE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FoeAttendenceSurvey(),
            ));
      case FOM_FOE_TARGET:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FoeTarget(),
            ));
      case FOM_FOE_LEAVE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FoeLeave(),
            ));
      case FOM_FOE_TRAINING:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: FomFoeListPage(),
            ));

        //sm
      case SM_ACTIVITY:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SmOmActivity(),
            ));
      case SM_FOM_ATTENDANCE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: OmAttendenceSurvey(),
            ));
      case SM_FOM_TARGET:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: OmTarget(),
            ));
      case SM_FOM_LEAVE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: OmLeave(),
            ));
      case SM_FOM_TRAINING:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
              child: SmOmActivity(),
            ));



      case STORE_UPDATE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => InventoryCubit(),
               child: StoreLanLotUpdate(),   //storeId:arguments!['storeId']
            ));

      case MARK_DAYOFF:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => AttendenceCubit(),
              child: MarkEveningAttendance(),
            ));

      case BACK_TO_HOME:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => AttendenceCubit(),
              child: BackToHome(),
            ));

      case COMMINGSOON:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => AttendenceCubit(),
              child: CommingSoon(),
            ));
      case ApproveLeaverequest_Page:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => AttendenceCubit(),
              child: ApprovedRequest(
                id:arguments!['id'],
                name:arguments['name'],
                reason:arguments['reason'],
                requestPendingFrom:arguments['requestPendingFrom'],
                type:arguments['type'],
                days:arguments['days'],
                from:arguments['from'],
                to:arguments['to'],
                approve:arguments['approve'],
              ),
            ));


      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => UserCubit(),
              child: SplashScreen(),
            ));
    }
  }
}