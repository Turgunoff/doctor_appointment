//
// @Author: "Eldor Turgunov"
// @Date: 18.03.2024
//

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? searchController;
  const SearchTextField({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 4,
                color: Colors.grey.withOpacity(.23))
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Iconsax.search_normal_1,
                size: 18,
              )),
          Expanded(
            child: TextField(
              controller: searchController!,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Dentist",
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              searchController!.clear();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
