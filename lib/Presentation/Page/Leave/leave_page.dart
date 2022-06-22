import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../Bloc/Leave/leave_cubit.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/CustomButoon/custom_button.dart';
import '../../Widgets/TextFields/filledTextField.dart';
import '../../main_screen.dart';

class ApplyLeave extends StatefulWidget {
  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String? leaveDate;
  List<String> _reason = ['sick','casual','half day']; // Option 2
  String? _selectedReason; // Option 2
  TextEditingController reason= TextEditingController();

  bool validate = false;
  bool circular = false;
  final _globalkey = GlobalKey<FormState>();
  String? linmanagerid;
  String? userId;
  String? role;
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      linmanagerid = tokenx.get('linemanagerid');
      role = tokenx.get('role');
      BlocProvider.of<LeaveCubit>(context).getLeaveTotal(userId!);
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener<LeaveCubit, LeaveState>(
        listener: (context, state) {
          if(state is LeaveCreate){
            // ignore: unnecessary_statements
            final leave=(state as LeaveCreate).response;
            Logger().d(leave);
            setState(() {
              circular = false;
            });
            //Navigator.pushReplacementNamed(context, MY_LEAVE_PAGE);
            Navigator.pushReplacement(context, PageTransition(MainScreen()));
          }
        },
        child: role=="FOE"?Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Leave',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,color: Colors.black,size: 27,),
                ),
              ),
              toolbarHeight: 60,
              elevation: 0.5,
            ),
            body:Stack(
              children: [
                Material(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 21),
                    child: Column(
                      children: [
                        Flexible(
                          flex:100,
                          child: Material(
                            color: Colors.white,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: RefreshIndicator(
                                key: refreshKey,
                                onRefresh:refreshList ,
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: _globalkey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height*0.7,

                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('Select leave type',style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:Color(0xFF232C2E)
                                              ),),
                                              const SizedBox(height: 8,),
                                              Container(
                                                height: 45,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: const Color(0xFFF5F7F8),
                                                ),
                                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    hint: const Text('Select Reason',style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFF8E9191),
                                                    ),), // Not necessary for Option 1
                                                    value: _selectedReason,
                                                    icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xFF8E9191)),
                                                    iconSize: 25,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedReason = newValue as String?;
                                                      });
                                                    },
                                                    items: _reason.map((location) {
                                                      return DropdownMenuItem(
                                                        child: Text(location),
                                                        value: location,
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20,),
                                              const Text('Select Date',style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:Color(0xFF232C2E)
                                              ),),
                                              const SizedBox(height: 8,),
                                              InkWell(
                                                onTap: (){
                                                  showdialog();
                                                },
                                                child: Container(
                                                  height: 45,
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Color(0xFFF5F7F8),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(leaveDate??"Select date",style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xFF8E9191),
                                                      ),),
                                                      SvgPicture.asset('assets/icons/Calendar.svg',
                                                        color: Color(0xFF232C2E),),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20,),
                                              const Text('Type reason',style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:Color(0xFF232C2E)
                                              ),),
                                              const SizedBox(height: 8,),

                                              FilledTextField(controller: reason,hintText: "Type reason",readOnly: false,),
                                              const SizedBox(height: 40,),
                                            ],
                                          ),
                                        ),
                                        circular? const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Center(child: CircularProgressIndicator())) :CustomButton(
                                          title: 'Submit',
                                          onTap: (){
                                            if (_globalkey.currentState!.validate()) {
                                              setState(() {
                                                validate = true;
                                                circular = true;
                                              });
                                              print(reason.text);
                                              print(_selectedReason);
                                              print(userId);
                                              print(linmanagerid);
                                              print(leaveDate);
                                              BlocProvider.of<LeaveCubit>(context).createLeave(
                                                  leaveDate!,
                                                  reason.text,
                                                  _selectedReason!,
                                                  userId!,
                                                  linmanagerid!,
                                                  "pending",
                                                  "token");
                                            }},
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
                )
              ],
            )
        ):Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Leave',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,color: Colors.black,size: 27,),
                ),
              ),
              toolbarHeight: 60,
              elevation: 0.5,
            ),
            body:Stack(
              children: [
                Material(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 21),
                    child: Column(
                      children: [
                        Flexible(
                          flex:100,
                          child: Material(
                            color: Colors.white,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: RefreshIndicator(
                                key: refreshKey,
                                onRefresh:refreshList ,
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: _globalkey,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height*0.7,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('Select leave type',style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:Color(0xFF232C2E)
                                              ),),
                                              const SizedBox(height: 8,),
                                              Container(
                                                height: 45,
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: const Color(0xFFF5F7F8),
                                                ),
                                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    hint: const Text('Select Reason',style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFF8E9191),
                                                    ),), // Not necessary for Option 1
                                                    value: _selectedReason,
                                                    icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xFF8E9191)),
                                                    iconSize: 25,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        _selectedReason = newValue as String?;
                                                      });
                                                    },
                                                    items: _reason.map((location) {
                                                      return DropdownMenuItem(
                                                        child: Text(location),
                                                        value: location,
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20,),
                                              const Text('Select Date',style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:Color(0xFF232C2E)
                                              ),),
                                              const SizedBox(height: 8,),
                                              InkWell(
                                                onTap: (){
                                                  showdialog();
                                                },
                                                child: Container(
                                                  height: 45,
                                                  width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Color(0xFFF5F7F8),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(leaveDate??"Select date",style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xFF8E9191),
                                                      ),),
                                                      SvgPicture.asset('assets/icons/Calendar.svg',
                                                        color: Color(0xFF232C2E),),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20,),
                                              const Text('Type reason',style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color:Color(0xFF232C2E)
                                              ),),
                                              const SizedBox(height: 8,),

                                              FilledTextField(controller: reason,hintText: "Type reason",readOnly: false,),
                                              const SizedBox(height: 40,),
                                            ],
                                          ),
                                        ),
                                        circular? const Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Center(child: CircularProgressIndicator())) :CustomButton(
                                          title: 'Submit',
                                          onTap: (){
                                            if (_globalkey.currentState!.validate()) {
                                              setState(() {
                                                validate = true;
                                                circular = true;
                                              });
                                              print(reason.text);
                                              print(_selectedReason);
                                              print(userId);
                                              print(linmanagerid);
                                              print(leaveDate);
                                              BlocProvider.of<LeaveCubit>(context).createLeave(
                                                  leaveDate!,
                                                  reason.text,
                                                  _selectedReason!,
                                                  userId!,
                                                  linmanagerid!,
                                                  "pending",
                                                  "token");
                                            }},
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
                )
              ],
            )
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final DateTime rangeStartDate = args.value.startDate;
      final DateTime rangeEndDate = args.value.endDate;
      setState(() {
        leaveDate=rangeStartDate.day.toString()+"/"+rangeStartDate.month.toString()+"/"+rangeStartDate.year.toString()+" To "+rangeEndDate.day.toString()+"/"+rangeEndDate.month.toString()+"/"+rangeStartDate.year.toString();
      });
      // print(rangeStartDate.toString()+" "+rangeEndDate.toString());
      print(leaveDate);
    } else {
      final List<PickerDateRange> selectedRanges = args.value;
    }
  }

  Future<Null>refreshList() async{
    refreshKey.currentState?.show(atTop: false);
    setState(() {

    });
    return null;
  }

  void showdialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text('Select Date'),
            content: Container(
              height: 300,
              width: 400,
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
                showNavigationArrow: true,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                toggleDaySelection: true,
                // selectionMode: DateRangePickerSelectionMode.range,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: _onSelectionChanged,

              ),
            )
        )
    );
  }

  void showReasonDialog() {


  }
}
