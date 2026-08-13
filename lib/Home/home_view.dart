import 'package:coffee/components/drink.dart';
import 'package:coffee/drinks_details/drinks_details.dart';
import 'package:coffee/model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: DrinkModel.drinks.length,
                  itemBuilder: (context, index)
                  {
                    final drink=DrinkModel.drinks[index];
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context,child)
                      {
                        double offset=0;
                        if(controller.hasClients)
                        {
                          offset=controller.offset/100-index;
                        }
                        offset=offset.clamp(0, 1);
                        return Transform.scale(
                          scale: 1-(offset*0.2),
                          child: GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (c)=>DrinkDetails(initialIndex: index,)));
                            },
                            child: Drink(image: drink.image,
                                name: drink.name,
                                title: drink.title
                            ),
                          ),
                        );
                      },

                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
