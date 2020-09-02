import 'dart:convert';

import 'package:flutter/material.dart';

import 'Class/Data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Data> data=List();
  bool Loading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromAssets();
  }

  void changeState(){
    if(mounted){
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return item(data[index]);
              }
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Visibility(
                visible: Loading,
                child: CircularProgressIndicator()
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getDataFromAssets()async{
    var list=json.decode(await DefaultAssetBundle.of(context).loadString('assets/json/data.json')) as List;
    for(int i=0;i<list.length;i++){
      data.add(Data.fromJson(list[i]));
    }
    Loading=false;
    changeState();
  }

  Widget item(Data data) {
    return Container(
      padding: EdgeInsets.all(10).copyWith(bottom: 0),
      child: Text(data.tradeCode),
    );
  }
}

