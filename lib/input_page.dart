import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(color: Color(0xFF292B4E)),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: ReusableCard(color: Color(0xFF292B4E)),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(color: Color(0xFF292B4E)),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(color: Color(0xFF292B4E)),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: ReusableCard(color: Color(0xFF292B4E)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
      ),
    );
  }
}