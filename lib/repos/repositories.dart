import 'dart:convert';
import 'package:http/http.dart';

class ProductRepository {
  String endpoint = 'https://api.escuelajs.co/api/v1/products';
  getProducts() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200){
      final List result = jsonDecode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

}