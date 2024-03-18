//
// @Author: "Eldor Turgunov"
// @Date: 18.03.2024
//

import 'package:flutter/cupertino.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Iconsax.search_normal_1,
              color: Colors.grey.shade700,
              size: 24,
            ),
          ),
          Expanded(
            child: TextField(
              maxLines: 1,
              controller: searchController!,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Doctors",
                hintStyle: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              searchController!.clear();
            },
            icon: Icon(
              CupertinoIcons.clear,
              color: Colors.grey.shade700,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
