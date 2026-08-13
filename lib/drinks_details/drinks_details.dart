import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model.dart';
import '../shared/qty_widget.dart';
import '../shared/toggle_widget.dart';

class DrinkDetails extends StatefulWidget {
  final int initialIndex;

  const DrinkDetails({super.key,
    this.initialIndex = 0,
  });

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final List<String> sizes = ["Small", "Large"];
  late PageController _controller ;
  late double _currentPage = 0;
  double drinkSize = 1.1;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.50,
      initialPage: widget.initialIndex,
    );

    _currentPage = widget.initialIndex.toDouble();

    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? widget.initialIndex.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _selectindex = 0;

  final drinks = DrinkModel.drinks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ///1 Widget
          Positioned.fill(
            child: PageView.builder(
              controller: _controller,
              itemCount: drinks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final scale = drinkSize - (_currentPage - index).abs() * 1;
                final translateY = (_currentPage - index).abs() * 400;

                return Transform.translate(
                  offset: Offset(translateY, 0),
                  child: Transform.scale(
                    scale: scale.clamp(0.5, 1.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Image.asset("assets/drinks/Ellipse 2.png"),
                            ),
                            Image.asset(
                              drinks[index].image,
                              height: 380,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          ///2 Widget
          Positioned(
            top: 60,
            left: 30,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinks[_currentPage.round()].name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      drinks[_currentPage.round()].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  "£ ${drinks[_currentPage.round()].price}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          /// Multi Selection
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(2, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectindex = index;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: _selectindex == index
                                        ? Colors.redAccent
                                        : Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/logo/Vector.svg",
                                    height: 30,
                                    color: _selectindex == index
                                        ? Colors.white
                                        : Colors.black45,
                                  ),
                                ),
                                SizedBox(width: 120),
                                Text(
                                  sizes[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: _selectindex == index
                                        ? Colors.redAccent
                                        : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    "Other",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_sharp),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      ToggleWidget(),
                      SizedBox(width: 10),
                      Expanded(child: QtyWidget()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
