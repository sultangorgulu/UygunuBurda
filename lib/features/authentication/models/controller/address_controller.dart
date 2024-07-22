import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uygunuburda/database/address_cloud.dart';
import 'package:uygunuburda/features/authentication/models/model/address_model.dart';
import 'package:uygunuburda/features/shop/screen/address/add_new_address.dart';
import 'package:uygunuburda/features/shop/screen/address/widgets/address_container.dart';
import 'package:uygunuburda/util/constants/image_strings.dart';
import 'package:uygunuburda/util/constants/sizes.dart';
import 'package:uygunuburda/util/helpers/cloud_helper_functions.dart';
import 'package:uygunuburda/util/helpers/network_manager.dart';
import 'package:uygunuburda/util/loaders/fullscreen_loader.dart';
import 'package:uygunuburda/util/loaders/loaders.dart';
import 'package:uygunuburda/util/shared/section_title.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final addressesCloud = Get.put(AddressCloud());
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final city = TextEditingController();
  final neighbourhood= TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormkey = GlobalKey<FormState>();
  RxBool refreshData = true.obs;

  Future<List<AddressModel>> getAllUsersAddresses() async {
    try {
      final addresses = await addressesCloud.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator(),
      );

      if (selectedAddress.value.id.isNotEmpty) {
        await addressesCloud.updateSelectField(selectedAddress.value.id, false);
      }

      newAddress.selectedAddress = true;
      selectedAddress.value = newAddress;
      await addressesCloud.updateSelectField(selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      AppLoaders.errorSnackbar(
          title: 'Error in selection', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Storing Address...', AppImages.dockeranimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      if (!addressFormkey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        city: city.text.trim(),
        country: country.text.trim(),
        selectedAddress: true, 
        neighbourhood: neighbourhood.text.trim(),
      );

      final id = await addressesCloud.addAddress(address);

      address.id = id;
      await selectAddress(address);

      AppFullScreenLoader.stopLoading();
      AppLoaders.successSnackbar(
        title: 'Congratulations',
        message: 'Your address has been saved successfully',
      );

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackbar(title: 'Address Not Found', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    country.clear();
    city.clear();
    phoneNumber.clear();
    addressFormkey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSectionTitle(title: 'Select Address'),
              FutureBuilder(
                future: getAllUsersAddresses(),
                builder: (context, snapshot) {
                  final widget = AppCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);

                  if (widget != null) return widget;

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => AddressContainer(
                      addressmodel: snapshot.data![index],
                      onTap: () async {
                        await selectAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const AddNewAddressScreen()),
                  child: const Text('Add New Address'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}