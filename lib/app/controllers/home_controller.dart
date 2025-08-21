import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void onTabTapped(int index) {
    selectedIndex.value = index;
  }
}