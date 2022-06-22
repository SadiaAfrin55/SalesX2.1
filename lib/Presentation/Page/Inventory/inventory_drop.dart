// BlocBuilder<ProductCubit, ProductState>(
// builder: (context, state) {
// if(state is !allProducts){
// return Center(child: Text('no product'),);
// }
// var productdata = (state as allProducts).loadAllProducts;
//
// return Expanded(
// child: DropdownButtonHideUnderline(
// child: ButtonTheme(
// alignedDropdown: true,
// child: DropdownButton<String>(
// isDense: true,
// hint: new Text("Select Bank"),
// value: _selected,
// onChanged: (newValue) {
// setState(() {
// _selected = newValue;
// });
//
// print(_selected);
// },
// items: productdata!.product!.map((map) {
// return DropdownMenuItem<String>(
// value: map.id.toString(),
// // value: _mySelection,
// child: Row(
// children: <Widget>[
// Text(map.productName.toString())
// ],
// ),
// );
// }).toList(),
// ),
// ),
// ),
// );
// },
// ),