import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../auth/auth_bloc/auth_bloc.dart';

class ProfileScreenWrapper extends StatelessWidget {
  const ProfileScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AuthBloc authBloc; // Declare authBloc as an instance variable

  @override
  void initState() {
    super.initState();
    // Initialize authBloc in initState
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xFF374151),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                width: size.width,
                height: size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://nameorigin.ru/assets/i/ai/4/3/0/i/2897599.jpg',
                        fit: BoxFit.cover,
                        width: 120, // Adjust the width as needed
                        height: 120, // Adjust the height as needed
                      ),
                    ),
                    const Text(
                      'Daniel Martinez',
                      style: TextStyle(
                        color: Color(0xFF1F2A37),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      '+123 856479683',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    buildListTile(Iconsax.user_edit, 'Edit Profile', () {
                      // Navigate to Edit Profile screen
                    }),
                    buildListTile(Iconsax.heart, 'Favorites', () {
                      // Navigate to Favorites screen
                    }),
                    buildListTile(Iconsax.notification, 'Notifications', () {
                      // Navigate to Notifications screen
                    }),
                    buildListTile(Iconsax.setting, 'Settings', () {
                      // Navigate to Settings screen
                    }),
                    buildListTile(Iconsax.support, 'Help', () {
                      // Navigate to Help screen
                    }),
                    buildListTile(Iconsax.logout, 'Logout', () {
                      // Handle Logout
                    }, addDivider: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String title, VoidCallback onTap,
      {bool addDivider = true}) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            if (title == 'Logout') {
              // Show confirmation dialog for logout
              showLogoutConfirmationBottomSheet(context, authBloc, onTap);
            } else {
              onTap();
            }
          },
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(Iconsax.arrow_right_3, size: 16),
        ),
        if (addDivider)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(height: 0, thickness: 1, color: Color(0xffE5E7EB)),
          ), // Adjust divider as needed
      ],
    );
  }
}

void showLogoutConfirmationBottomSheet(
    BuildContext context, AuthBloc authBloc, VoidCallback onLogout) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xFF1C2A3A),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child:
                    Divider(height: 0, thickness: 1, color: Color(0xffE5E7EB)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE5E7EB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color(0xFF1C2A3A),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        final authBoc = BlocProvider.of<AuthBloc>(context);

                        authBoc.add(LogOutEvent());

                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                      child: Container(
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1C2A3A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Yes, Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
