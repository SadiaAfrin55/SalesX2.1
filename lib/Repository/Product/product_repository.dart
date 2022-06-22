
import 'package:logger/logger.dart';
import '../../Data/Model/Product/LoadAllProducts.dart';
import '../../Data/Model/Product/ProductsResponse.dart';
import '../../Network/Product/product_network.dart';

class ProductRepository {
  ProductNetwork productNetwork=ProductNetwork();
  var logger = Logger();

  Future<ProductsResponse?>  getAllProduct(String storeId, String userId) async {
    final raw= await productNetwork.getAllProduct(storeId,userId);
    logger.d(raw);
    return  ProductsResponse.fromJson(raw);
  }

  Future<LoadAllProducts> allProductsRepo()async {
    final raw= await ProductNetwork().loadAllProducts();
    logger.d(raw);
    return  LoadAllProducts.fromJson(raw);
  }

}