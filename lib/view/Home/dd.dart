import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mymovie/core/constants/color.dart';
import 'package:mymovie/view/Home/Natija2.dart';
import 'package:mymovie/view/Home/Natijasi.dart';
import 'package:mymovie/view/Home/Notifiation.dart';

class BoshSahifa extends StatelessWidget {
  // Method to fetch movies based on category ID
  Future<List<Map<String, dynamic>>> fetchMoviesByCategory(int categoryId) async {
    Dio dio = Dio();

    try {
      Response response = await dio.get(
          'https://26ae-185-213-229-92.ngrok-free.app/shohbozbek/movie/app/v1/api/movies/?category=$categoryId');
      List<Map<String, dynamic>> movies =
      List<Map<String, dynamic>>.from(response.data);

      return movies;
    } catch (error) {
      print('Xatolik: $error');
      return [];
    }
  }

  // Method to fetch categories
  Future<List<Map<String, dynamic>>> fetchCategories() async {
    Dio dio = Dio();

    try {
      Response response = await dio.get(
          'https://26ae-185-213-229-92.ngrok-free.app/shohbozbek/movie/app/v1/api/category/');
      List<Map<String, dynamic>> categories =
      List<Map<String, dynamic>>.from(response.data);

      return categories;
    } catch (error) {
      print('Xatolik: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBar,
        title: Container(
          margin: EdgeInsets.only(bottom: 22.0),
          child: Image.asset('assets/logo/movie.png',
              width: 180.0, height: 180.0),
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
                  // Additional carousel items can be added
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Xatolik: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('Serverdan ma\'lumotlar olinmadi yoki bo\'sh');
                } else {
                  List<Map<String, dynamic>> categories = snapshot.data!;
                  return Column(
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
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10.0,
                                          ),
                                          child: Text(
                                            categories[index]["category_name"],
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
                            child: FutureBuilder<List<Map<String, dynamic>>>(
                              future: fetchMoviesByCategory(categories[index]["id"]),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Xatolik: ${snapshot.error}');
                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                  return Text('Serverdan ma\'lumotlar olinmadi yoki bo\'sh');
                                } else {
                                  List<Map<String, dynamic>> movies = snapshot.data!;
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: movies.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // Handle movie tap
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
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      10.0,
                                                    ),
                                                    child: Image.network(
                                                      movies[index]["movie_img"],
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
                                                  movies[index]["movie_name"],
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
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  );
                }
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 19, 23, 32),
    );
  }
}
