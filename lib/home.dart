import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_card.dart';

final List<String> movieListBack = [
  'assets/images/bloodshot_back.jpg',
  'assets/images/dolittle_back.jpg',
  'assets/images/mulan_back.jpeg',
  'assets/images/sonic_back.jpg',
  'assets/images/the_call_of_the_wild_back.jpg',
];

final List<Map<String, dynamic>> movieList = [
  {
    'movie': 'Bloodshot',
    'poster': 'assets/images/bloodshot.jpg',
  },
  {
    'movie': 'Dolittle',
    'poster': 'assets/images/dolittle.jpg',
  },
  {
    'movie': 'Mulan',
    'poster': 'assets/images/mulan.jpg',
  },
  {
    'movie': 'Sonic',
    'poster': 'assets/images/sonic.jpg',
  },
  {
    'movie': 'The call of the wild',
    'poster': 'assets/images/the_call_of_the_wild.jpg',
  },
];

final List<Widget> imageSliders =
    movieList.map((item) => Container(child: MovieCard(item))).toList();

class FullscreenSliderDemo extends StatefulWidget {
  @override
  _FullscreenSliderDemoState createState() => _FullscreenSliderDemoState();
}

class _FullscreenSliderDemoState extends State<FullscreenSliderDemo> {
  CarouselController buttonCarouselController = CarouselController();
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: movieListBack.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        color: Colors.black12,
                        image: new DecorationImage(
                          image: new ExactAssetImage(movieListBack[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.6)),
                      ));
                }),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              aspectRatio: 2,
              carouselController: buttonCarouselController,
              viewportFraction: 0.68,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onScrolled: (data) {
                _scrollController.animateTo(
                  ((data * 125 / imageSliders.length) / 100) *
                    _scrollController.position.maxScrollExtent,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 100),
                );
              },
            ),
            items: imageSliders,
          ),
        ],
      ),
      floatingActionButton: ButtonTheme(
        height: 45,
        minWidth: 280,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.amber[700],
          textColor: Colors.black,
          onPressed: () {
            print(_scrollController.position.maxScrollExtent);
          },
          child: Text("Book now".toUpperCase(), style: TextStyle(fontSize: 14)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
