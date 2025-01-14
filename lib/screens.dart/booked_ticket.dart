import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      body: Padding(
        padding: const EdgeInsets.only(top: 90.0, left: 16.0, right: 16.0),
        //padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title: Tickets
            const Text(
              'My Bookings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Upcoming and Previous Booking with BoxDecoration and Divider
            Padding(
              padding: const EdgeInsets.only(top: 16.0), // Padding from above
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Upcoming Booking
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Upcoming Booking',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Divider
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.black26, // Divider color
                    ),
                    // Previous Booking
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Previous Booking',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            //const SizedBox(height: 2,),

            // Ticket Card Example
            Expanded(
              child: ListView(
                children: const [
                  TicketCard(
                    date: '2024-09-10',
                    bookingId: 'AB123456',
                    numberOfPersons: 4,
                    personDetails: ['John Doe', 'Jane Doe', 'Alex', 'Emily'],
                    barcodeImage: "assets/images/img_9.jpg", // Updated image path
                  ),
                  SizedBox(height: 20),
                  TicketCard(
                    date: '2024-09-05',
                    bookingId: 'XY789101',
                    numberOfPersons: 2,
                    personDetails: ['Michael', 'Sarah'],
                    barcodeImage: "assets/images/img_9.jpg", // Updated image path
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

// TicketCard Widget
class TicketCard extends StatelessWidget {
  final String date;
  final String bookingId;
  final int numberOfPersons;
  final List<String> personDetails;
  final String barcodeImage;

  const TicketCard({
    required this.date,
    required this.bookingId,
    required this.numberOfPersons,
    required this.personDetails,
    required this.barcodeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date and Booking ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date: $date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Booking ID: $bookingId',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Number of Persons
          Text(
            'No. of Persons: $numberOfPersons',
            style: const TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Persons Details
          const Text(
            'Persons:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          for (var person in personDetails)
            Text(
              person,
              style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w500),
            ),
          const SizedBox(height: 10),

          // Barcode Image
          Center(
            child: Image.asset(
              barcodeImage,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TicketsPage(),
  ));
}
