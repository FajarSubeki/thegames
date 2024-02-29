import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:thegames/config/theme/app_color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitCubeGrid(
          color: AppColor.primary,
        ),
        Text(
          'Loading',
          style: TextStyle(color: AppColor.green),
        )
      ],
    );
  }
}
