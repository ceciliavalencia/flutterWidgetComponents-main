import 'package:flutter/material.dart';


class TablePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MyTable();
    
  }

}

class MyTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            children: [
              TableRow(
                children: [
                  CuadradoGrande(),
                  CuadradoMediano(),
                  CuadradoPequenio(),
                ]
              ),

              TableRow(
                children: [
                  CuadradoPequenio(),
                  CuadradoGrande(),
                  CuadradoMediano(),
                ]
              ),

              TableRow(
                children: [
                  CuadradoMediano(),
                  CuadradoPequenio(),
                  CuadradoGrande(),
                ]
              )
            ],
          ),
        )
      ),
      
    );
  }
}

class CuadradoGrande extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
        width: 70,
        height: 200,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.orange
        ),
    );
  }
}

class CuadradoMediano extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
        width: 70,
        height: 150,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.purpleAccent
        ),
    );
  }
}

class CuadradoPequenio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
        width: 70,
        height: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.greenAccent
        ),
    );
  }
}