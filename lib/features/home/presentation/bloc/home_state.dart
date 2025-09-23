part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) final HomeStatus bannerStatus,
    @Default(HomeStatus.initial) final HomeStatus irregularitiesStatus,
    @Default(HomeStatus.initial) final HomeStatus airportFacilityStatus,
    @Default(HomeStatus.initial) final HomeStatus articleStatus,
    @Default([]) final List<BannerModel> bannerData,
    @Default([]) final List<IrregularityModel> irregularitiesData,
    @Default([]) final List<AirportFacilityModel> airportFacilityData,
    @Default([]) final List<ArticleModel> articleData,
  }) = _HomeState;
}
