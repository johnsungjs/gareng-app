import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
              Text(
                time,
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(content),
        ],
      ),
    );
  }
}
