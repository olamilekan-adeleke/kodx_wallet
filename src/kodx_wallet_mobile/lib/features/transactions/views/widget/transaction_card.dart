import 'package:flutter/material.dart';
import 'package:kodx_wallet_mobile/cores/components/custom_text_widget.dart';
import 'package:kodx_wallet_mobile/cores/constants/color.dart';
import 'package:kodx_wallet_mobile/cores/utils/custom_sizer_utils.dart';

Widget transactionCard() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: sizerSp(5)),
    child: Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: kcPrimaryColor,
            borderRadius: BorderRadius.circular(sizerSp(10)),
          ),
          height: sizerSp(35),
          width: sizerSp(35),
          child: Icon(Icons.person, size: sizerSp(20), color: kcGrey100),
        ),
        SizedBox(width: sizerSp(10)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              'You have a transaction!',
              size: sizerSp(16),
              fontWeight: FontWeight.w600,
              color: kcTextColor.withOpacity(0.7),
            ),
            textWidget(
              'Apr 28',
              size: sizerSp(14),
              fontWeight: FontWeight.w300,
              color: kcTextColor.withOpacity(0.7),
            ),
          ],
        ),
        const Spacer(),
        textWidget(
          '\$ 48',
          size: sizerSp(18),
          fontWeight: FontWeight.w600,
          color: kcTextColor.withOpacity(0.7),
        ),
      ],
    ),
  );
}


// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjMzMDA1MGQ1LTkzMGYtNDRhMi04MmZkLTJiZGE0ZjVlNzI0NiIsImlhdCI6MTYzODE4NTA4MiwiZXhwIjoxNjM4MTkyMjgyfQ.ichTmavMIVLvddZcnsx1SFlBK7C5S5S7QK-xdHKewss