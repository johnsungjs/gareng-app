import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/widgets/CustomCard.dart';
import 'package:gareng_front/widgets/SearchBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [
        // Text("3 logo atassssssssssssssssssssssssssssssss"),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Logo"),
            Text("Location"),
            Text("Notif Logo"),
          ],
        ),
        // Text("Carousel"),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(20)),
          child: Text("Carousel Here"),
        ),
        SizedBox(
          height: 20,
        ),
        // Text("SearchBar"),
        SearchBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Popular Food"),
            Text("View All"),
          ],
        ),
        // Text("Grids Of Menu"),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              CustomCard(
                  title: "title1",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
              CustomCard(
                  title: "title2",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
              CustomCard(
                  title: "title3",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
              CustomCard(
                  title: "title4",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
              CustomCard(
                  title: "title4",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
              CustomCard(
                  title: "title4",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
              CustomCard(
                  title: "title4",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
              CustomCard(
                  title: "title4",
                  image:
                      "https://thumbs.dreamstime.com/b/toyota-ae-diecast-car-model-isolated-white-background-toyota-ae-249136538.jpg"),
            ],
          ),
        ),
      ]),
    );
  }
}
