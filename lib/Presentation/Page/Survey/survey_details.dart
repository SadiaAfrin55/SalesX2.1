import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../../Bloc/Survey/survey_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Data/Model/Survey/Survey.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Widgets/Card/Survey/details_card.dart';
import '../../Widgets/Card/Survey/phone_card.dart';

class SurveyDetails extends StatefulWidget {
  final String? name;
  final String? mobile;
  final String? age;
  final String? email;
  final String? interestIn;
  final String? minbudget;
  final String? maxbudget;
  final String? currentContact;
  
  const SurveyDetails({
    this.name,
    this.mobile,
    this.age,
    this.email,
    this.interestIn,
    this.minbudget,
    this.maxbudget,
    this.currentContact,
    Key? key}) : super(key: key);

  @override
  _SurveyDetailsState createState() => _SurveyDetailsState();
}

class _SurveyDetailsState extends State<SurveyDetails> {

  String? userId;
  String? leaveDate;
  String? saveMonth;
  String? showDateInfo;
  String? month;
  DateTime? selectedDate;
  DateTime initialDate=DateTime.now();

  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();

  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      userId = tokenx.get('userId');
      BlocProvider.of<SurveyCubit>(context).getUserSurveyByMonth(userId!, leaveDate!);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);

    if(dateParse.month.toString().length<2){
      month="0"+dateParse.month.toString();
    }else{
      // selectedDate.month.toString().length<2 ? "0"+selectedDate.month.toString():selectedDate.month.toString()
      month=dateParse.month.toString();
    }

    var formattedDate = "$month-${dateParse.year}";
    var formattedmonth = "$month";

    saveMonth=formattedmonth.toString();
    leaveDate=formattedDate.toString();

    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlocBuilder<SurveyCubit, SurveyState>(
        builder: (context, state) {
          if(state is SurveyLodedByMonth){
          }
          return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            leading: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back, color: Colors.black, size: 27,),
              ),
            ),
            toolbarHeight: 84,
            elevation: 0.5,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 21),
              child: Column(
                    children: [
                      DetailsInfo(
                        name: widget.name!,
                        mobile: widget.mobile!,
                        age: widget.age!,
                        email: widget.email!,
                        interesin: widget.interestIn!,
                        minbudget: widget.minbudget!,
                        maxbudget: widget.maxbudget!,
                        currentPhone: widget.currentContact!,
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height,
                      //   child: ListView.builder(
                      //       shrinkWrap: true,
                      //       physics: ScrollPhysics(),
                      //       itemCount: data.surveys!.length,
                      //       itemBuilder: (context,index){
                      //         return DetailsInfo(
                      //
                      //           name: data.surveys![index].customername,
                      //           mobile: data.surveys![index].customercontactno,
                      //           age: data.surveys![index].customerage,
                      //           email: data.surveys![index].customeremail,
                      //           interesin: data.surveys![index].interestedin,
                      //           minbudget: data.surveys![index].customerbudget,
                      //           maxbudget: data.surveys![index].pricerange,
                      //           currentPhone: data.surveys![index].customercurrentphone,
                      //
                      //         );
                      //       }
                      //   ),
                      // ),
                    ],
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

