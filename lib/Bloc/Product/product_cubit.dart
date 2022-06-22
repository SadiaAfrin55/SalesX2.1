import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import '../../Data/Model/Product/LoadAllProducts.dart';
import '../../Data/Model/Product/Product.dart';
import '../../Data/Model/Product/ProductsResponse.dart';
import '../../Data/Model/Store/Userstore.dart';
import '../../Repository/Product/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  var logger = Logger();
  ProductRepository productRepository=ProductRepository();
  ProductCubit() : super(ProductInitial());

  void getAllProduct(String storeId,String userId){

    ProductRepository().getAllProduct(storeId,userId).then((response) => {
      if(response!=null){
        emit(ProductsLoaded(productsResponse: response))
      },
      logger.d(response)
    });
  }






  void getAllProducts() {
    logger.d("inventory api call");
    ProductRepository().allProductsRepo().then((value) => {
      if(value!=null){
        emit(allProducts(loadAllProducts: value))
      },
    logger.d(value)
    });
  }


}
