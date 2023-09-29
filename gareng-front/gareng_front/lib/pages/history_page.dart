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
          child: const Text(
            "History",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: FutureBuilder<HistoryResponseModel>(
              future: history,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HistoryList(history: snapshot.data!);
                } else {
                  return Text('error ${snapshot.error}');
                }
              }),
        ),
      ],
    );
  }
}
