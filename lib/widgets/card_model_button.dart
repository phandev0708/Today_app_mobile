import 'package:flutter/material.dart';

import '../models/item.dart';

class ModelButton extends StatefulWidget {
  ModelButton({
    super.key,
    required this.addTask,
  });

  final Function addTask;

  @override
  State<ModelButton> createState() => _ModelButtonState();
}

class _ModelButtonState extends State<ModelButton> {
  TextEditingController controller = TextEditingController();

  var date = DateTime.now();

  void _handleSubmitted(BuildContext context) {
    final name = controller.text;
    if (name.isEmpty) {
      return;
    }
    widget.addTask(name, date);

    Navigator.of(context).pop();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
      cancelText: 'HỦY',
      confirmText: 'XONG',
      helpText: 'Chọn thời gian',
    );
    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime:
            TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
        initialEntryMode: TimePickerEntryMode.input,
      );
      if (pickedTime != null) {
        var dateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          date = dateTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        // color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhập công việc',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                  child: GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                    color: Colors.white,
                    height: 50,
                    child: Center(
                      child: Text(
                        DateFormatter(date.toString())
                            .format('HH:mm dd-MM-yyyy'),
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
              )),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => _handleSubmitted(context),
                  child: const Text('Thêm công việc')),
            )
          ],
        ),
      ),
    );
  }
}
