import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:uygunuburda/features/authentication/models/controller/address_controller.dart';
import 'package:uygunuburda/features/authentication/models/model/address_model.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/helper_functions.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.addressmodel,
    required this.onTap,
  });
  final AddressModel addressmodel;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == addressmodel.id;
        return GestureDetector(
          onTap: onTap,
          child: AppRoundedContainer(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
            backgroundcolor: selectedAddress
                ? AppColors.primary.withOpacity(0.5)
                : Colors.transparent,
            padding: const EdgeInsets.all(AppSizes.md),
            showborder: true,
            bordercolor: selectedAddress
                ? Colors.transparent
                : dark
                    ? AppColors.darkerGrey
                    : AppColors.grey,
            child: Stack(
              children: [
                Positioned(
                  right: 8,
                  top: 0,
                  child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                          ? dark
                              ? AppColors.light
                              : AppColors.dark
                          : null),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      addressmodel.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(
                      addressmodel.phoneNumber,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSizes.sm / 2),
                    Text(
                      addressmodel.toString(),
                      softWrap: true,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}