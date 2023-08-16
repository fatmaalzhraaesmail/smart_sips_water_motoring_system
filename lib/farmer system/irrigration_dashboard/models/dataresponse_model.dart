import 'package:graduation_project/farmer%20system/irrigration_dashboard/models/result.dart';

class DataResponseIrr {
  Result? result;
  DataResponseIrr();
  DataResponseIrr.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json);
  }
}
