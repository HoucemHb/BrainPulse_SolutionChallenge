part of 'audio_player_bloc.dart';

@immutable
sealed class AudioPlayerEvent {}

class PlayAudioEvent extends AudioPlayerEvent {
  final String audioUrl;

  PlayAudioEvent(this.audioUrl);
}

class PauseAudioEvent extends AudioPlayerEvent {}

class StopAudioEvent extends AudioPlayerEvent {}

class ResumeAudioEvent extends AudioPlayerEvent {}
