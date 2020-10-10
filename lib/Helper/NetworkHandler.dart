import 'package:flutter_app/Helper/NetworkModule.dart';

class NetworkHandler {

  getShops() async {
  var a=await  NetworkModule().getShops(
      Uri.encodeFull("purvice/chat/shops/0"),
  headers:{"key":"0"});
  print("qqqqqqqq   $a");
  }


}