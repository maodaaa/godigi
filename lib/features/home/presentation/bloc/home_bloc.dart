import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/data/data.dart';
import 'package:godigi/dummy_data.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetBannerData>(_onGetBannerData);
    on<GetIrregularitiesData>(_onGetIrregularitiesData);
    on<GetAirportFacilityData>(_onGetAirportFacilityData);
    on<GetArticleData>(_onGetArticleData);
  }

  Future<void> _onGetBannerData(
    GetBannerData event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        bannerStatus: HomeStatus.loading,
        bannerData: dummyBannerData.take(1).toList(),
      ),
    );

    try {
      Future.delayed(Duration(milliseconds: 700));

      final bannerData = dummyBannerData;

      emit(
        state.copyWith(
          bannerStatus: HomeStatus.success,
          bannerData: bannerData,
        ),
      );
    } catch (e) {
      emit(state.copyWith(bannerStatus: HomeStatus.failure));
    }
  }

  Future<void> _onGetIrregularitiesData(
    GetIrregularitiesData event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        irregularitiesStatus: HomeStatus.loading,
        irregularitiesData: dummyIrregularitiesData.take(2).toList(),
      ),
    );

    try {
      Future.delayed(Duration(milliseconds: 800));

      final irregularitiesData = dummyIrregularitiesData;

      emit(
        state.copyWith(
          irregularitiesStatus: HomeStatus.success,
          irregularitiesData: irregularitiesData,
        ),
      );
    } catch (e) {
      emit(state.copyWith(irregularitiesStatus: HomeStatus.failure));
    }
  }

  Future<void> _onGetAirportFacilityData(
    GetAirportFacilityData event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        airportFacilityStatus: HomeStatus.loading,
        airportFacilityData: dummyAirportFacilityData.take(2).toList(),
      ),
    );

    try {
      await Future.delayed(const Duration(seconds: 1, milliseconds: 400));

      final airportFacilityData = dummyAirportFacilityData;

      emit(
        state.copyWith(
          airportFacilityStatus: HomeStatus.success,
          airportFacilityData: airportFacilityData,
        ),
      );
    } catch (e) {
      emit(state.copyWith(airportFacilityStatus: HomeStatus.failure));
    }
  }

  Future<void> _onGetArticleData(
    GetArticleData event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        articleStatus: HomeStatus.loading,
        airportFacilityData: dummyAirportFacilityData.take(2).toList(),
      ),
    );

    try {
      await Future.delayed(const Duration(seconds: 1, milliseconds: 200));

      final articleData = dummyArticleData;

      emit(
        state.copyWith(
          articleStatus: HomeStatus.success,
          articleData: articleData,
        ),
      );
    } catch (e) {
      emit(state.copyWith(articleStatus: HomeStatus.failure));
    }
  }
}
