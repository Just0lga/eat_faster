import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 400,
        height: 60,
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).colorScheme.inversePrimary),
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
