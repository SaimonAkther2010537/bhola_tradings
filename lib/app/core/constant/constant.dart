import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const double borderSideWidth = 1;

late BuildContext presentContext;

DateTime? parseDateControllerInput(String inputDate) {
  try {
    // Example input: "Jun 20, 2025"
    return DateFormat('MMM dd, yyyy').parse(inputDate);
  } catch (e) {
    print("❌ Failed to parse date: $e");
    return null; // Or handle as needed
  }
}


String formatApiDate(String rawDate) {
  try {
    final parsedDate = DateTime.parse(rawDate);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  } catch (e) {
    return 'Invalid date';
  }
}