part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getBannerData() = GetBannerData;
  const factory HomeEvent.getIrregularitiesData() = GetIrregularitiesData;
  const factory HomeEvent.getAirportFacilityData() = GetAirportFacilityData;
  const factory HomeEvent.getArticleData() = GetArticleData;
}
