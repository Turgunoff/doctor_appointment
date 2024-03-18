import 'dart:ui';

import 'package:doctor/presentation/search_doctors/controller/search_doctors_controller.dart';
import 'package:doctor/presentation/search_doctors/widgets/search_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/search_textField.dart';

class SearchDoctorsScreen extends StatelessWidget {
  SearchDoctorsScreen({super.key});

  final controller = Get.put(SearchDoctorsController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/back.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.white.withAlpha(100),
                  ),
                ),
              ),
              elevation: 0,
              scrolledUnderElevation: 0,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  margin: const EdgeInsets.only(left: 15, top: 9, bottom: 9),
                  child: const Center(
                      child: Icon(
                    CupertinoIcons.back,
                  )),
                ),
              ),
              title: const Text(
                'Search Doctors',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white.withAlpha(100)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SearchTextField(searchController: controller.searchController),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => const SearchItems(),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
