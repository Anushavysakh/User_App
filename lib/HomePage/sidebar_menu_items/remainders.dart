import 'package:flutter/material.dart';

class Remainders extends StatelessWidget {
  const Remainders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.add_alert_rounded),
              SizedBox(
                width: 10,
              ),
              Text(
                " Remainders",
                style: TextStyle(fontSize: 26),
              )
            ]),
      ),
    );
  }
}
