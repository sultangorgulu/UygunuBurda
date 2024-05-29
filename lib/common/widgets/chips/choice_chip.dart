import 'package:flutter/material.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool) ? onSelected;


  @override
  Widget build(BuildContext context) {
    final isColor = AppHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label:isColor ? const SizedBox() : Text (text),
        selected: selected,
        onSelected: onSelected,
        labelStyle:  TextStyle(color: selected ? AppColors.white : null),
        avatar: AppHelperFunctions.getColor(text) != null 
        ? AppCircularContainer(width:50, height: 50, backgroundColor: AppHelperFunctions.getColor(text)!) : null,
        shape: AppHelperFunctions.getColor(text) !=  null ? const CircleBorder() : null ,
        backgroundColor: AppHelperFunctions.getColor(text) != null ? AppHelperFunctions.getColor(text)! : null,
        labelPadding: AppHelperFunctions.getColor(text) != null ? const EdgeInsets.all(0) : null,
        padding: AppHelperFunctions.getColor(text)!= null ? const EdgeInsets.all(0) : null,
        selectedColor: Colors.green,
        ),
    );
  }
}