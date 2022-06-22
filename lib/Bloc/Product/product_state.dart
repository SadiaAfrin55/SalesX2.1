part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductsLoaded extends ProductState{
  final ProductsResponse? productsResponse;

  ProductsLoaded({this.productsResponse});
}

class ProductsError extends ProductState {
  final String message;

  ProductsError(this.message);
}

class loadProducts extends ProductState{

  final ProductsResponse? productsResponse;
  loadProducts({ this.productsResponse});
}



class allProducts extends ProductState{
  final LoadAllProducts? loadAllProducts;

  allProducts({this.loadAllProducts});
}





// class GetAllproductSAll extends ProductState{
//   final ProductResponse? productResponse;
//
//   GetAllproductSAll({this.productResponse});
// }


// class AllStore extends ProductState{
//   final Userstore? userstore;
//
//   AllStore({this.userstore});
// }
//
// class GetProduct extends ProductState{
//   final Product? product;
//   GetProduct({this.product});
// }

