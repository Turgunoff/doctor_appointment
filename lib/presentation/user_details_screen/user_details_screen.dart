//
// @Author: "Eldor Turgunov"
// @Date: 30.01.2024
//

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../book_appointment_screen/book_appointment_screen.dart';
import '../home/models/doctors.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Doctor doctor = Get.arguments as Doctor;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left_2),
          onPressed: () {
            Get.back();
          },
        ),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white.withAlpha(100),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(100),
        title: const Text('Doctor Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 110, left: 20, right: 20, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 3), // Change the offset as needed
                          blurRadius: 6, // Adjust the blur radius as needed
                          spreadRadius: 0, // Adjust the spread radius as needed
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover,
                              'https://i.pinimg.com/originals/46/5a/f1/465af15f6684b1ea0d799fda31c951e3.jpg',
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              maxLines: 1,
                              'Dr. John Doe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Cardiologist',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  size: 18,
                                  Iconsax.location,
                                  color: Colors.grey.shade800,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'New York, USA',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6, // Adjust the blur radius as needed
                          spreadRadius: 0, // Adjust the spread radius as needed
                          offset: Offset(0, 3), // Adjust the offset as needed
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xffF9F9F9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '10 Years',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'Experience',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff677294),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xffF9F9F9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '1000',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Patients',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff677294),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xffF9F9F9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '100',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Reviews',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff677294),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //About Doctor
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About Doctor',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Dr. John Doe is a Cardiologist in New York, USA. He has 10 years of experience in this field. He has done his MBBS from New York Medical College and MD from New York Medical College. He is a member of the American College of Cardiology (ACC). Some of the services provided by the doctor are: Cardiac Ablation, Cardiac Catheterization, Cardiac MRI, Cardioversion, and Cardiac Procedure etc.'
                        'Dr. John Doe is a Cardiologist in New York, USA. He has 10 years of experience in this field. He has done his MBBS from New York Medical College and MD from New York Medical College. He is a member of the American College of Cardiology (ACC). Some of the services provided by the doctor are: Cardiac Ablation, Cardiac Catheterization, Cardiac MRI, Cardioversion, and Cardiac Procedure etc.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                        maxLines: isExpanded ? null : 3, // Limit to 3 lines
                        overflow:
                            TextOverflow.clip, // Add ellipsis for overflow
                      ),
                      GestureDetector(
                        onTap: () {
                          toggleExpansion();
                        },
                        child: Text(
                          isExpanded ? 'View less' : 'View more',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //working time (Monday-Friday, 08.00 AM - 18.00 PM)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Working Time',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Monday - Friday, 08.00 AM - 18.00 PM',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //Reviews :see all
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Go to all reviews screen
                            },
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Review Card
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    'https://i.pinimg.com/originals/46/5a/f1/465af15f6684b1ea0d799fda31c951e3.jpg',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'John Doe',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '5.0',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Dr. John Doe is a Cardiologist in New York, USA. He has 10 years of experience in this field. He has done his MBBS from New York Medical College and MD from New York Medical College. He is a member of the American College of Cardiology (ACC). Some of the services provided by the doctor are: Cardiac Ablation, Cardiac Catheterization, Cardiac MRI, Cardioversion, and Cardiac Procedure etc.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                              maxLines: 3, // Limit to 3 lines
                              overflow: TextOverflow
                                  .clip, // Add ellipsis for overflow
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6, // Adjust the blur radius as needed
                    spreadRadius: 0, // Adjust the spread radius as needed
                    offset: Offset(0, 0), // Adjust the offset as needed
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                  top: 12, left: 20, right: 20, bottom: 12),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () =>  BookAppointmentScreen(),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Book Appointment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
