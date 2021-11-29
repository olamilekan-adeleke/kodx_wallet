import 'package:flutter/material.dart';
import 'package:kodx_wallet_mobile/cores/components/custom_scaffold_widget.dart';
import 'package:kodx_wallet_mobile/features/home/views/widgets/bottom_nav_bar_widget.dart';
import 'package:kodx_wallet_mobile/features/home/views/widgets/home_tab_body_widget.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: homeTabBodyWidget(),
      bottomNavigationBar: bottomNavBarWidget(),
    );
  }

  
}
