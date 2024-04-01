

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isbuttom = true;
  var displayExOh = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  int exScore = 0;
  int ohScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player X    ", style: myTextStyle,),
                          Text("${exScore}", style: myTextStyle,)
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player O  ", style: myTextStyle,),
                          Text("${ohScore}", style: myTextStyle,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            tabButton(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade600)
                            ),
                            child: Center(child: Text(
                              displayExOh[index], style: TextStyle(
                                color: Colors.white, fontSize: 40),)),

                          ));
                    }),
              ),
              Expanded(
                child: Container(

                ),
              ),

            ],
          ),
        )


    );
  }

  void winControl() {
    if (displayExOh[0] == displayExOh[1] && displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != " ") {
      _showTheWinDiolag(displayExOh[0]);
    }
    if (displayExOh[3] == displayExOh[4] && displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != " ") {
      _showTheWinDiolag(displayExOh[3]);
    }
    if (displayExOh[6] == displayExOh[7] && displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != " ") {
      _showTheWinDiolag(displayExOh[6]);
    }
    if (displayExOh[0] == displayExOh[3] && displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != " ") {
      _showTheWinDiolag(displayExOh[0]);
    }
    if (displayExOh[1] == displayExOh[4] && displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != " ") {
      _showTheWinDiolag(displayExOh[1]);
    }
    if (displayExOh[2] == displayExOh[5] && displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != " ") {
      _showTheWinDiolag(displayExOh[2]);
    }
    if (displayExOh[2] == displayExOh[4] && displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != " ") {
      _showTheWinDiolag(displayExOh[2]);
    }
    if (displayExOh[0] == displayExOh[4] && displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != " ") {
      _showTheWinDiolag(displayExOh[0]);
    }

    else if(filledBoxes ==9){
      _showTheAgainDiolag();
    }
  }

  void _showTheAgainDiolag(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
      return AlertDialog(

        title: Text("All space filled "),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade600),
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
          }, child: Text("Again",style: myTextStyle))
        ],
      );
    });
  }
  void _showTheWinDiolag(String winner) {
    showDialog(context: context,
        barrierDismissible:  false,

        builder: (BuildContext context) {
      return AlertDialog(
        title: Text("winner " + winner),
        actions: [
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade600),
              onPressed: (){
            _clearBoard();
            Navigator.of(context).pop();
            filledBoxes =0;
          }, child:Text("Again",style: myTextStyle,))
        ],
      );
    });
    if (winner == "X") {
      exScore += 1;
    }
    else if (winner == "O") {
      ohScore += 1;
    }

  }
  void tabButton(int index){
    setState(() {

      if (isbuttom && displayExOh[index] == " ") {
        displayExOh[index] = "O";
        isbuttom = false;
        filledBoxes += 1;
      }
      else if (!isbuttom && displayExOh[index] == " ") {
        displayExOh[index] = "X";
        isbuttom = true;
        filledBoxes += 1;
      }
      winControl();

    });
  }
  void _clearBoard(){

    setState(() {
      displayExOh = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
    });
  }
}


