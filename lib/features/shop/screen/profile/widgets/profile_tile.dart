import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    this.trailing,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final Widget leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: trailing,
      ),
    );
  }
}