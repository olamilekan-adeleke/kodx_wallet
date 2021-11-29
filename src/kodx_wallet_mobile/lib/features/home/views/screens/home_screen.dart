import 'package:flutter/material.dart';
import 'package:kodx_wallet_mobile/cores/utils/custom_sizer_utils.dart';
import 'package:kodx_wallet_mobile/features/home/views/widgets/home_screen_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: sizerSp(15)),
        const HomeScreenHeaderWidget(),
        Container(),
      ],
    );
  }
}
