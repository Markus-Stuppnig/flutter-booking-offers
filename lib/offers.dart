import 'package:flutter/material.dart';
import 'package:flutter_booking_offers/offer.dart';

class Offers extends StatefulWidget {
  Offers({Key? key, required this.amount}) : super(key: key);

  final int amount;

  @override
  State<Offers> createState() => _Offers();
}

class _Offers extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 800,
        child: ListView(
          children: [
            for (var i in List.generate(widget.amount, (index) => index + 1))
              Offer(name: "Ankush $i"),
              
          ],
        ),
      ),
    );
  }
}
