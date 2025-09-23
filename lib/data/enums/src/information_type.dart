import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum InformationType {
  event('Event'),
  news('News'),
  goAround('Go Around');

  const InformationType(this.displayName);

  final String displayName;
}
