 import 'package:book_tickets/utils/app_layout.dart';
import 'package:book_tickets/utils/app_styles.dart';
import 'package:book_tickets/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);  
    return SizedBox(
      width: size.width*0.85,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            //Blue part
            Container(
              decoration:  BoxDecoration(
                color: Styles.lightgreen,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),topRight: Radius.circular(21))
              ),
              padding: const  EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Delhi" , style: Styles.headLineStyle3.copyWith(color: Colors.white),),

                      Expanded(child: Container()),
                      const ThickContainer(),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                          height: 24,
                          child: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                   (constraints.constrainWidth() / 6).floor(),
                                   (index) => const SizedBox(
                                    width: 3,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                      color: Colors.white,
                                      ),
                                    ),
                                  ),
                               ),
                             );
                            },
                          ),
                        ),
                          Center(child: Transform.rotate(angle: 0 , child: const Icon(Icons.museum , color: Colors.white),)),
                        ],
                      )),
                  
                      //const Icon(Icons.museum , color: Colors.white),
                      const ThickContainer(),
                      Expanded(child: Container()),

                      Text("     #9" , style: Styles.headLineStyle3.copyWith(color: Colors.white),),

                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50, child: Text(" ", style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      ),
                      Text("Gandhi Smriti" , style: Styles.headLineStyle4.copyWith(color: Colors.white , fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: 50, child: Text("in India", textAlign: TextAlign.end ,style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      ),
                    ],
                  ),
                
                ],
              ),
            ), 
            //Middle part
            Container(
              color: Styles.darkgreen, 
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        )
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) { 
                        return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                          width: 5,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Orange part
            Container(
              decoration: BoxDecoration(
                color: Styles.darkgreen,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21),bottomRight: Radius.circular(21),),
              ),
              padding: const  EdgeInsets.only(left: 16, top: 10 , right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '08:00',
                            style: Styles.headLineStyle3.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Opens at',
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '11 Sept',
                            style: Styles.headLineStyle3.copyWith(color: Colors.white , fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Wed',
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '17:00',
                            style: Styles.headLineStyle3.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            'Closes at',
                            style: Styles.headLineStyle4.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}