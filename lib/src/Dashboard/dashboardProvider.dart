import 'package:flutter/material.dart';
import 'package:rafay_dairies_and_farms/src/Dashboard/dashboard_repository.dart';
import 'package:rafay_dairies_and_farms/src/login/login_model.dart';
import 'package:rafay_dairies_and_farms/src/login/user_prefrences.dart';
import 'dashboard_model.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardModel? _dashboardModel;
  bool _loading = false;
  String? token = '';
  final _dapi = DashboardRepository();

  bool get loading => _loading;
  UserPrefrences userPrefrences = UserPrefrences();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  DashboardModel? get dashboardModel => _dashboardModel;
  void setDashboardModel(DashboardModel model) {
    _dashboardModel = model;
    notifyListeners();
  }

  Future<void> settoken() async {
    LoginModel user = await userPrefrences.getUser();
    this.token = user.token;
  }

  Future<void> fetchDashboardData(String url, {String? token}) async {
    setLoading(true);

    _dapi.UserListApi(token).then((value) {
      DashboardModel model = DashboardModel.fromJson(value);

      setDashboardModel(model);
    }).onError((error, StackTrace) {
      print('Error fetching dashboard data: $error');
    });
  }
}
