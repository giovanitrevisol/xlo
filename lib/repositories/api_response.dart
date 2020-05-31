import 'api_eror.dart';

class ApiResponse {
  bool success;
  dynamic result;
  ApiError error;

  ApiResponse.success({this.result}) {
    success = true;
  }

  ApiResponse.error({this.error}) {
    success = false;
  }
}
