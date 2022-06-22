import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../Bloc/Login/login_cubit.dart';
import '../../../Bloc/User/user_cubit.dart';
import '../../../Constants/Colors/app_colors.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LoginService/save_user_data_local.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/ProgressAnimtaionButton/progress_button.dart';
import '../../Widgets/TextFields/normal_textdield.dart';
import '../../Widgets/TextFields/password_textdield.dart';
import '../../main_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emilController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final _globalkey = GlobalKey<FormState>();

  late bool circule;
  late bool validate;

  ButtonState progressButtonState = ButtonState.idle;

  //local dataBase
  Box? users;
  LoginDataSave? loginDataSave;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users =Hive.box('users');
    loginDataSave=LoginDataSave();

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener}
        if(state is LoginUser) {
          setState(() {
            progressButtonState = ButtonState.idle;
          });
        }
      },
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener}

            if(state is UserLoginFaild){
              setState(() {
                progressButtonState = ButtonState.idle;
                circule = false;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("This User not Exist or Please Enter valid Credential"),
                  duration: Duration(milliseconds: 300),
                ));
              });
            }
            if(state is UserLoginData){
              final data=(state as UserLoginData).user;
              final stores=(state as UserLoginData).stores;
              final token=(state as UserLoginData).token;
              //Logger().d(data?.stores!.store![1].storename);
              //Logger().d(data?.stores!.store![1].id);
              loginDataSave?.storeTokenUserdata(users,token!, data?.name, data?.email,data?.businessunit, data?.id,data?.role,data?.employeeId,data?.sales,
                   data?.target,data?.targetAchive, data?.linemanagerid,stores!.isEmpty ?"null":stores[0].storename,stores.isEmpty ?"null":stores[0].id,stores.isEmpty ?"null": stores[0].lat,stores.isEmpty?"null":stores[0].lon);
              BlocProvider.of<UserCubit>(context).getUserInformation(data!.linemanagerid!);
            }


        },
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if(state is UserDetailsData){
              final linmanager=(state as UserDetailsData).userResponse;
              loginDataSave?.storeManagerData(users,linmanager?.user?.id,linmanager?.user?.name,linmanager?.user?.role,linmanager?.user?.mobileno,linmanager?.user?.email);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainScreen()), (Route<dynamic> route) => false);
            }
          },
          child: SafeArea(
            maintainBottomViewPadding: true,
            minimum: EdgeInsets.zero,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset("assets/images/up.png",),),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset("assets/images/down.png"),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _globalkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/SalesX.png",height: 120,),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              MaterialTextField(lable:"Email",hintText: "Enter your Email",readOnly: false,controller:emilController ,),
                              const SizedBox(height: 14,),
                              MaterialTextFieldPassword(lable: "Password",hintText:"Enter your Password",controller:passwordController ,),
                              const SizedBox(height: 14,),
                              Container(
                                width: 300,
                                margin: EdgeInsets.only(top: 10),
                                child: ProgressAnimatedButton(text: "Login",colors: kPrimaryColorx,progressButtonState: progressButtonState,tap: (){
                                  if (_globalkey.currentState!.validate()) {

                                    setState(() {

                                      validate = true;
                                      progressButtonState = ButtonState.loading;
                                      BlocProvider.of<LoginCubit>(context).logInUser(emilController.text,passwordController.text,validate);
                                    });

                                  }

                                },),
                              ),
                              const SizedBox(height: 14,),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, FORGET_PASSWORD_PAGE);
                                  },
                                  child:  Text("Forget Password?",style: TextStyle(color: black,fontSize: 18,fontWeight: FontWeight.w300),)
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
