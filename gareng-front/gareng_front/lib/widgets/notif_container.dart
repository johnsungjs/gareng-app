import 'package:flutter/material.dart';

class NotifContainer extends StatelessWidget {
  final String title;
  final String content;
  final String time;
  const NotifContainer(
      {super.key,
      required this.title,
      required this.content,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w700),
              )),
              Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(content),
        ],
      ),
    );
  }
}
