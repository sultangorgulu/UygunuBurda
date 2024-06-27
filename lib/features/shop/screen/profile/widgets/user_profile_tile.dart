import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.title,
    required this.midtitle,
    this.onPressed,
    this.icon = const Icon(Iconsax.arrow_right_34),
  });

  final String title;
  final String midtitle;
  final Icon icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            midtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
            child: GestureDetector(
          onTap: onPressed,
          child: icon,
        )),
      ],
    );
  }
}