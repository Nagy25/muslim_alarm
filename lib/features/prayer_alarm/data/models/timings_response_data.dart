import 'package:freezed_annotation/freezed_annotation.dart';

part 'timings_response_data.freezed.dart';
part 'timings_response_data.g.dart';

@freezed
class TimingsResponseData with _$TimingsResponseData {
  const factory TimingsResponseData({
    required Map<String, dynamic> data,
  }) = _TimingsResponseData;

  factory TimingsResponseData.fromJson(Map<String, dynamic> json) =>
      _$TimingsResponseDataFromJson(json);
}
