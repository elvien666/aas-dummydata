import 'package:tugas_aas/models/products.dart';
import 'package:http/http.dart' as http;

class Api {
  final String baseUrl = 'https://dummyjson.com/products';

  Future getProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (productsFromJson(response.body).limit == 10) {
        return productsFromJson(response.body).products;
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}

final api = Api();
