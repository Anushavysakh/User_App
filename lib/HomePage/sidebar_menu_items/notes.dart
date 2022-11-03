import 'package:flutter/material.dart';


class Notes extends StatelessWidget {
  const Notes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(onTap: () {

        },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.lightbulb),
                SizedBox(
                  width: 10,
                ),
                Text(
                  " Notes",
                  style: TextStyle(fontSize: 26),
                )
              ]),
        ),
      ),
    );
  }
}
