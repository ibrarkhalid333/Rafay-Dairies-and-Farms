import 'package:flutter/material.dart';
import 'package:rafay_dairies_and_farms/src/login/login_model.dart';
import 'package:rafay_dairies_and_farms/src/login/user_prefrences.dart';
import 'package:rafay_dairies_and_farms/src/payments/payment_model.dart';
import 'package:rafay_dairies_and_farms/src/payments/payment_repository.dart';

class PaymentProvider extends ChangeNotifier {
  PaymentModel? _paymentModel;
  bool _loading = false;
  String? token = '';
  final _papi = PaymentRepository();
  String startDate = '';
  String endDate = '';

  bool get loading => _loading;
  PaymentModel? get paymentModel => _paymentModel;

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

  void setPaymentModel(PaymentModel model) {
    _paymentModel = model;
    notifyListeners();
  }

  Future<void> fetchPaymentData({String? token}) async {
    setLoading(true);

    Map<String, String> data = {
      'from_date': startDate,
      'to_date': endDate,
    };

    try {
      final response = await _papi.PaymentApi(data, token);
      final model = PaymentModel.fromJson(response);
      setPaymentModel(model);
    } catch (error) {
      print('Error fetching purchase data: $error');
    } finally {
      setLoading(false);
    }
  }
}
