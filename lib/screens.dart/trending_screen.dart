import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width*0.6,
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 17),
      margin: EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(

        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primaryColor,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/img_5.png',
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Text(
            "Vernssage Gallery",
            style: Styles.headLineStyle2.copyWith(color: Colors.white),
          ),
          Text(
            "⭐4.7 (208)",
            style: Styles.headLineStyle4.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 15,),
          Text(
            " ₹ 200/person                                                     ",
            style: Styles.headLineStyle4.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 5,),
          Text(
            "📍Dwarka, Delhi                                                 ",
            style: Styles.headLineStyle4.copyWith(color: Colors.white),
          ) 
        ],
      ),
    );
  }
}