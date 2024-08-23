import 'package:rafay_dairies_and_farms/data/Responces/status.dart';

class AppResponce<T> {
  Status? status;
  T? data;
  String? _message;

  AppResponce(this.status, this.data, this._message);

  AppResponce.loaging() : status = Status.LOADING;
  AppResponce.completed(this.data) : status = Status.COMPLETED;
  AppResponce.error(this._message) : status = Status.ERROR;

  @override
  String toString() => "Status: $status\n Message: $_message\n Data $data";
}
