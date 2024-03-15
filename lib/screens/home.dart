import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsr_tiffin/screens/components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
      ),
      child: Scaffold(
        drawer: const SideDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          actions: [
            const Icon(
              size: 30,
              Icons.notification_add_outlined,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: size.width * 0.02,
            )
          ],
          // You can customize the AppBar further here
        ),
        body: const Column(
          children: [
            Text("hello world")
            // Add your other widgets here
          ],
        ),
      ),
    );
  }
}
