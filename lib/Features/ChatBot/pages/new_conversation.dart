import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Global/my_appbar.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NewConversationChatBot extends StatelessWidget {
  const NewConversationChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.marron,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const MyAppBar(title: "Mindful AI Chatbot"),
           
              Image.asset("assets/images/ai_chatbot_robot.png"),
           
              Column(
                children: [
                  Text(
                    'Talk to Doctor Freud AI',
                    style: AppFonts.headLine,
                  ),
                  const Gap(8),
                  Text(
                    "You have no AI conversations. Get your\n mind healthy by starting a new one",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(
                        color: const Color(0xffD6C2B8),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.003),
                  ),
                ],
              ),
           
              MainButton(
                  color: AppColors.orange,
                  text: "New Conversation",
                  iconPath: "assets/images/add+.png",
                  onPressed: () {
                    //TODO: 
                    print("new converstaion pressed");
                  }),
                  const Gap(40)
            ]),
          ),
        ));
  }
}
