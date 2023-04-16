import 'package:flutter/material.dart';

class booksTiles extends StatelessWidget {
  final String imagePath;
  final String price;
  final String name;
  booksTiles({
    required this.imagePath,
    required this.price,
    required this.name,
});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(imagePath),
              ),
            ),
            Text(
                 name,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + price,style: TextStyle(fontSize: 20),),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child:Icon(Icons.add),

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
