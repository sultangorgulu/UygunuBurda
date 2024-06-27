import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AppAnimationLoader extends StatelessWidget {
  const AppAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actiontext,
    this.onActionPressed,
  });

  final String text, animation;
  final bool showAction;
  final String? actiontext;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: AppSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: AppColors.dark),
                    child: Text(
                      actiontext!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: AppColors.light,
                          ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}