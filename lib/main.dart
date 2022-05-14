import 'package:bingo/number_box.dart';
import 'package:bingo/score_board.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var numbers = List.generate(25, (index) => index).toList()..shuffle();
  var l = [1,2,3,4];
  late Map<int, bool>  boxes ;

  bool changePressed(int i)
  {
    boxes.update(i, (value) => true);
    print("boxes : $boxes");
    return true;
  }
  @override
  Widget build(BuildContext context) {
    boxes = {for(var v in numbers) v:false};
   
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("BINGO!"),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Container(
            padding: const EdgeInsets.all(10),
            child: ScoreBoard(
              scoreText: "Your Score",
              borderColor: const Color.fromARGB(44, 230, 115, 8),
              ),
           ),
           Container(
            padding: const EdgeInsets.all(10),
            child: ScoreBoard(
              scoreText: "opponent Score",
              borderColor: const Color.fromARGB(44, 230, 115, 8),
              ),
           ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: GridView.count(
            shrinkWrap: true,
                 crossAxisCount: 5,
                children: boxes.entries.map((e) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: NumberBox(count: e.key, pressed: e.value, changePressed: changePressed,),
                )).toList()
              ),
        ),
      ],) 
      );
  }
}
