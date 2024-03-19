import 'dart:ui';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'chat_screen/chat_screen.dart';
import 'models/users.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({super.key});

  final usersData = [
    Users(
        name: 'Alice Johnson',
        description: 'Hello, how are you?',
        messageTime: DateTime.now().subtract(const Duration(hours: 3)),
        photoURL: 'https://source.unsplash.com/random/50x50?sig='),
    Users(
        name: 'John Doe',
        description: 'Hello, I am a doctor. How can I help you?',
        messageTime: DateTime.now().subtract(const Duration(hours: 2)),
        photoURL: 'https://source.unsplash.com/random/50x50?sig='),
    Users(
        name: 'Eldor Turgunov',
        description: 'Hello, I am a doctor. How can I help you?',
        messageTime: DateTime.now().subtract(const Duration(hours: 1)),
        photoURL: 'https://source.unsplash.com/random/50x50?sig='),
  ];

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
            title: const Text('Inbox'),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: usersData.length,
              itemBuilder: (context, index) {
                final user = usersData[index];
                return ListTile(
                  onTap: () {
                    Get.to(
                      () => ChatScreen(
                        name: user.name,
                        photoURL: user.photoURL,
                      ),
                      transition: Transition.rightToLeftWithFade,
                    );
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      '${user.photoURL}$index',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(user.name),
                  subtitleTextStyle: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                  subtitle: Text(
                    user.description,
                    maxLines: 1,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('hh:mm a').format(user.messageTime),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(height: 1, color: Colors.grey.shade300),
            ),
          ),
        )
      ],
    );
  }
}
