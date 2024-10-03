import 'package:muslim_alarm/core/network/api_client.dart';
import 'package:muslim_alarm/core/network/endpoints.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/models/timings_model.dart';
import 'package:muslim_alarm/features/prayer_alarm/data/models/timings_response_data.dart';

abstract class PrayersTimesDataSource {
  Future<TimingsModel> getTimings({required double lat, required double long});
}

class PrayersTimesDataSourceImpl implements PrayersTimesDataSource {
  final ApiClient apiClient;

  PrayersTimesDataSourceImpl({required this.apiClient});

  @override
  Future<TimingsModel> getTimings(
      {required double lat, required double long}) async {
    final response = await apiClient.get(Endpoints.timings,
        queryParameters: {"latitude": lat, "longitude": long});
    final TimingsResponseData timingsResponseData =
        TimingsResponseData.fromJson(response.data);
    final TimingsModel timingsModel =
        TimingsModel.fromJson(timingsResponseData.data['timings']);
    return timingsModel;
  }
}
