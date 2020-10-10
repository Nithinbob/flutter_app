import 'package:http/http.dart' as http;
class NetworkModule{

  Future<http.Response> getShops(url, {Map<String, String> headers}) async {
    return await http.get(url);
  }
  Future postShop(url) async {
    return await http.post(url);
  }
  Future updateShop(url) async {
    return await http.put(url);
  }
  Future deleteShop(url) async {
    return await http.delete(url);
  }
}