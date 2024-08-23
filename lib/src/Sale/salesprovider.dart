import 'package:flutter/foundation.dart';
import 'package:rafay_dairies_and_farms/src/Sale/salesmodel.dart';
import 'package:rafay_dairies_and_farms/src/Sale/salesrepository.dart';
import 'package:rafay_dairies_and_farms/src/login/login_model.dart';
import 'package:rafay_dairies_and_farms/src/login/user_prefrences.dart';

class Salesprovider extends ChangeNotifier {
  SalesModel? _salesModel;
  bool _loading = false;
  String? token = '';
  final _papi = SaleRepository();
  String startDate = '';
  String endDate = '';

  bool get loading => _loading;
  SalesModel? get salesModel => _salesModel;

  UserPrefrences userPrefrences = UserPrefrences();

  void setStartDate(String startDate) {
    this.startDate = startDate;
  }

  void setEndDate(String endDate) {
    this.endDate = endDate;
  }

  Future<void> setToken() async {
    LoginModel user = await userPrefrences.getUser();
    token = user.token;
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setSalesModel(SalesModel model) {
    _salesModel = model;
    notifyListeners();
  }

  Future<void> fetchPurchaseData({String? token}) async {
    setLoading(true);

    Map<String, String> data = {
      'from_date': startDate,
      'to_date': endDate,
    };

    try {
      final response = await _papi.SaleseApi(data, token);
      final model = SalesModel.fromJson(response);
      setSalesModel(model);
    } catch (error) {
      print('Error fetching purchase data: $error');
    } finally {
      setLoading(false);
    }
  }
}
