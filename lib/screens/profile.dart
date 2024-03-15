import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 152, 187, 248),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blueAccent,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                ),
              ),
            ),
          ),
          Text(
            "suraj Kumar",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.radioCanada(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: const Color.fromARGB(255, 69, 70, 83)),
          ),
          Text(
            "surajpadhi01@gmail.com",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.radioCanada(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: const Color.fromARGB(255, 69, 70, 83),
              fontStyle: FontStyle.italic, // Make the text italic
            ),
          ),
          Text(
            "6280644889",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.radioCanada(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: const Color.fromARGB(255, 69, 70, 83),
              fontStyle: FontStyle.italic, // Make the text italic
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text("Your's Orders",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic, // Make the text italic
                )),
            leading: const Icon(
              Icons.history,
              color: Colors.amber,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text("Payments",
                style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic, // Make the text italic
                )),
            leading: const Icon(
              Icons.payment,
              color: Colors.amber,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text("Refunds",
                style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic, // Make the text italic
                )),
            leading: const Icon(
              Icons.money_off_csred_outlined,
              color: Colors.amber,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text("LogOut",
                style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic, // Make the text italic
                )),
            leading: const Icon(
              Icons.logout,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
