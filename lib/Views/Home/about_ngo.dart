import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:flutter/material.dart';

class AboutOrganization extends StatelessWidget {
  const AboutOrganization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Organization"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomButtonComponent(
                buttonText: "Donate",
                onPressed: () {
                  Navigator.pushNamed(context, '/donate-view');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
