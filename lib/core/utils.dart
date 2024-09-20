import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

double navBarHeight = 60;

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  // timestamp to 22.06.2000
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}

void precacheImages(BuildContext context) {
  try {
    List<String> imageAssets = [
      'assets/logo.png',
      'assets/onboard1.png',
      'assets/onboard2.png',
      'assets/onboard3.png',
      'assets/onboard4.png',
      'assets/recipe1.png',
      'assets/recipe2.png',
      'assets/recipe3.png',
      'assets/varieties1.png',
      'assets/varieties2.png',
      'assets/varieties3.png',
      'assets/varieties4.png',
      'assets/varieties5.png',
      'assets/varieties6.png',
      'assets/varieties7.png',
      'assets/varieties8.png',
    ];
    for (String assets in imageAssets) {
      precacheImage(AssetImage(assets), context);
    }
  } catch (e) {
    logger(e);
  }
}

Future<XFile> pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return XFile('');
    return image;
  } catch (e) {
    logger(e);
    return XFile('');
  }
}
