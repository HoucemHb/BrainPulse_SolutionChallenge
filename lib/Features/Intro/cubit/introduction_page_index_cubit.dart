import 'package:bloc/bloc.dart';
import 'package:brain_pulse/Features/Mental_Health_Assessement/menta_health_assessement.dart';
import 'package:brain_pulse/Transition/fade_transition.dart';
import 'package:brain_pulse/Transition/slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PageCubit extends Cubit<int> {
  final PageController pageController = PageController();

  PageCubit() : super(0);

  void setPage(int index, BuildContext context) {
    index == 5
        ? Navigator.of(context)
            .push(FadePageRoute(child: const MentalHealthAssessement()))
        : pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
    emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
