import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../Bloc/Survey/survey_cubit.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/CustomButoon/custom_button.dart';
import '../../Widgets/TextFields/email_textfield.dart';
import '../../Widgets/TextFields/filledTextField.dart';
import '../../Widgets/TextFields/number_textfield.dart';
import '../../Widgets/TextFields/phonenumber_textfield.dart';
import '../../main_screen.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {

  String? userId;
  String? token;

  TextEditingController name =  TextEditingController();
  TextEditingController contactNumber =  TextEditingController();
  TextEditingController age =  TextEditingController();
  TextEditingController email =  TextEditingController();
  TextEditingController interestedIn =  TextEditingController();
  TextEditingController minimubBudg =  TextEditingController();
  TextEditingController maximumBudg =  TextEditingController();
  TextEditingController currentPhone =  TextEditingController();

  bool validate = false;
  bool circul = false;
  final _globalkey = GlobalKey<FormState>();

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('MM-yyyy');
  static final DateFormat formate = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  final String dateIn=formate.format(now);

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      token = tokenx.get('token');
      userId = tokenx.get('userId');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SurveyCubit, SurveyState>(
      listener: (context, state) {
        if(state is SurveyCreate){
          setState(() {
            circul=false;
            Navigator.pushReplacement(context, PageTransition(MainScreen()));
          });
        }
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Survey',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back, color: Colors.black, size: 27,),
                ),
              ),
              toolbarHeight: 60,
              elevation: 0.5,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: _globalkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Name', style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF232C2E)

                          ),),
                          const SizedBox(height: 8,),
                          FilledTextField(
                            hintText: 'Type name',
                            readOnly: false,
                            controller: name,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Contact number', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF232C2E)

                                ),),
                                const SizedBox(height: 8,),
                                PhonenumberTextField(
                                  hintText: 'Type contact number',
                                  readOnly: false,
                                  controller: contactNumber,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 17,),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Age', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF232C2E)

                                ),),
                                const SizedBox(height: 8,),
                                NumberTextField(
                                  hintText: 'Type age',
                                  readOnly: false,
                                  controller: age,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email', style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF232C2E)

                          ),),
                          const SizedBox(height: 8,),
                          emailTextField(
                            hintText: 'Type email',
                            readOnly: false,
                            controller: email,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Interested In', style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF232C2E)

                          ),),
                          const SizedBox(height: 8,),
                          FilledTextField(
                            hintText: 'Interested in',
                            readOnly: false,
                            controller: interestedIn,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Minimum Budget', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF232C2E)

                                ),),
                                const SizedBox(height: 8,),
                                NumberTextField(
                                  hintText: 'Type budget',
                                  readOnly: false,
                                  controller: minimubBudg,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 17,),
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Maximum Budget', style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF232C2E)

                                ),),
                                const SizedBox(height: 8,),
                                NumberTextField(
                                  hintText: 'Type budget',
                                  readOnly: false,
                                  controller: maximumBudg,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Current Used Phone', style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF232C2E)

                          ),),
                          const SizedBox(height: 8,),
                          PhonenumberTextField(
                            hintText: 'Current phone',
                            readOnly: false,
                            controller: currentPhone,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      circul?Center(child: CircularProgressIndicator(),):
                      CustomButton(title: 'Submit',
                        onTap: (){
                          if (_globalkey.currentState!.validate()) {
                            setState(() {
                              validate = true;
                              circul=true;
                              print(userId!);
                              BlocProvider.of<SurveyCubit>(context).createSurvey(
                                  name.text,
                                  userId!,
                                  formatted,
                                  dateIn,
                                  interestedIn.text,
                                  contactNumber.text,
                                  age.text,
                                  email.text,
                                  minimubBudg.text,
                                  currentPhone.text,
                                  maximumBudg.text,
                                  );
                            });
                          }
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}