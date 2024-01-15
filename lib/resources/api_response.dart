import 'package:examtice_teacher/resources/api_status.dart';

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = ApiStatus.loading;
  ApiResponse.completed() : status = ApiStatus.completed;
  ApiResponse.error() : status = ApiStatus.error;

  @override
  String toString() {
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}
