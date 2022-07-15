import 'package:flutter/material.dart';

class CustomTextButom extends StatelessWidget {
  final String title;
  final Function onPressed;
  const CustomTextButom(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: TextButton.styleFrom(
          elevation: 0,
          primary: Colors.black.withOpacity(0.2),
          shadowColor: Colors.transparent,
          side: const BorderSide(
            width: 2,
            color: Colors.green,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enableFeedback: false,
          visualDensity: VisualDensity.compact,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              wordSpacing: 20,
            ),
          ),
        ),
      ),
    );
  }
}
