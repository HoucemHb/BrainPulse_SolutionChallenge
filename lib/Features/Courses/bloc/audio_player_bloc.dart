import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  AudioPlayerBloc() : super(AudioPlayerInitial()) {
    on<PlayAudioEvent>((event, emit) async {});
    on<PauseAudioEvent>((event, emit) async {});
    on<StopAudioEvent>((event, emit) async {});
    on<ResumeAudioEvent>((event, emit) async {});

    @override
    Future<void> close() {
      return super.close();
    }
  }
}
