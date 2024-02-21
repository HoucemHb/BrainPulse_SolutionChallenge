import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Models/message_model.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final List<Message> _messages = [
    Message(
        isSentByUser: true,
        text:
            " Thank you, Doctor Freud. 🙏Your presnence make me happy :) You’re the best AI Therapy chatbot out there. 🏁",
        timestamp: DateTime.now().subtract(const Duration(days: 1))),
    Message(
        isSentByUser: false,
        text:
            "No worries, Shinomiya! I'm here to support you. We'll make progress together!! 👍",
        timestamp: DateTime.now()),
  ];
  MessageBloc()
      : super(MessagesLoaded(messages: [
          Message(
              isSentByUser: true,
              text:
                  " Thank you, Doctor Freud. 🙏Your presnence make me happy :) You’re the best AI Therapy chatbot out there. 🏁",
              timestamp: DateTime.now().subtract(const Duration(days: 1))),
          Message(
              isSentByUser: false,
              text:
                  "No worries, Shinomiya! I'm here to support you. We'll make progress together!! 👍",
              timestamp: DateTime.now()),
        ])) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessage>(_onSendMessage);
  }
  void _onLoadMessages(LoadMessages event, Emitter<MessageState> emit) {
    emit(MessagesLoaded(messages: _messages));
  }

  void _onSendMessage(SendMessage event, Emitter<MessageState> emit) {
    _messages.add(event.message);
    emit(MessagesLoaded(messages: _messages));
  }
}
