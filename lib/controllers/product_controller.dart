import 'package:get/get.dart';
import 'package:shop_app_getx/models/product.dart';
import 'package:shop_app_getx/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();

      if (products != null) {
        productList.value = products;
        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      print(e.toString());
    }
  }
}
