
import 'package:flutter/material.dart';
import '../model.dart';
import 'graph.dart';
import 'matrix_screen.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:Scaffold(
        appBar: AppBar(
          title: Text("Challenge",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.production_quantity_limits,color: Colors.black,)),
              Tab(icon: Icon(Icons.auto_graph,color:Colors.black ,)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MatrixScreen(),
            GraphScreen(),
          ],
        )));
  }
}
