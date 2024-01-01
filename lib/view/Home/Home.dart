import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://921a-185-213-230-97.ngrok-free.app/shohbozbek/movie/app/v1/api/category/'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Category.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Movie>> fetchMoviesByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('https://921a-185-213-230-97.ngrok-free.app/shohbozbek/movie/app/v1/api/movies/?category=$categoryId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Movie.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load movies for the category');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBar,
        title: Container(
          margin: EdgeInsets.only(bottom: 22.0),
          child: Image.asset(
            'assets/logo/movie.png',
            width: 180.0,
            height: 180.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Navigate to search screen
            },
            iconSize: 30,
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Navigate to notifications screen
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
                          color: Colors.white.withOpacity(0.9),
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
            FutureBuilder<List<Category>>(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No categories found');
                } else {
                  List<Category> categories = snapshot.data!;
                  return Column(
                    children: categories.map((category) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle category tap
                                      navigateToMovies(category.id!);
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 10.0,
                                          ),
                                          child: Text(
                                            category.categoryName!,
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
                          FutureBuilder<List<Movie>>(
                            future: fetchMoviesByCategory(category.id!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return Text('No movies found for the category');
                              } else {
                                List<Movie> movies = snapshot.data!;
                                return Container(
                                  height: 300,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle category item tap
                                    },
                                    child: ListView.builder(
                                      itemCount: movies.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        Movie movie = movies[index];
                                        return Container(
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
                                                    child: Image.network(
                                                      movie.movieImg!,
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
                                                  movie.movieName!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0,
                                                  ),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 19, 23, 32),
    );
  }

  void navigateToMovies(int categoryId) {
    // Implement navigation to the movies screen with the selected category id
  }
}

class Category {
  int? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      categoryName: json['category_name'],
    );
  }
}

class Movie {
  int? id;
  String? movieImg;
  String? movieName;

  Movie({
    this.id,
    this.movieImg,
    this.movieName,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      movieImg: json['movie_img'],
      movieName: json['movie_name'],
    );
  }
}
