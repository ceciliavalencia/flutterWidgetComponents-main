import 'package:flutter/material.dart';


class OpacityPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MiPagina();
    
  }

}

class MiPagina extends StatefulWidget {
  const MiPagina({
    Key key,
  }) : super(key: key);

  @override
  State<MiPagina> createState() => _MiPaginaState();
}

class _MiPaginaState extends State<MiPagina> {

  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity Animation'),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 50,
          children: <Widget>[
            Cuadrado(1),
            Cuadrado(opacity),
            Cuadrado(1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.opacity),
        onPressed: () {
          setState(() {
            opacity = (opacity == 1) ? 0.5 : 1;
          });
        },
      ),
    );
  }
}

class Cuadrado extends StatelessWidget {

  final double opacity;

  Cuadrado(this.opacity);

  @override
  Widget build(BuildContext context) {
    
    return AnimatedOpacity(
      duration: Duration( milliseconds: 500 ),
      curve: Curves.easeOut,
      opacity: opacity,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.orange
        ),
      ),
    );
  }
}