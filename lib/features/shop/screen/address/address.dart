import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/features/authentication/models/controller/address_controller.dart';
import 'package:uygunuburda/features/shop/screen/address/add_new_address.dart';
import 'package:uygunuburda/features/shop/screen/address/widgets/address_container.dart';
import 'package:uygunuburda/util/constants/colors.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/shared/app_bar.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: AppColors.primary,
        child: const Icon(Iconsax.add, color: AppColors.white),
      ),
      appBar: AppAppBar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => FutureBuilder(
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUsersAddresses(),
              builder: (context, snapshot) {
                final widget = AppCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                );
                if (widget != null) return widget;
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => AddressContainer(
                    addressmodel: snapshot.data![index],
                    onTap: () =>
                        controller.selectAddress(snapshot.data![index]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}