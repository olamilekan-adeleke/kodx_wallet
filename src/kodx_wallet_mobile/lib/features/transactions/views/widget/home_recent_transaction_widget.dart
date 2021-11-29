import 'package:flutter/material.dart';
import 'package:kodx_wallet_mobile/cores/components/custom_text_widget.dart';
import 'package:kodx_wallet_mobile/cores/constants/color.dart';
import 'package:kodx_wallet_mobile/cores/utils/custom_sizer_utils.dart';
import 'package:kodx_wallet_mobile/features/transactions/views/widget/transaction_card.dart';

class HomeRecentTransactionsWidget extends StatelessWidget {
  const HomeRecentTransactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            textWidget(
              'Recent Transactions',
              size: sizerSp(18),
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            textWidget(
              'See All',
              size: sizerSp(16),
              fontWeight: FontWeight.w600,
              color: kcPrimaryColor,
            ),
          ],
        ),
        SizedBox(height: sizerSp(10)),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (_, __) {
              return transactionCard();
            },
          ),
        ),
      ],
    );
  }
}
