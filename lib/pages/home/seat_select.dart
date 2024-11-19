import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

class SeatSelect extends StatelessWidget {
  String startStation;
  String arrivalStation;
  Function(String) onStartedChanged;
  Function(String) onArrivedChanged;

  SeatSelect({
    required this.arrivalStation,
    required this.onArrivedChanged,
    required this.onStartedChanged,
    required this.startStation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return StationListPage(stationType: '출발역');
                },
              ),
            );
            if (result != null) {
              onStartedChanged(result);
            }
          },
          child: Column(
            //출발역 부분 //TODO 터치시 StationListPage로 이동, StationListPage에서 선택한 역으로 문자열 반영, 선택이 없는 초기상태에는 '선택'문구 출력
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '출발역',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                startStation == '' ? '선택' : startStation,
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
        Container(
          //가운데 선
          width: 2,
          height: 50,
          color: Colors.grey[400],
        ),
        GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return StationListPage(stationType: '도착역');
                },
              ),
            );
            if (result != null) {
              onArrivedChanged(result);
            }
          },
          child: Column(
            //도착역 부분 //TODO 터치시 StationListPage로 이동, StationListPage에서 선택한 역으로 문자열 반영, 선택이 없는 초기상태에는 '선택'문구 출력
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '도착역',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                arrivalStation == '' ? '선택' : arrivalStation,
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
