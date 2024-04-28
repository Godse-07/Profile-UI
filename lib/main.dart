import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user_profile/widgets/info_card.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

const url = 'https://www.linkedin.com/in/pushan-mukhopadhyay-2b326a243/';
const email = 'mukhopadhyaypushan42@gmail.com';
const phone = '9851449619';
const location = 'Kolkata, India';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('images/resume.jpg'),
            ),
            Text(
              "Pushan Mukhopadhyay",
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "BTech student",
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Color.fromRGBO(255, 255, 255, 0.823),
                fontSize: 30,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            InfoCard(
              text: phone,
              icon: Icons.phone,
              onPressed: () {
                String removeSpaceFromPhoneNumber =
                    phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                final phoneCall = 'tel:$removeSpaceFromPhoneNumber';

                launchURL(phoneCall);
              
              },
            ),
            InfoCard(
              text: email,
              icon: Icons.email,
              onPressed: () {
                launchUrl(Uri.parse('mailto:$email'));
              },
            ),
            InfoCard(
                text: url,
                icon: Icons.web,
                onPressed: () {
                  launchUrl(Uri.parse(url));
                }),
            InfoCard(
              text: location,
              icon: Icons.location_city,
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}

void launchURL(String url) async {
  if (await launchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

