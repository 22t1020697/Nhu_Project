import 'package:dio/dio.dart';
class API {
  Future<void> getAllProduct() async {    //lập trình bất đồng bộ async - await
    var dio = Dio();
    var response = await dio.request('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      List data = response.data;
      



    } else {
      print('loi roi');
    }
  }
}

var test_api = API();
