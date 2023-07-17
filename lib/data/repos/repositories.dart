import '../../services/product_api_service.dart';
import '../models/products_model.dart';

class ProductRepository{
  final _apiService = ProductApiService();

  Future<List<ProductModel>> getProducts() async{
    return _apiService.getProducts();
  }
}