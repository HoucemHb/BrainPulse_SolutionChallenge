part of 'audio_player_bloc.dart';

@immutable
sealed class AudioPlayerState {}

final class AudioPlayerInitial extends AudioPlayerState {}

class AudioPlayerLoading extends AudioPlayerState {}

class AudioPlayerPlaySuccess extends AudioPlayerState {

  final double percent;
  final bool isPlaying;

  AudioPlayerPlaySuccess(this.percent, this.isPlaying);
}

class AudioPlayerPlaying extends AudioPlayerState {}

class AudioPlayerPaused extends AudioPlayerState {}

class AudioPlayerStopped extends AudioPlayerState {}
