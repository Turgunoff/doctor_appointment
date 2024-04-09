//
// @Author: "Eldor Turgunov"
// @Date: 20.03.2024
//

import 'dart:ui';

import 'package:doctor/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    //width and height of the screen
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Iconsax.arrow_left_2),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white.withOpacity(0.0),
            title: const Text('Edit Profile'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 115, left: 20, right: 20),
            child: Column(children: [
              Obx(
                () => Column(
                  children: [
                    _buildFormField('Имя*', 'firstName'),
                    _buildFormField('Фамилия*', 'lastName'),
                    _buildFormField('Email*', 'email',
                        keyboardType: TextInputType.emailAddress),
                    _buildPhoneField('Номер телефона*', 'phoneNumber'),
                    _buildFormField('Адрес*', 'adress'),
                    FormBuilderCheckbox(
                      name: 'agreement',
                      initialValue: false,
                      title: const Text('Я согласен на обработку данных'),
                      // validator: FormBuilderValidators.requiredTrue(),
                    ),
                    CustomButton(
                        textButton: 'Сохранить',
                        onPressed: () {},
                        height: 50,
                        width: double.infinity),
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildFormField(String label, String name,
      {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextField(
          keyboardType: keyboardType,
          decoration: _inputDecoration,
          // validator: FormBuilderValidators.required(),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildPhoneField(String label, String name) {
    return _buildFormField(label, name, keyboardType: TextInputType.phone);
  }

  InputDecoration get _inputDecoration => InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        hintText: 'Сергеев',
        hintStyle: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
