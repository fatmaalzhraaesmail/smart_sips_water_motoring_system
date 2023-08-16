import 'package:graduation_project/normal%20system/drinking_dashboard/models/result.dart';

class DataResponse {
  // List<Result> results=[];
  Result? result;
  DataResponse();
  DataResponse.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (results != null) {
  //     data[''] = results.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
