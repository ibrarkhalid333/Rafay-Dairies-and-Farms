import 'package:flutter/foundation.dart';
import 'package:rafay_dairies_and_farms/src/Expense/expense_model.dart';
import 'package:rafay_dairies_and_farms/src/Expense/expense_repository.dart';
import 'package:rafay_dairies_and_farms/src/login/login_model.dart';
import 'package:rafay_dairies_and_farms/src/login/user_prefrences.dart';

class ExpenseProvider extends ChangeNotifier {
  ExpenseModel? _expenseModel;
  bool _loading = false;
  String? token = '';
  final _papi = ExpenseRepository();
  String startDate = '';
  String endDate = '';

  bool get loading => _loading;
  ExpenseModel? get expenseModel => _expenseModel;

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

  void setExpenseModel(ExpenseModel model) {
    _expenseModel = model;
    notifyListeners();
  }

  Future<void> fetchExpenseData({String? token}) async {
    setLoading(true);

    Map<String, String> data = {
      'from_date': startDate,
      'to_date': endDate,
    };

    try {
      final response = await _papi.ExpenseApi(data, token);
      final model = ExpenseModel.fromJson(response);
      setExpenseModel(model);
    } catch (error) {
      print('Error fetching purchase data: $error');
    } finally {
      setLoading(false);
    }
  }
}
