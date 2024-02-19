import 'package:bloc/bloc.dart';
import 'package:brain_pulse/Features/ChatBot/pages/new_conversation.dart';
import 'package:brain_pulse/Features/Courses/meditation_player.dart';
import 'package:brain_pulse/Features/Intro/get_started.dart';
import 'package:brain_pulse/Features/Intro/step1_intro.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Features/splash/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sizer/sizer.dart';

void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const BrainPulseApp());
  FlutterNativeSplash.remove();
}

class BrainPulseApp extends StatelessWidget {
  const BrainPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
        home: NewConversationChatBot(),
      );
    });
  }
}
