import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/generated/assets.dart';
import 'package:doctor/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:doctor/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../main.dart';
import '../../widgets/custom_button.dart';
import 'controller/profile_controller.dart';

class ProfileDoctorScreen extends StatelessWidget {
  ProfileDoctorScreen({super.key});

  final _controller = Get.put(ProfileController());

  final session = supabase.auth.currentSession;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (session != null) {
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
            // appBar: AppBar(
            //   centerTitle: true,
            //   flexibleSpace: ClipRect(
            //     child: BackdropFilter(
            //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            //       child: Container(
            //         color: Colors.white.withOpacity(0.0),
            //       ),
            //     ),
            //   ),
            //   elevation: 0,
            //   backgroundColor: Colors.white.withOpacity(0.0),
            //   title: const Text('Profile'),
            // ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 110),
              child: SizedBox(
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => _controller.avatarUrl.value.isNotEmpty
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    backgroundImage: _controller
                                                .avatarUrl.value !=
                                            null
                                        ? Image.network(
                                            _controller.avatarUrl.value,
                                            fit: BoxFit.cover,
                                            loadingBuilder: (context, child,
                                                    loadingProgress) =>
                                                loadingProgress == null
                                                    ? child
                                                    : const CircularProgressIndicator(),
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              Assets.imagesUserNotPhoto,
                                              fit: BoxFit.cover,
                                            ),
                                          ).image
                                        : Image.asset(Assets.imagesUserNotPhoto)
                                            .image,
                                  )
                                : const CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      Assets.imagesUserNotPhoto,
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Obx(() => Text(
                                      'Привет, ${_controller.fullName.value}',
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600))),
                                ],
                              ),
                              //payment id
                              Row(
                                children: [
                                  Obx(() => Text(
                                        'ID: ${_controller.paymentId.value}',
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 20),
                              //balance
                              Row(
                                children: [
                                  Obx(() => Text(
                                        'Баланс: ${_controller.balance.value} сум',
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    //edit profile, favorite, settings, help, logout
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      onTap: () => Get.to(() => EditProfileScreen(),
                          transition: Transition.rightToLeftWithFade),
                      leading: const Icon(Iconsax.edit),
                      title: const Text('Edit Profile'),
                      trailing: const Icon(Iconsax.arrow_right_3),
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Iconsax.heart),
                      title: const Text('Favorite'),
                      trailing: const Icon(Iconsax.arrow_right_3),
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Iconsax.notification),
                      title: const Text('Notifications'),
                      trailing: const Icon(Iconsax.arrow_right_3),
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Iconsax.settings),
                      title: const Text('Settings'),
                      trailing: const Icon(Iconsax.arrow_right_3),
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Iconsax.support),
                      title: const Text('Help'),
                      trailing: const Icon(Iconsax.arrow_right_3),
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Iconsax.security),
                      title: const Text('Terms and Conditions'),
                      trailing: const Icon(Iconsax.arrow_right_3),
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      onTap: () {
                        _controller.logOut();
                      },
                      leading: const Icon(Iconsax.logout, color: Colors.red),
                      title: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return const NotLogIn();
    }
    //size height and width
    // final size = MediaQuery.of(context).size;
    // return GetBuilder<ProfileController>(builder: (context) {
    //   if (_controller.user != null) {
    //     if (_controller.userProfile.value != null) {
    //       return Stack(
    //         children: [
    //           SizedBox(
    //             width: size.width,
    //             height: size.height,
    //             child: const Image(
    //               image: AssetImage('assets/images/back.png'),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           Scaffold(
    //             backgroundColor: Colors.transparent,
    //             extendBodyBehindAppBar: true,
    //             appBar: AppBar(
    //               centerTitle: true,
    //               flexibleSpace: ClipRect(
    //                 child: BackdropFilter(
    //                   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //                   child: Container(
    //                     color: Colors.white.withOpacity(0.0),
    //                   ),
    //                 ),
    //               ),
    //               elevation: 0,
    //               backgroundColor: Colors.white.withOpacity(0.0),
    //               title: const Text('Profile'),
    //             ),
    //             body: SingleChildScrollView(
    //               physics: const BouncingScrollPhysics(),
    //               padding: const EdgeInsets.only(top: 110),
    //               child: SizedBox(
    //                 width: size.width,
    //                 child: Column(
    //                   children: [
    //                     CircleAvatar(
    //                       radius: 60,
    //                       backgroundImage: _controller
    //                                   .userProfile.value.photoUrl !=
    //                               null
    //                           ? NetworkImage(
    //                               _controller.userProfile.value.photoUrl!)
    //                           : AssetImage('assets/images/user_not_photo.png')
    //                               as ImageProvider,
    //                       backgroundColor: Colors.white,
    //                     ),
    //                     const SizedBox(height: 20),
    //                     Column(
    //                       children: [
    //                         if (_controller.userProfile.value.isVerified ==
    //                             true) ...[
    //                           Text(
    //                             _controller.userProfile.value.fullName ??
    //                                 'Guest',
    //                             style: const TextStyle(
    //                                 fontSize: 18, fontWeight: FontWeight.w600),
    //                           ),
    //                           //phone number
    //                           Text(
    //                             _controller.userProfile.value.phone ?? '',
    //                             style: TextStyle(
    //                                 fontSize: 14,
    //                                 color: Colors.grey.shade700,
    //                                 fontWeight: FontWeight.w400),
    //                           ),
    //                         ], // End of the conditional block
    //                         // Verification Notice (Always Display for isVerified == false)
    //                         if (_controller.userProfile.value.isVerified ==
    //                             false)
    //                           const Text(
    //                             'Please edit your profile',
    //                             style: TextStyle(
    //                                 color: Colors.red,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                       ],
    //                     ),
    //                     const SizedBox(height: 20),
    //                     //edit profile, favorite, settings, help, logout
    //                     ListTile(
    //                       onTap: () => Get.to(()=>EditProfileScreen(),
    //                           transition: Transition.rightToLeftWithFade),
    //                       leading: const Icon(Iconsax.edit),
    //                       title: const Text('Edit Profile'),
    //                       trailing: const Icon(Iconsax.arrow_right_3),
    //                     ),
    //                     Divider(height: 1, color: Colors.grey.shade300),
    //                     ListTile(
    //                       onTap: () {},
    //                       leading: const Icon(Iconsax.heart),
    //                       title: const Text('Favorite'),
    //                       trailing: const Icon(Iconsax.arrow_right_3),
    //                     ),
    //                     Divider(height: 1, color: Colors.grey.shade300),
    //                     ListTile(
    //                       onTap: () {},
    //                       leading: const Icon(Iconsax.notification),
    //                       title: const Text('Notifications'),
    //                       trailing: const Icon(Iconsax.arrow_right_3),
    //                     ),
    //                     Divider(height: 1, color: Colors.grey.shade300),
    //                     ListTile(
    //                       onTap: () {},
    //                       leading: const Icon(Iconsax.settings),
    //                       title: const Text('Settings'),
    //                       trailing: const Icon(Iconsax.arrow_right_3),
    //                     ),
    //                     Divider(height: 1, color: Colors.grey.shade300),
    //                     ListTile(
    //                       onTap: () {},
    //                       leading: const Icon(Iconsax.support),
    //                       title: const Text('Help'),
    //                       trailing: const Icon(Iconsax.arrow_right_3),
    //                     ),
    //                     Divider(height: 1, color: Colors.grey.shade300),
    //                     ListTile(
    //                       onTap: () {},
    //                       leading: const Icon(Iconsax.security),
    //                       title: const Text('Terms and Conditions'),
    //                       trailing: const Icon(Iconsax.arrow_right_3),
    //                     ),
    //                     Divider(height: 1, color: Colors.grey.shade300),
    //                     ListTile(
    //                       onTap: () {
    //                         _controller.logOut();
    //                       },
    //                       leading:
    //                           const Icon(Iconsax.logout, color: Colors.red),
    //                       title: const Text(
    //                         'Logout',
    //                         style: TextStyle(color: Colors.red),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     } else {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   } else {
    //     return const NotLogIn();
    //   }
    // });
  }
}

class NotLogIn extends StatelessWidget {
  const NotLogIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //size height and width
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
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white.withOpacity(0.0),
            title: const Text('Profile'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: CustomButton(
                textButton: 'Войти',
                onPressed: () {
                  Get.toNamed(AppRoutes.logInScreen);
                },
                height: 50,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
