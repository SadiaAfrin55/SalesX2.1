import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Bloc/Sales/sales_cubit.dart';
import '../../Widgets/Card/Sales/sale_details_card.dart';

class SalesDetails extends StatefulWidget {
  final String? productname;
  final String? price;
  final String? customername;
  final String? mobile;
  final String? age;
  final String? email;
  final String? qunty;
  final String? remark;

  const SalesDetails({
    this.productname,
    this.price,
    this.customername,
    this.mobile,
    this.age,
    this.email,
    this.qunty,
    this.remark,
    Key? key}) : super(key: key);

  @override
  _SalesDetailsState createState() => _SalesDetailsState();
}

class _SalesDetailsState extends State<SalesDetails> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: BlocBuilder<SalesCubit, SalesState>(
            builder: (context, state) {
              if(state is SalesGetByMonth){

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
                  toolbarHeight: 84,
                  elevation: 0.5,
                ),
                body: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset('assets/icons/phone.png')),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(widget.productname!,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF232C2E)
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/taka.svg'),
                            const SizedBox(width: 5),
                            Text(widget.price!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0180F5)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(thickness: 1),
                        DetailsInfo(
                          name: widget.customername!,
                          mobile: widget.mobile!,
                          age: widget.age!,
                          email: widget.email!,
                          remark: widget.remark!,
                          quantity: widget.qunty.toString(),
                          productprice: widget.price,
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
