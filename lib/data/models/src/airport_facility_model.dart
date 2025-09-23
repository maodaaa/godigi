import 'package:freezed_annotation/freezed_annotation.dart';

part 'airport_facility_model.freezed.dart';
part 'airport_facility_model.g.dart';

@freezed
sealed class AirportFacilityModel with _$AirportFacilityModel {
  const factory AirportFacilityModel({
    required final String imageUrl,
    required final String name,
    required final int activeCount,
    required final List<String> tags,
  }) = _AirportFacilityModel;

  factory AirportFacilityModel.fromJson(Map<String, dynamic> json) =>
      _$AirportFacilityModelFromJson(json);
}
