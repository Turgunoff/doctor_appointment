//
// @Author: "Eldor Turgunov"
// @Date: 31.01.2024
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GetBuilder<HomeController>(builder: (context) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryData.length,
          itemBuilder: (context, index) => Padding(
            padding:
            const EdgeInsets.only(right: 12, bottom: 8, top: 8),
            child: InkWell(
              onTap: () {
                controller.selectCategory(index);
              },
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: controller
                        .categoryData[index].isSelected.value
                        ? Theme.of(context).primaryColor
                        : Get.isDarkMode
                        ? Colors.transparent
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.categoryData[index].categoryName,
                          style: TextStyle(
                            fontSize: 16,
                            color: controller.categoryData[index]
                                .isSelected.value
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
