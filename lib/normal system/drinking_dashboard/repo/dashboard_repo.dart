import 'package:graduation_project/normal%20system/drinking_dashboard/models/dataresponse_model.dart';
import 'package:graduation_project/shared/network/remote/network_handler.dart';
// usability=false&data=[7.26,77.51,32.55,81.40,63.55,1.95,419.68,68.16,640.00,1045.00,338.0,70.51]
class DashboardRepo {
  DataResponse? model;
  Future<DataResponse?> getData({required bool usability,required List<double> values}) async {
    Map<String, dynamic> data = await ApiService.service.get('http://fatmaesmail.pythonanywhere.com/?usability=false&data=[7.26,77.51,32.55,81.40,63.55,1.95,419.68,68.16,640.00,1045.00,338.0,70.51]',query: {
      'usability':usability,
      'data': values,
    });
    model = DataResponse.fromJson(data);
    return model;
  }
}
  //sorting, manpulation on data call inside it api 