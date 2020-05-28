import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



final List<String> movieListBack = [
  'assets/images/bloodshot_back.jpg',
  'assets/images/dolittle_back.jpg',
  'assets/images/mulan_back.jpeg',
  'assets/images/sonic_back.jpg',
  'assets/images/the_call_of_the_wild_back.jpg',
];

final List<Map<String,dynamic>> movieList = [
  {'movie':'Bloodshot','poster':'assets/images/bloodshot.jpg',},
  {'movie':'Dolittle','poster':'assets/images/dolittle.jpg',},
  {'movie':'Mulan','poster':'assets/images/mulan.jpg',},
  {'movie':'Sonic','poster':'assets/images/sonic.jpg',},
  {'movie':'The call of the wild','poster':'assets/images/the_call_of_the_wild.jpg',},
];



final List<Widget> imageSliders = movieList
    .map((item) => Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                width: 200,
                      decoration: new BoxDecoration(
                      ),
                      child: ClipRRect(

      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child:  Image.asset(item['poster'], fit: BoxFit.cover, width: 1000.0),

                      )
                     ),
 SizedBox(
                height: 15,
              ),
              Text(item['movie'],style: TextStyle(color: Colors.white,fontSize: 18),),
               SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
               Text("Action ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),),
               Icon(Icons.brightness_1,color: Colors.white,size: 4,),
               Text(" Advanture",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12),),
              ],),
               SizedBox(
                height: 5,
              ),
              Text("4.0",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),),
               SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Icon(Icons.star,size: 12,color: Colors.white,),
                Icon(Icons.star,size: 12,color: Colors.white,),
                Icon(Icons.star,size: 12,color: Colors.white,),
                Icon(Icons.star_border,size: 12,color: Colors.white,),
                Icon(Icons.star_border,size: 12,color: Colors.white,),

              ],)
              

            ],
          ),
        ))
    .toList();

class FullscreenSliderDemo extends StatelessWidget {
 var prev = 0, now = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Builder(
            builder: (context) {
              final double height = MediaQuery.of(context).size.height;
              return CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
                items: movieListBack
                    .map((item) => new Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new ExactAssetImage(item),
                            fit: BoxFit.cover,
                          ),

                        ),
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.black.withOpacity(0.6)),
                        )))
                    .toList(),
              );
            },
          ),
          CarouselSlider(

            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              aspectRatio: 2,
              viewportFraction: 0.68,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason){

buttonCarouselController.animateToPage(index, curve: Curves.easeInOutQuart, duration: Duration(milliseconds: 200));
                print(index);

                if(index >= now){

                print("next");

                index = now;

                }

                else{

                print("back");

                }


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
           onPressed: () => buttonCarouselController.nextPage(),
          child: Text("Book now".toUpperCase(), style: TextStyle(fontSize: 14)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
