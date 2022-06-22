import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/Sales/sales_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../Widgets/Card/Sales/mysale_card.dart';
import '../../Survey/survey_noData.dart';

class SalesListComponents extends StatefulWidget {
  final String? date;
  const SalesListComponents({this.date,Key? key}) : super(key: key);

  @override
  _SalesListComponentsState createState() => _SalesListComponentsState();
}

class _SalesListComponentsState extends State<SalesListComponents> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesCubit, SalesState>(
      listener: (context, state) {
        if(state is SalesGetByMonth){
          setState(() {

          });
        }
      },
      child: BlocBuilder<SalesCubit, SalesState>(
        builder: (context, state) {
          if (state is! SalesGetByMonth) {
            return Center(child: CircularProgressIndicator(),);
          }
          final data = (state as SalesGetByMonth).saleResponsex;
          return Column(
            children: [
              Column(
                children: [
                  data!.sales!.isEmpty ?
                  Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/nodata.png'),
                        Text('No data available',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8)
                        ),),
                      ],
                    ),
                  ) :
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.sales!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SALES_DETAILS,
                                arguments: {
                                  'productname': data.sales![index].productName,
                                  'price': data.sales![index].price,
                                  'customername': data.sales![index]
                                      .customername,
                                  'mobile': data.sales![index].customermobile,
                                  'age': data.sales![index].age,
                                  'email': data.sales![index].customeremail,
                                  'remark': data.sales![index].remark,
                                  'qunty': data.sales![index].quatity.toString(),
                                });
                          },
                          child: ProductsCard(
                            name: data.sales![index].productName,
                            productName: data.sales![index].storename,
                            price: data.sales![index].price,
                          ),
                        );
                      }
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
