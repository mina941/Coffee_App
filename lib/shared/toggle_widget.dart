import 'package:flutter/material.dart';

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isIced=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(0xFFF3EAE1),
      ),
      child: Row(
        children: [
          _buildToggleSelection("Hot", !isIced,(Icons.hot_tub_rounded)),
          _buildToggleSelection("Iced", isIced, (Icons.severe_cold_outlined)),

        ],
      ),
    );
  }

  Widget _buildTextCUP(label,icon)
  {
    return Text(label);
  }

  Widget _buildToggleSelection(label, bool selected,icon)
  {
    return GestureDetector(
      onTap: ()
      {
        setState(() {
          isIced=label=="Iced";
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 20),
        curve: Curves.linear,
          alignment: Alignment.bottomCenter,
          duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: selected ? Colors.white: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 5,),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
