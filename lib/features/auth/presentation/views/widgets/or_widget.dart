import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Color(0xffDDDFDF))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Text('أو'),
        ),
        Expanded(child: Divider(thickness: 1, color: Color(0xffDDDFDF))),
      ],
    );
  }
}
