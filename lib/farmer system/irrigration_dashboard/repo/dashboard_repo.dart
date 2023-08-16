import 'package:graduation_project/farmer%20system/irrigration_dashboard/models/dataresponse_model.dart';
import 'package:graduation_project/shared/network/remote/network_handler.dart';
class DashboardRepoIrr {
  DataResponseIrr? model;
  Future<DataResponseIrr?> getData({required bool usability,required List<double> values}) async {
    Map<String, dynamic> data = await ApiService.service.get('http://fatmaesmail.pythonanywhere.com/?usability=true&data=[0.12,59.2,0.5,39.8,33.6,1.8,33.3,1045.0,63.379762]',query: {
      'usability':usability,
      'data': values,
    });
    model = DataResponseIrr.fromJson(data);
    return model;
  }
}
