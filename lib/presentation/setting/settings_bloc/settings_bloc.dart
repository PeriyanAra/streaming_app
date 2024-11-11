import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_streaming_app/data/settings/settings_repository.dart';
import 'package:music_streaming_app/gen/strings.g.dart';
import 'package:music_streaming_app/presentation/common/helpers/dialog_helper.dart';
import 'package:music_streaming_app/presentation/setting/widget/settings_data_helper_class.dart';
import 'package:music_streaming_app/presentation/theme/music_streaming_colors_palette.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const SettingsState.loading()) {
    on<_FetchSettingsEvent>(_handleFetchSettingsEvent);
    on<_ChangeUnlockUppStatus>(_handleChangeUnlockUppStatus);
  }

  final SettingsRepository _settingsRepository;

  Future<void> _handleFetchSettingsEvent(
    _FetchSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsState.loading());
    final settingsInfoResponse = await _settingsRepository.fetchSettings();

    settingsInfoResponse.when(
      success: (settingsInfo) {
        final settingsOnTapList = <SettingsData>[];
        _initializeOnTapSettingsList(
          settingsOnTapList: settingsOnTapList,
          settingsInfo: settingsInfo,
          context: event.context,
        );
        return emit(SettingsState.loaded(settingsHelper: settingsOnTapList));
      },
      failure: (failure) => emit(SettingsState.error(failureMsg: failure.debugMessage)),
    );
  }

  void _initializeOnTapSettingsList({
    required List<SettingsData> settingsOnTapList,
    required Map<String, bool> settingsInfo,
    required BuildContext context,
  }) {
    if (settingsInfo['unlock_app'] == false || settingsInfo.isEmpty) {
      settingsOnTapList.add(
        SettingsData(
          title: t.unlockApp,
          onTap: () {
            add(const SettingsEvent.changeUnlockUppStatus());
          },
        ),
      );
    }
    settingsOnTapList.add(
      SettingsData(
        title: t.rateUs,
        onTap: () {
          DialogHelper.show(
            context,
            title: 'Rate My App',
            buttonText: 'Submit',
            content: RatingBar.builder(
              minRating: 1,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: MusicStreamingColorsPalette.amber,
              ),
              onRatingUpdate: (rating) {
                rating = rating;
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _handleChangeUnlockUppStatus(
    _ChangeUnlockUppStatus event,
    Emitter<SettingsState> emit,
  ) async {
    final response = await _settingsRepository.toggleUnlockApp();
    response.when(
      success: (_) {
        if (state is SettingsLoadedState) {
          final currentState = state as SettingsLoadedState;
          final updatedSettingsData = [...currentState.settingsHelper]
            ..removeWhere((settingsData) => settingsData.title == t.unlockApp);
          emit(SettingsState.loaded(settingsHelper: updatedSettingsData));
        }
      },
      failure: (failure) {
        emit(SettingsState.error(failureMsg: failure.debugMessage));
      },
    );
  }
}
