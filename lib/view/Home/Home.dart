import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mymovie/core/constants/color.dart';
import 'package:mymovie/view/Home/Natija2.dart';
import 'package:mymovie/view/Home/Natijasi.dart';
import 'package:mymovie/view/Home/Notifiation.dart';
import 'package:http/http.dart' as http;

class MovieCategory {
  final int id;
  final String categoryName;

  MovieCategory({required this.id, required this.categoryName});

  factory MovieCategory.fromJson(Map<String, dynamic> json) {
    return MovieCategory(
      id: json['id'],
      categoryName: json['category_name'],
    );
  }
}

class BoshSahifa extends StatefulWidget {
  const BoshSahifa({Key? key}) : super(key: key);

  @override
  State<BoshSahifa> createState() => _BoshSahifaState();
}

class _BoshSahifaState extends State<BoshSahifa> {
  late List<MovieCategory> categories = [];
  bool isLoading = true; // Added loading indicator state

  @override
  void initState() {
    super.initState();
    // This function is used to fetch data
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final response =
      await http.get(Uri.parse('https://185c-185-213-229-92.ngrok-free.app/shohbozbek/movie/app/v1/api/category/'));

      if (response.statusCode == 200) {
        final List<dynamic> data =
        json.decode(utf8.decode(response.bodyBytes));
        setState(() {
          categories =
              data.map((item) => MovieCategory.fromJson(item)).toList();
          isLoading = false; // Set loading to false when data is loaded
        });
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false; // Set loading to false on error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBar,
        title: Container(
          margin: EdgeInsets.only(bottom: 22.0),
          child: Image.asset('assets/logo/movie.png', width: 180.0, height: 180.0),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.Icon_Text),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Bilirishnomalar()));
            },
            iconSize: 30,
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: AppColors.Icon_Text),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Bilirishnomalar()));
            },
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 190.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 1.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
                items: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(
                          "assets/treyler/teryler.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 70.0,
                        child: Icon(
                          Icons.play_circle_fill_rounded,
                          size: 45.0,
                          color: AppColors.CarouselSlider_Icon.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  // Additional slides
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // Conditional widget based on the loading state
            isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              children: List.generate(categories.length, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Natijasi2(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.0,
                                    ),
                                    child: Text(
                                      categories[index].categoryName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Natijasi(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        child: Image.asset(
                                          "assets/treyler/teryler.png",
                                          height: 250,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  SizedBox(
                                    width: 150.0,
                                    child: Text(
                                      "Mahabharat filmi  ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Additional widgets
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 19, 23, 32),
    );
  }
}

