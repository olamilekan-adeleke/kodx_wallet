import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kodx_wallet_mobile/cores/components/custom_text_widget.dart';
import 'package:kodx_wallet_mobile/cores/constants/color.dart';
import 'package:kodx_wallet_mobile/cores/utils/custom_sizer_utils.dart';

class HomeWalletWidget extends StatelessWidget {
  const HomeWalletWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sizerSp(10)),
      height: sizerSp(150),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(sizerSp(8)),
        gradient: LinearGradient(
          colors: [
            kcPrimaryColor.withOpacity(0.7),
            kcPrimaryColor.withOpacity(0.8),
            kcPrimaryColor,
          ],
          stops: const [0.1, 0.3, 0.9],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                'Total Balance',
                color: white.withOpacity(0.8),
                fontWeight: FontWeight.w400,
                size: sizerSp(14),
              ),
              textWidget(
                '\$ 56,684.87',
                color: white,
                size: sizerSp(22),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    'Expenses',
                    color: white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    size: sizerSp(12),
                  ),
                  textWidget(
                    '\$ 6,243.55',
                    color: white,
                    size: sizerSp(19),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    'Income',
                    color: white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    size: sizerSp(12),
                  ),
                  textWidget(
                    '\$ 10,504.23',
                    color: white,
                    size: sizerSp(19),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(width: sizerSp(40)),
            ],
          ),
          SizedBox(height: sizerSp(20)),
        ],
      ),
    );
  }
}
