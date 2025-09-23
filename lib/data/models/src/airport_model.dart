import 'package:freezed_annotation/freezed_annotation.dart';

part 'airport_model.freezed.dart';
part 'airport_model.g.dart';

@freezed
sealed class AirportModel with _$AirportModel {
  const factory AirportModel({
    required final String airportId,
    required final String airportName,
  }) = _AirportModel;

  factory AirportModel.fromJson(Map<String, dynamic> json) => _$AirportModelFromJson(json);
}
