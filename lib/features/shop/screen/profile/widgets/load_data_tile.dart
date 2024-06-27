import 'package:flutter/material.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class LoadDataTile extends StatelessWidget {
  const LoadDataTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onPressed,
  });
  final Icon leadingIcon;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              leadingIcon,
              const SizedBox(width: AppSizes.spaceBtwItems),
              SizedBox(
                width: 200,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.upload,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}