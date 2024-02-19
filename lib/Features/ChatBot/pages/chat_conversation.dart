import 'package:brain_pulse/Features/ChatBot/bloc/message_bloc.dart';
import 'package:brain_pulse/Features/ChatBot/utils/chat_app_bar.dart';
import 'package:brain_pulse/Models/message_model.dart';
import 'package:brain_pulse/Models/message_widget_model.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      backgroundColor: AppColors.marron,
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<MessageBloc, MessageState>(
              builder: (context, state) {
                if (state is MessagesLoaded) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        return MessageWidget(message: message);
                      },
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Container(
            height: 110,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: AppColors.marron4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 280,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: AppColors.marron,
                      borderRadius: BorderRadius.circular(1234)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.mic,
                        color: AppColors.marronSecondary,
                      ),
                      const Gap(10),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 14,color: Colors.white),
                              hintText: "Type to start chatting..."),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 14,color: Colors.white),
                        ),
                      ),
                      Image.asset("assets/images/camera.png")
                    ],
                  ),
                ),
                MyIconButton(
                    onPressed: () {
                      context.read<MessageBloc>().add(SendMessage(
                          message: Message(
                             
                              text: _controller.text,
                              timestamp: DateTime.now(),
                              isSentByUser: true)));
                    },
                    backgroundColor: AppColors.green,
                    icon: Image.asset(
                      "assets/images/enter_arrow.png",
                      height: 24,
                      width: 24,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
