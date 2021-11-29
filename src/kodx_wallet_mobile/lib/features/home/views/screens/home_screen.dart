import 'package:flutter/material.dart';
import 'package:kodx_wallet_mobile/cores/utils/custom_sizer_utils.dart';
import 'package:kodx_wallet_mobile/features/transactions/views/widget/home_recent_transaction_widget.dart';
import 'package:kodx_wallet_mobile/features/home/views/widgets/home_screen_header.dart';
import 'package:kodx_wallet_mobile/features/home/views/widgets/home_wallet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: sizerSp(15)),
        const HomeScreenHeaderWidget(),
        SizedBox(height: sizerSp(20)),
        const HomeWalletWidget(),
        SizedBox(height: sizerSp(20)),
        Expanded(child: const HomeRecentTransactionsWidget()),
        Container(),
      ],
    );
  }
}
