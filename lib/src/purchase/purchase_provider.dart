import 'package:flutter/material.dart';
import 'package:rafay_dairies_and_farms/src/login/login_model.dart';
import 'package:rafay_dairies_and_farms/src/login/user_prefrences.dart';
import 'package:rafay_dairies_and_farms/src/purchase/purchase_model.dart';
import 'package:rafay_dairies_and_farms/src/purchase/purchase_repository.dart';

class PurchaseProvider extends ChangeNotifier {
  PurchaseModel? _purchaseModel;
  bool _loading = false;
  String? token = '';
  final _papi = PurchaseRepository();
  String startDate = '';
  String endDate = '';

  bool get loading => _loading;
  PurchaseModel? get purchaseModel => _purchaseModel;

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

  void setPurchaseModel(PurchaseModel model) {
    _purchaseModel = model;
    notifyListeners();
  }

  Future<void> fetchPurchaseData({String? token}) async {
    setLoading(true);

    Map<String, String> data = {
      'from_date': startDate,
      'to_date': endDate,
    };

    try {
      final response = await _papi.PurchaseApi(data, token);
      final model = PurchaseModel.fromJson(response);
      setPurchaseModel(model);
    } catch (error) {
      print('Error fetching purchase data: $error');
    } finally {
      setLoading(false);
    }
  }
}
