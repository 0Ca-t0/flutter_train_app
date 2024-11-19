import 'package:flutter/material.dart';
import 'station_list.dart';

class StationListPage extends StatelessWidget {
  final String stationType;

  StationListPage({required this.stationType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //출발역 앱바
        title: Text('$stationType'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          //StationList 나열해주기
          children: [
            StationList(
                stationName: '수서',
                onTap: () {
                  Navigator.pop(context, '수서');
                }),
            StationList(
                stationName: '동탄',
                onTap: () {
                  Navigator.pop(context, '동탄');
                }),
            StationList(
                stationName: '평택지제',
                onTap: () {
                  Navigator.pop(context, '평택지제');
                }),
            StationList(
                stationName: '천안아산',
                onTap: () {
                  Navigator.pop(context, '천산아산');
                }),
            StationList(
                stationName: '오송',
                onTap: () {
                  Navigator.pop(context, '오송');
                }),
            StationList(
                stationName: '대전',
                onTap: () {
                  Navigator.pop(context, '대전');
                }),
            StationList(
                stationName: '김천구미',
                onTap: () {
                  Navigator.pop(context, '김천구미');
                }),
            StationList(
                stationName: '동대구',
                onTap: () {
                  Navigator.pop(context, '동대구');
                }),
            StationList(
                stationName: '경주',
                onTap: () {
                  Navigator.pop(context, '경주');
                }),
            StationList(
                stationName: '울산',
                onTap: () {
                  Navigator.pop(context, '울산');
                }),
            StationList(
                stationName: '부산',
                onTap: () {
                  Navigator.pop(context, '부산');
                }),
          ],
        ),
      ),
    );
  }
}
