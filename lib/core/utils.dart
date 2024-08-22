import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/home/bloc/home_bloc.dart';

bool onboard = true;
double navBarHeight = 90;

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

int getBG(HomeState state) {
  if (state is HomeInitial) return 1;
  if (state is HomeNews) return 2;
  if (state is HomePuzzle) return 3;
  return 0;
}

String getPuzzleAsset(int id) {
  if (id == 1) return 'pp';
  if (id == 2) return 'bb';
  if (id == 3) return 'gg';
  if (id == 4) return 'rr';
  return 'pp1';
}

String getPuzzleName(int id) {
  if (id == 1) return 'Player';
  if (id == 2) return 'Ball';
  if (id == 3) return 'Goal';
  if (id == 4) return 'Referee';
  return '';
}
