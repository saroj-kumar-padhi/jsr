import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            ),
            title: Text(
              'Profile',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: const Color.fromARGB(255, 69, 70, 83)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.book,
            ),
            title: Text(
              'My Orders',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: const Color.fromARGB(255, 69, 70, 83)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment,
            ),
            title: Text(
              'Payments',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: const Color.fromARGB(255, 69, 70, 83)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.support_agent,
            ),
            title: Text(
              'Support',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: const Color.fromARGB(255, 69, 70, 83)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: const Color.fromARGB(255, 69, 70, 83)),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
