import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:test_app/models/item.dart';

class CardBody extends StatelessWidget {
  CardBody({
    super.key,
    required this.item,
    required this.deleteTask,
    required this.index,
  });
  final int index;
  final Function deleteTask;
  var item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 75,
      constraints: const BoxConstraints(minHeight: 75),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: DateTime.parse(item.date).compareTo(DateTime.now()) < 0
            ? const Color.fromARGB(255, 7, 243, 7).withOpacity(0.6)
            : index % 2 == 0
                ? const Color(0xffDFDFDF)
                : const Color.fromARGB(255, 7, 243, 231).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.content,
                    style: const TextStyle(
                      color: Color(0xff4B4B4B),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                      DateFormatter(item.date.toString())
                          .format('HH:mm dd/MM/yyyy')
                          .toString(),
                      style: const TextStyle(
                        color: Color(0xff4B4B4B),
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      )),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  deleteTask();
                }
                return;
                // deleteTask(item.id);
              },
              child: const Icon(Icons.delete_outline, color: Color(0xff4B4B4B)),
            ),
          ],
        ),
      ),
    );
  }
}
