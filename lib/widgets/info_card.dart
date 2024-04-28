import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onPressed; // Function should be nullable

  InfoCard({
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon, // Use the provided icon
            color: Colors.teal[900],
          ),
          title: Text(
            text, // Use the provided text
            style: TextStyle(
              color: Colors.teal[900],
              fontFamily: 'Source Sans Pro',
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
