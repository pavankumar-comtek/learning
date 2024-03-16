import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/favourites_model.dart';

class FavouriteModules extends StatefulWidget {
  FavouriteModules({super.key});

  @override
  State<FavouriteModules> createState() => _FavouriteModulesState();
}

class _FavouriteModulesState extends State<FavouriteModules> {
  List<String> categories = [
    "Summer",
    "T- Shirts",
    "Shirts",
    "Sleeves",
    "Summer",
    "T- Shirts",
    "Shirts",
    "Sleeves",
  ];

  int _selectedIndex = 0;
  //Private Variable.
  int _counter = 0;



  

  List<FavouritesModel> favourites = [
    FavouritesModel(
      numberOfStars: 4,
      productBrand: "LIME",
      productName: "Shirt",
      color: "Blue",
      size: "L",
      price: "10",
      imagePath: "assets/images/photo.png",
    ),
    FavouritesModel(
      numberOfStars: 4,
      productBrand: "LIME",
      productName: "Shirt",
      color: "Blue",
      size: "L",
      price: "10",
      imagePath: "assets/images/photo.png",
    ),
    FavouritesModel(
      numberOfStars: 4,
      productBrand: "LIME",
      productName: "Shirt",
      color: "Blue",
      size: "L",
      price: "10",
      imagePath: "assets/images/photo.png",
    ),
    FavouritesModel(
      numberOfStars: 4,
      productBrand: "LIME",
      productName: "Shirt",
      color: "Blue",
      size: "L",
      price: "10",
      imagePath: "assets/images/photo.png",
    ),
  ];
  late Timer timer;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(  "Favourite Timer ${timer.tick}");
    });
  }

   @override
  void dispose() {
    // TODO: implement dispose
    print("Favourite Time dispose");
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.pop(context);
        }),
        title: Center(
          child: Text(
            "Favourites",
            style: GoogleFonts.metrophobic(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        automaticallyImplyLeading: true,
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            key: Key("Categories"),
            child: Container(
              color: Colors.white,
              height: 50,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 30,
                      width: 100,
                      child: Center(
                        child: Text(
                          "${categories[index]}",
                          style: GoogleFonts.metrophobic(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                },
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: Key("Favourites"),
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: favourites.length,
                itemBuilder: (BuildContext context, int index) {
                  return productDetails(favourites[index], context);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.5),
              ),
            ),
          ),

          // SliverToBoxAdapter(
          //   key: Key("Favourites"),
          //   child: Center(
          //     child: Text(_selectedIndex.toString(),
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   key: Key("Increment"),
          //   child: Center(
          //     child: Text(
          //       _counter.toString(),
          //     ),
          //   ),
          // ),

          // SliverToBoxAdapter(
          //   key: Key("button"),
          //   child: IconButton(
          //       icon: Icon(Icons.add),
          //       onPressed: () {
          //         setState(() {
          //           _counter = _counter * 2;
          //         });
          //       }),
          // )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
    );
  }

  Widget productDetails(FavouritesModel favouritesModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //The image section
          Expanded(
            flex: 20,
            child: Container(
              //width: 162,
              //height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                favouritesModel.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),

          //The Text Section
          Container(
            height: 18,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: favouritesModel.numberOfStars,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Icon(
                  Icons.star,
                  color: Color(0xFFFFBA49),
                );
              },
            ),
          ),
          Text(
            favouritesModel.productBrand,
            style: GoogleFonts.metrophobic(
              color: Color(0xFF9B9B9B),
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            favouritesModel.productName,
            style: GoogleFonts.metrophobic(
              color: Color(0xFF222222),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              Text(
                "Color: ${favouritesModel.color}",
                style: GoogleFonts.metrophobic(
                  color: Color(0xFF9B9B9B),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Size: ${favouritesModel.size}",
                style: GoogleFonts.metrophobic(
                  color: Color(0xFF9B9B9B),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Expanded(
            child: Text(
              "${favouritesModel.price}\$",
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500,
                height: 0.10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SampleWidget extends StatelessWidget {
  const SampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
