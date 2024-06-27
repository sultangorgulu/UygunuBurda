import 'package:flutter/material.dart';

class AppProductTitleText extends StatelessWidget {
  const AppProductTitleText({
    super.key,
    required this.title,
    this.maxlines = 2,
    this.smallsize = false,
    this.textalign = TextAlign.left,
  });

  final String title;
  final int maxlines;
  final TextAlign? textalign;
  final bool smallsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      textAlign: textalign,
      style: smallsize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}