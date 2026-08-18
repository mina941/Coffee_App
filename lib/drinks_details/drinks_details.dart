import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model.dart';
import '../shared/qty_widget.dart';
import '../shared/toggle_widget.dart';

class DrinkDetails extends StatefulWidget {
  final int initialIndex;

  const DrinkDetails({super.key, this.initialIndex = 0});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final List<String> sizes = ["Small", "Large"];
  late PageController _controller;

  late double _currentPage = 0;
  bool isFavorite = false;
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
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          ///Background
          Positioned.fill(
            child: Image.asset(
              "assets/background/background.jpg",
              fit: BoxFit.cover,
            ),
          ),

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
                              height: 350,
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
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF321E17),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      drinks[_currentPage.round()].title,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF703820),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "£ ${drinks[_currentPage.round()].price}",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? const Color(0xFFC68B59) : const Color(0xFF703820),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Multi Selection
          Positioned(
            bottom: 110,
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
                                  padding: const EdgeInsets.all(8),
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
                                    colorFilter: ColorFilter.mode(
                                      _selectindex == index
                                          ? Colors.white
                                          : Colors.black45,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 120),
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
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
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
                  const SizedBox(height: 30),
                  const Row(
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

          /// Order Button Positioned
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // الأكشن عند الضغط
              },
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color:  Color(0xFF703820),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                     Expanded(
                      child: Center(
                        child: Text(
                          'Add to Order',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '£ ${drinks[_currentPage.round()].price}',
                        style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}