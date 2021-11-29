import 'package:flutter/material.dart';
import 'package:kodx_wallet_mobile/cores/components/custom_text_widget.dart';
import 'package:kodx_wallet_mobile/cores/components/image_widget.dart';
import 'package:kodx_wallet_mobile/cores/constants/color.dart';
import 'package:kodx_wallet_mobile/cores/utils/custom_sizer_utils.dart';
import 'package:kodx_wallet_mobile/cores/utils/emums.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  const HomeScreenHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget(
              'Good Morning.',
              fontWeight: FontWeight.w500,
              size: sizerSp(16),
            ),
            textWidget(
              'Kukuh Sanjaya',
              fontWeight: FontWeight.w600,
              size: sizerSp(20),
            ),
          ],
        ),
        const Spacer(),
        Icon(Icons.notifications_active, color: kcGrey700, size: sizerSp(20)),
        SizedBox(width: sizerSp(10)),
        SizedBox(
          height: sizerSp(25),
          width: sizerSp(25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(sizerSp(50)),
            child: const KodImageWidget(
              imageTypes: ImageTypes.network,
              imageUrl:
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
            ),
          ),
        ),
      ],
    );
  }
}
