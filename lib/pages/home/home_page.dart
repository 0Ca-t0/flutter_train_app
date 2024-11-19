import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/seat_select.dart';
import 'package:flutter_train_app/pages/home/seat_select_botton.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startStation = '선택';
  String arrivalStation = '선택';

  void onStartStationChanged(String station) {
    setState(() {
      startStation = station;
    });
  }

  void onArrivalStationChanged(String station) {
    setState(() {
      arrivalStation = station;
    });
  }

  Future<void> _navigateAndSelectStation(
      BuildContext context, String stationType) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(stationType: stationType),
      ),
    );

    if (result != null) {
      if (stationType == '출발역') {
        onStartStationChanged(result);
      } else {
        onArrivalStationChanged(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).dividerColor, //배경색상
      appBar: AppBar(
        title: Text('기차 예매'), //앱바
      ),
      body: Container(
        padding: EdgeInsets.all(20), //20만큼 띄워주기
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //중앙배치
          children: [
            Container(
              width: double.infinity, //컨테이너 크기조절
              height: 200, //높이 200
              decoration: BoxDecoration(
                color: Colors.white, //컨테이너 색상
                borderRadius: BorderRadius.circular(20), //모서리 둥글게
              ),
              child: SeatSelect(
                startStation: startStation,
                arrivalStation: arrivalStation,
                onStartedChanged: onStartStationChanged,
                onArrivedChanged: onArrivalStationChanged,
              ), //Seat 선택 박스,
            ),
            SizedBox(
              height: 20,
            ),
            SeatSelectBotton(
              startStation: startStation,
              arrivalStation: arrivalStation,
            ), //시트 선택 버튼
          ],
        ),
      ),
    );
  }
}
