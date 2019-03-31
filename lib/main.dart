import 'package:flutter/material.dart';
import 'package:movie/pages/home/Home.dart';
//import 'package:movie/components/search/SearchFiled.dart';
// import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {

//     // final seachController = TextEditingController();

//     Column buildButtonColumn(IconData icon, String label) {
//       Color color = Colors.green;

//       return new Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           new Icon(icon, color: color),
//           new Container(
//             margin: const EdgeInsets.only(top: 8.0),
//             child: new Text(
//               label,
//               style: new TextStyle(
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.w400,
//                 color: color,
//               ),
//             ),
//           ),
//         ],
//       );
//     }

//     Widget titleSection = new Container(
//       padding: const EdgeInsets.all(32.0),
//       child: new Row(
//         children: [
//           new Expanded(
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 new Container(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: new Text(
//                     'Onschinen Lake Campground',
//                     style: new TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 new Text(
//                   'Kandersteg, Switzerland',
//                   style: new TextStyle(
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           new Icon(
//             Icons.star,
//             color: Colors.red[500],
//           ),
//           new Text('41'),
//         ],
//       ),
//     );

//     Widget textSection = new Container(
//       padding: const EdgeInsets.all(32.0),
//       child: new Text(
//         '''
//          lsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
//         ''',
//         textAlign: TextAlign.justify,
//       ),
//     );

//     Widget buttonSection = new Container(
//       child: new Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           buildButtonColumn(Icons.call, 'CALL'),
//           buildButtonColumn(Icons.near_me, 'ROUTE'),
//           buildButtonColumn(Icons.share, 'SHARE'),
//         ],
//       ),
//     );


//     void onInputChange(String str) {

//     }


//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primaryColor: Colors.green
//       ),
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: SearchFiled(label: "首页", onChange: onInputChange,),
//           backgroundColor: Colors.green,
//         ),
//         body: new ListView(
//           children: [
//             new Image.asset(
//               'assets/images/bgimg.jpeg',
//               width: 600.0,
//               height: 240.0,
//               fit: BoxFit.cover,
//             ),
//             titleSection,
//             buttonSection,
//             textSection,
//           ],
//         ),
//       )
//     );
//   }
// }

class MyApp extends StatelessWidget {

  @override
  Widget build (BuildContext context) {

    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home:new Home(),
    );
  }
}
