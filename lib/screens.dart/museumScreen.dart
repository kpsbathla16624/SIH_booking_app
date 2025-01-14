import 'package:flutter/material.dart';

class Museumscreen extends StatefulWidget {
  const Museumscreen({super.key, required this.name, required this.imageUrl, required this.rating, required this.Location});
 final String name;
  final String imageUrl;
  final String rating;
  final String Location;
  @override
  State<Museumscreen> createState() => _MuseumscreenState();
}

class _MuseumscreenState extends State<Museumscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
           
              decoration: const BoxDecoration(
                
                color: Color(0xFF526799),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),topRight: Radius.circular(21))
              ),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(widget.imageUrl))),
        )
      ],),
    );
  }
}