import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String startStation;
  final String arrivalStation;

  SeatPage({
    required this.arrivalStation,
    required this.startStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  List<bool> seatSelected = List.generate(80, (_) => false); //좌석 상태를 저장

  Color getSeatColor(int index) {
    //좌석 선택 색상을 변경해주기
    return seatSelected[index] ? Colors.purple : Colors.grey[300]!;
  }

  void seatSelection(int index) {
    //좌석 선택 상태 변경해주기
    setState(() {
      seatSelected[index] = !seatSelected[index];
    });
  }

  String getSeatLabel(int index) {
    //좌석 번호를 '3-A' 형태로 바꾸기
    int row = index ~/ 4 + 1;
    String col = ['A', 'B', 'C', 'D'][index % 4];
    return '$row-$col';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //앱바
        title: Text('좌석 선택'),
      ),
      body: Padding(
        //출발역 도착역
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.startStation, //TODO HomPage에서 고른 값 받아와 넣어주기
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 30,
                  ),
                ),
                SizedBox(width: 50),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
                SizedBox(width: 50),
                Text(
                  widget.arrivalStation, //TODO HomPage에서 고른 값 받아와 넣어주기
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 30,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              //좌석 선택 상태창
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(width: 4),
                Text('선택됨'),
                SizedBox(width: 30),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(width: 4),
                Text('선택안됨'),
              ],
            ),
            Row(
              //ABCD 좌석 표
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatName('A'),
                seatName('B'),
                seatName(''),
                seatName('C'),
                seatName('D'),
              ],
            ),
            Expanded(
              //좌석 선택 리스트
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, rowCount) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        seatSelecectBox(rowCount * 4),
                        SizedBox(
                          width: 4,
                        ),
                        seatSelecectBox(rowCount * 4 + 1),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            '${rowCount + 1}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        seatSelecectBox(rowCount * 4 + 2),
                        SizedBox(
                          width: 4,
                        ),
                        seatSelecectBox(rowCount * 4 + 3),
                      ],
                    ),
                  );
                },
              ),
            ),
            elevatedButton(),
          ],
        ),
      ),
    );
  }

  ElevatedButton elevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
      ),
      onPressed: () {
        List<String> selectedSeat = [];
        for (int i = 0; i < seatSelected.length; i++) {
          if (seatSelected[i]) {
            selectedSeat.add(getSeatLabel(i)); // 좌석번호
          }
        }
        if (selectedSeat.isEmpty) {
          return; //선택된 좌석이 없을시
        }

        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('예매 하시겠습니까?'),
            content: Text('좌석: ${selectedSeat.join(' , ')}'),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  '취소',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
                onPressed: () {
                  Navigator.pop(context); // 취소 선택시 창닫기
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  '확인',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context); //창닫기
                  Navigator.pop(context); //HomePage로 보내기
                },
              )
            ],
          ),
        );
      },
      child: Text(
        '예매 하기',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget seatSelecectBox(int index) {
    //좌석선택 박스
    return GestureDetector(
      onTap: () => seatSelection(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: getSeatColor(index), borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Container seatName(var seatNumber) {
    //시트 이름
    //seatName 함수
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text('$seatNumber'),
    );
  }
}
