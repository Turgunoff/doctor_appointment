//
// @Author: "Eldor Turgunov"
// @Date: 20.03.2024
//

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  final _editProfileController = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    //width and height of the screen
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: const Image(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
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
            physics: const PageScrollPhysics(),
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          labelText: 'First Name*',
                          // controller:
                          //     _editProfileController.firstNameController,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: CustomTextField(
                          labelText: 'Last Name*',
                          // controller: _editProfileController.lastNameController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField(labelText: 'Email*'),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Date of Birth*',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                            TextField(
                              // controller:
                              //     _editProfileController.birthdayController,
                              maxLines: 1,
                              keyboardType:
                                  TextInputType.number, // For numeric input
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 16,
                              ),
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: '01.01.1980',
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade600,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade600,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              inputFormatters: [
                                MaskTextInputFormatter(mask: "##.##.####"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Gender*',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                            // Container(
                            //   height: 50,
                            //   padding:
                            //       const EdgeInsets.only(left: 10, right: 10),
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.grey.shade600,
                            //     ),
                            //     borderRadius: BorderRadius.circular(8),
                            //   ),
                            //   child: DropdownButton<String>(
                            //     hint: Text('data'),
                            //     isExpanded: true,
                            //     // value: _editProfileController.selectedItem,
                            //     icon: const Icon(Iconsax.arrow_down_1),
                            //     iconSize: 24,
                            //     elevation: 16,
                            //     style: TextStyle(
                            //       color: Colors.grey.shade900,
                            //       fontSize: 16,
                            //     ),
                            //     underline: Container(
                            //       height: 0,
                            //       color: Colors.transparent,
                            //     ),
                            //     onChanged: (value) {
                            //       // _editProfileController.selectedItem = value!;
                            //     },
                            //     items: _editProfileController.items
                            //         .map((String value) =>
                            //             DropdownMenuItem<String>(
                            //               value: value,
                            //               child: Text(value),
                            //             ))
                            //         .toList(),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //phone number
                  CustomTextField(
                    labelText: 'Phone Number*',
                    // controller: _editProfileController.phoneController,
                  ),
                  const SizedBox(height: 20),
                  //checkbox confirm terms
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      Expanded(
                        child: Text(
                          'I confirm that I have read and agree to the terms and conditions',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //save button
                  SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // _editProfileController.editProfile();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  // ... other properties for customization like controller, etc.

  const CustomTextField({Key? key, required this.labelText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
        ),
        TextField(
          maxLines: 1,
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 16,
          ),
          autocorrect: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

/*
//
// @Author: "Eldor Turgunov"
// @Date: 20.03.2024
//

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> items = ['Female', 'Male'];
  String selectedItem = 'Female';

  List<String> categories = [
    'Doctor',
    'Nurse',
    'Pharmacist',
    'Laboratory',
    'Radiologist',
    'Physiotherapist',
    'Dentist',
    'Surgeon',
    'Cardiologist',
    'Neurologist',
    'Dermatologist',
    'Gynecologist',
    'Ophthalmologist',
    'Oncologist',
    'Orthopedist',
    'Pediatrician',
    'Psychiatrist',
    'Urologist',
    'Endocrinologist',
    'Gastroenterologist',
    'Hematologist',
    'Nephrologist',
    'Pulmonologist',
    'Rheumatologist',
    'Allergist',
    'Anesthesiologist',
    'Immunologist',
    'Pathologist',
    'Radiologist',
    'Virologist',
    'Epidemiologist',
    'Neonatologist',
    'Geriatrician',
  ];
  String selectedCategory = 'Doctor';

  List<String> workHours = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
    '24:00',
  ];

  String selectedStartTime = '00:00';
  String selectedEndTime = '00:00';

  double experienceValue = 0;

  final dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //width and height of the screen
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: const Image(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
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
            physics: const PageScrollPhysics(),
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomTextField(labelText: 'First Name*'),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: CustomTextField(labelText: 'Last Name*'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField(labelText: 'Email*'),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Date of Birth*',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                            TextField(
                              controller: dateController,
                              maxLines: 1,
                              keyboardType:
                                  TextInputType.number, // For numeric input
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 16,
                              ),
                              autocorrect: false,
                              decoration: InputDecoration(
                                hintText: '01.01.1980',
                                contentPadding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade600,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade600,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              inputFormatters: [
                                MaskTextInputFormatter(mask: "##.##.####"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              'Gender*',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: selectedItem,
                                icon: const Icon(Iconsax.arrow_down_1),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 16,
                                ),
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedItem = value!;
                                  });
                                },
                                items: items
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //phone number
                  const CustomTextField(labelText: 'Phone Number*'),
                  const SizedBox(height: 20),
                  //place of work
                  const CustomTextField(labelText: 'Place of Work*'),
                  const SizedBox(height: 20),
                  //category
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category*',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade600,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCategory,
                          icon: const Icon(Iconsax.arrow_down_1),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16,
                          ),
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                          items: categories
                              .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //experience
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        'Experience*',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        '${experienceValue.round().toString()} years',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Theme.of(context).primaryColor,
                      activeTrackColor: Theme.of(context).primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                      activeTickMarkColor: Theme.of(context).primaryColor,
                      trackHeight: 8,
                    ),
                    child: Slider(
                      divisions: 10,
                      value: experienceValue,
                      min: 0,
                      max: 10,
                      activeColor: Theme.of(context).primaryColor,
                      label: experienceValue.round().toString(),
                      onChanged: (newValue) =>
                          setState(() => experienceValue = newValue),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // start and end work time
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start Work Time*',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 16),
                            ),
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: selectedStartTime,
                                icon: const Icon(Iconsax.arrow_down_1),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 16,
                                ),
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                items: workHours
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedStartTime = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'End Work Time*',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 16),
                            ),
                            Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade600,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: selectedEndTime,
                                icon: const Icon(Iconsax.arrow_down_1),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 16,
                                ),
                                underline: Container(
                                  height: 0,
                                  color: Colors.transparent,
                                ),
                                items: workHours
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedEndTime = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    //map
                    child: const Text('Map'),
                  ),
                  const SizedBox(height: 20),
                  //checkbox confirm terms
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      Expanded(
                        child: Text(
                          'I confirm that I have read and agree to the terms and conditions',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //save button
                  SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  // ... other properties for customization like controller, etc.

  const CustomTextField({Key? key, required this.labelText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
        ),
        TextField(
          maxLines: 1,
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 16,
          ),
          autocorrect: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}*/
