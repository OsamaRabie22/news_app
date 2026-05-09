import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;

  const MainErrorWidget(
      { super.key, required this.errorMessage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          errorMessage,
          style: Theme
              .of(context)
              .textTheme
              .labelLarge,
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            "Try Agein",
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),
        ),
      ],
    );

  }
}
