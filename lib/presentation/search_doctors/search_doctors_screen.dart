import 'dart:ui';

import 'package:doctor/presentation/search_doctors/controller/search_doctors_controller.dart';
import 'package:doctor/presentation/search_doctors/widgets/search_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/search_textField.dart';

class SearchDoctorsScreen extends StatelessWidget {
  SearchDoctorsScreen({super.key});

  final controller = Get.put(SearchDoctorsController());
  @override
  Widget build(BuildContext context) {
    //width and height of the screen
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(
            "assets/images/back.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.white.withOpacity(0.0),
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(
                Iconsax.arrow_left_2,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text(
              'Search Doctors',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 110, left: 16, right: 16, bottom: 10),
                child: SearchTextField(
                    searchController: controller.searchController),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisExtent: 200,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => const SearchItems(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
