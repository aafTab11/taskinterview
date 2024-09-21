import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

Widget loadingWidget({Color color = Colors.cyan}) => Container(
  color: Colors.white,
  height: Get.height - kToolbarHeight,
  width: Get.width,
  child: Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: LoadingIndicator(
          // indicatorType: Indicator.ballZigZag,
            indicatorType: Indicator.ballRotateChase,
            colors: [color],
            strokeWidth: 1,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.transparent
        ),
      )),
);
