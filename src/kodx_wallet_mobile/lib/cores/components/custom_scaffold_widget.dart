import '../utils/custom_sizer_utils.dart';
import 'package:flutter/material.dart';

Widget scaffold({
  required Widget body,
  appBar,
  usePadding = true,
  Widget? bottomNavigationBar,
}) {
  return SafeArea(
    child: Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: usePadding ? sizerSp(10.0) : 0,
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    ),
  );
}
