import 'package:get/get.dart';
import 'package:getx_api/mode.dart';
import 'package:http/http.dart' as http;

class DataController extends GetxController{

  var isLoading=true.obs;
  Usdrate? usdratedata;
  RxList usd = [].obs;
  RxList rate = [].obs;

  @override
  void onInit(){
    super.onInit();
    fetchdata();
  }

  fetchdata() async
  {
    try
    {
      isLoading(true);
      usdratedata = await Provider.getusdrate();
      usdratedata!.rates.forEach((key, value) {
        usd.add(key);
        rate.add(value);
      });
    }
    finally
    {
      isLoading(false);
    }
  }
}

class Provider extends GetConnect{
  static var clinet=http.Client();

  static Future<Usdrate?> getusdrate() async{
    var response = await clinet.get(Uri.parse('https://open.er-api.com/v6/latest/USD'));
    if(response.statusCode==200){
      return usdrateFromJson(response.body);
    }
  }
}


class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DataController());
  }
}