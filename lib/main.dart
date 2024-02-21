import 'package:bloc/bloc.dart';
import 'package:brain_pulse/Features/ChatBot/bloc/message_bloc.dart';
import 'package:brain_pulse/Features/ChatBot/pages/chat_conversation.dart';
import 'package:brain_pulse/Features/ChatBot/pages/new_conversation.dart';
import 'package:brain_pulse/Features/Courses/meditation_player.dart';
import 'package:brain_pulse/Features/Intro/get_started.dart';
import 'package:brain_pulse/Features/Intro/step1_intro.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Features/splash/cubit/progress_cubit.dart';
import 'package:brain_pulse/Features/splash/loading.dart';
import 'package:brain_pulse/Theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(BlocProvider(
    create: (context) => ProgressCubit(),
    child: const BrainPulseApp(),
  ));

  FlutterNativeSplash.remove();
}

class BrainPulseApp extends StatelessWidget {
  const BrainPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: appTheme,
        home:  const LoadingPage(),
      );
    });
  }
}
