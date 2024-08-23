import 'package:rafay_dairies_and_farms/data/Network/network_api_services.dart';
import 'package:rafay_dairies_and_farms/src/AppUrl/app_url.dart';

class PurchaseRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> PurchaseApi(var data, var token) async {
    dynamic responce = await _apiServices.postApi(
        data, token: token, AppUrl.PurchaseReportApi);
    return responce;
  }
}
