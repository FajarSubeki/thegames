import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:thegames/config/theme/app_color.dart';
import 'package:thegames/config/theme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SpinKitThreeInOut(
          color: AppColor.kPrimaryColor,
        ),
        Text(
          'Loading',
          style: blackTextStyle.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
