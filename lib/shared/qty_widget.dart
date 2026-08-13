import 'package:flutter/material.dart';

class QtyWidget extends StatefulWidget {
  const QtyWidget({super.key});

  @override
  State<QtyWidget> createState() => _QtyWidgetState();
}

class _QtyWidgetState extends State<QtyWidget> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: ()
              {
                setState(() {
                  if (number>1){
                    number--;
                  }
                });
              },
              child: Text(
                '-',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              number.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: ()
              {
                setState(() {
                  number++;
                });
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
