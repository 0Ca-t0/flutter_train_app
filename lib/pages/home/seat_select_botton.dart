import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat_page/seat_page.dart';

class SeatSelectBotton extends StatelessWidget {
  final String startStation;
  final String arrivalStation;

  SeatSelectBotton({
    required this.arrivalStation,
    required this.startStation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //ElevatedButton으로 미리 기능 구현 대비해서 만들어주기
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeatPage(
                startStation: startStation, arrivalStation: arrivalStation),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple, //보라색
          fixedSize: Size(400, 50), // 버튼 사이즈
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // 버튼 모서리 원형 20
          )),
      child: Text(
        '좌석 선택',
        style: TextStyle(
          color: Colors.white, // 글자 색
          fontSize: 18, // 글자 사이즈
          fontWeight: FontWeight.bold, // 글자 진하게
        ),
      ),
    );
  }
}
