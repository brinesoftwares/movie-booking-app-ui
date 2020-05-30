import 'package:flutter/material.dart';

Widget MovieCard(item) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 50,
      ),
      Container(
          height: 300,
          width: 200,
          decoration: new BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child:
                Image.asset(item['poster'], fit: BoxFit.cover, width: 1000.0),
          )),
      SizedBox(
        height: 15,
      ),
      Text(
        item['movie'],
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Action ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          ),
          Icon(
            Icons.brightness_1,
            color: Colors.white,
            size: 4,
          ),
          Text(
            " Advanture",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "4.0",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star_border,
            size: 12,
            color: Colors.white,
          ),
          Icon(
            Icons.star_border,
            size: 12,
            color: Colors.white,
          ),
        ],
      )
    ],
  );
}
