import 'package:http/http.dart' as http;
import 'package:shop_app_getx/models/product.dart';

class RemoteServices {
  static Future<List<Product>> fetchProducts() async {
    final url = Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline#');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return ProductFromJson(jsonString);
    } else {
      throw Exception('error');
    }
  }
}
