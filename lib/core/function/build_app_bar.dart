import 'package:flutter/material.dart';
import 'package:payment/core/utils/app_text_styles.dart';

AppBar buildAppBar({String? tilte}) {
  return AppBar(
    title: Text(tilte ?? '', style: AppText.medium25),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
