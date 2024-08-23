class AppExeptions implements Exception {
  final _message;
  final _prefix;
  AppExeptions([this._message, this._prefix]);

  String toString() {
    return ('$_message$_prefix');
  }
}

class InternetExceptions extends AppExeptions {
  InternetExceptions([String? _message])
      : super(_message, 'No Internet Access');
}

class RequestTimeout extends AppExeptions {
  RequestTimeout([String? _message]) : super(_message, 'Request Timeout');
}

class ServerExceptions extends AppExeptions {
  ServerExceptions([String? _message]) : super(_message, 'Server Not Found');
}

class InvalidUrlException extends AppExeptions {
  InvalidUrlException([String? _message]) : super(_message, 'Invalid Url');
}

class FetchDataException extends AppExeptions {
  FetchDataException([String? _message]) : super(_message, '');
}
