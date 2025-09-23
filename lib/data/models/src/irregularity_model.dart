import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/data/data.dart';

part 'irregularity_model.freezed.dart';
part 'irregularity_model.g.dart';

@freezed
sealed class IrregularityModel with _$IrregularityModel {
  const factory IrregularityModel({
    required final int irregularityId,
    required final String title,
    required final DateTime publishedAt,
    required final String content,
    required final InformationType informationType,
  }) = _IrregularityModel;

  factory IrregularityModel.fromJson(Map<String, dynamic> json) =>
      _$IrregularityModelFromJson(json);
}
