
import '../data/models/products_model.dart';
import '../data/repos/repositories.dart';

class ProductState{

  late List<ProductModel> listOfProducts;

  ProductState({this.listOfProducts  = const []});

  Future<List<ProductModel>> getProduct() async {
    var repo = ProductRepository();

    return await repo.getProducts();
  }

}