import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gareng_front/constants/custom_style.dart';
import 'package:gareng_front/models/history_response_model.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:gareng_front/widgets/history_list.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final APIService apiService = APIService();
  late Future<HistoryResponseModel> history;
  //late Future<Album> futureAlbum;

  Future<HistoryResponseModel> fetch() async {
    return await apiService.getHistoryTransaction();
  }

  @override
  void initState() {
    super.initState();
    history = fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
          child: Text(
            "History",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          width: double.infinity,
          decoration: customShadowNoRadius,
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://source.unsplash.com/oT7_v-I0hHg',
                      height: 70,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('data random'),
                      Text('23 Sep 2023'),
                      Text('Payment Method: Cash'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('50000'),
                  TextButton(
                      style: ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              const EdgeInsets.all(10)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStatePropertyAll(customBlack)),
                      onPressed: () {},
                      child: Text(
                        'Reorder',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          width: double.infinity,
          decoration: customShadowNoRadius,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://source.unsplash.com/oT7_v-I0hHg',
                  height: 70,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text('ini nanti apus'),
                  Text('ini nanti apus'),
                ],
              ),
            ],
          ),
        )
        // Expanded(
        //   child: FutureBuilder<HistoryResponseModel>(
        //       future: history,
        //       builder: (context, snapshot) {
        //         if (snapshot.hasData) {
        //           return HistoryList(history: snapshot.data!);
        //         } else {
        //           return Text('error ${snapshot.error}');
        //         }
        //       }),
        // ),
      ],
    );
  }
}
