import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uygunuburda/util/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen ({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Ad')),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: ' Phone Number')),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText:''))),
                    const SizedBox(height: AppSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText:''))),
                ],
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText:''))),
                    const SizedBox(height: AppSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText:''))),
                ],
                ),
                const SizedBox(height: AppSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
                const SizedBox(height: AppSizes.defaultSpace),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Save')),)
              
              ]
            )
          )
          ),
      ),
    );
  }
}