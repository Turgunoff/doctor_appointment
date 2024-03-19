import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatScreen extends StatelessWidget {
  final String? name;
  final String? photoURL;

  const ChatScreen({super.key, required this.name, required this.photoURL});

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
            centerTitle: false,
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
            title: Row(
              children: [
                if (photoURL != null && photoURL!.isNotEmpty)
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(photoURL!),
                  ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      name ?? 'Unknown User',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Iconsax.more),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: 30, // Generate 15 sample messages
                  itemBuilder: (context, index) {
                    final isCurrentUser =
                        index % 2 == 0; // Alternate sender/receiver
                    return _buildMessageRow(
                        context, isCurrentUser, 'Sample text. $index');
                  },
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMessageRow(
      BuildContext context, bool isCurrentUser, String text) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        decoration: BoxDecoration(
          color:
              isCurrentUser ? Theme.of(context).primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: isCurrentUser ? Colors.white : Colors.black, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          const Icon(
            Iconsax.gallery,
            color: Colors.blue,
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Iconsax.send_1, color: Colors.blue),
            onPressed: () {}, // Placeholder action for now
          ),
        ],
      ),
    );
  }
}
