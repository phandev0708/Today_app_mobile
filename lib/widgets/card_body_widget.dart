import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? const Color(0xffDFDFDF)
            : const Color.fromARGB(255, 7, 243, 231).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Đá banh',
                style: TextStyle(
                  color: Color(0xff4B4B4B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Icon(Icons.delete_outline, color: Color(0xff4B4B4B)),
          ],
        ),
      ),
    );
  }
}
