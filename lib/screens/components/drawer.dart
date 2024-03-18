import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsr_tiffin/controllers/auth_controller.dart';
import 'package:jsr_tiffin/screens/drawer/payments.dart';
import 'package:jsr_tiffin/screens/drawer/profile.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assests/images/background.jpg"),
                      fit: BoxFit.cover),
                  color: Colors.amber),
              child: CircleAvatar(
                // Adjust the radius as needed
                backgroundColor: Colors
                    .transparent, // Make the avatar background transparent
                child: ClipOval(
                  child: Image.network(
                    "https://st.depositphotos.com/1518767/4293/i/450/depositphotos_42930411-stock-photo-concentrated-male-chef-garnishing-food.jpg",
                    width: 100, // Adjust the width and height as needed
                    height: 100,
                    fit: BoxFit
                        .cover, // Ensure the image covers the circular area
                  ),
                ),
              )),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.grey[850]),
            ),
            onTap: () {
              Get.to(() => const Profile());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.book,
              color: Colors.blue,
            ),
            title: Text(
              'My Orders',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.grey[850]),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Colors.blue,
            ),
            title: Text(
              'Payments',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.grey[850]),
            ),
            onTap: () {
              Get.to(() => const MyPayments());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.support_agent,
              color: Colors.blue,
            ),
            title: Text(
              'Support',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.grey[850]),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.grey[850]),
            ),
            onTap: () {
              authController.logOut();
            },
          ),
        ],
      ),
    );
  }
}
