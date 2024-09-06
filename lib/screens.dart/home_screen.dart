import 'package:book_tickets/screens.dart/ticket_view.dart';
import 'package:book_tickets/screens.dart/trending_screen.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning!', style: Styles.headLineStyle3,
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          'Book Tickets', style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            'assets/images/img_3.png'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                     children: [
                      Icon(Icons.search , color: Color(0xFFBFC205),),
                      Text(
                        'Search ',
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Upcoming Bookings' , style: Styles.headLineStyle2,),
                    InkWell(
                      onTap: (){
                        print("You have tapped!");
                      },
                      child: Text('View All' , style: Styles.textStyle.copyWith(color: Styles.primaryColor),),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20), 
            child: Row(
              children: [
                TicketView(),
                TicketView(),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trending in Delhi' , style: Styles.headLineStyle2,),
                InkWell(
                  onTap: (){
                    print("You have tapped!");
                  },
                  child: Text('View All' , style: Styles.textStyle.copyWith(color: Styles.primaryColor),),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20), 
            child: Row(
              children: [
                TrendingScreen(),
                TrendingScreen(),
                TrendingScreen(),
                TrendingScreen(),
              ],
            )

              
          ),
        ],
      ),
    );
  }
}