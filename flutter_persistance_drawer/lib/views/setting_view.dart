import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_persistance_drawer/widget/info_builder.dart';
import 'package:iconly/iconly.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const InfoBuilder(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: const Color.fromARGB(255, 112, 119, 249),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: const SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconlyBold.setting,
              size: 100,
            ),
            Text(
              "Settings View",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "This (Settings View) is another route that is pushed onto the Main Wrapper",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
