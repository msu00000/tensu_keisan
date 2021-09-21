import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
        theme: ThemeData(
          brightness: Brightness.light,
        ),
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
    _Home createState() => _Home();
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {

  int _result = 0;

  final size = MediaQuery.of(context).size;
    //final padding = MediaQuery.of(context).padding;
    //var maxHeight = size.height - padding.top - padding.bottom;

    // アプリ描画エリアの縦サイズを取得
    // if (Platform.isAndroid) {
    //   maxHeight = size.height - padding.top - kToolbarHeight;
    // } else if (Platform.isIOS) {
    //   maxHeight = size.height - padding.top - padding.bottom - 22;
    // }

    // 組み合わせ
    //final resultAreaHeight = maxHeight * (30 / 100);
    // // 式別
    // final shikibetsuAreaHeight = maxHeight * (10 / 100);
    // // 方式
    // final hoshikiAreaHeight = maxHeight * (15 / 100);
    // 馬番
    //final orderAreaHeight = maxHeight * (70 / 100);

    // final TextEditingController _categoryNameController =
    //       new TextEditingController(text: '0');

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Caption(context, '組み合わせ'),
            Expanded(
              flex: 1,
              child:Container(
                alignment: Alignment.bottomRight,
                //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                width: size.width,
                //height: resultAreaHeight,
               child: Text(
                 '$_result',
                 style: Theme.of(context).textTheme.headline2, 
               ),
 
                // child: TextFormField(
                //   style: Theme.of(context).textTheme.headline2, 
                //   textAlign: TextAlign.right,
                //   controller: _categoryNameController,
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //      filled: true,
                //      enabled: false, 
                //      //fillColor: const Color(0xff005dff),
                //     //hintText: '0',
                //       suffixIcon: IconButton(
                //         onPressed: () =>
                //             _categoryNameController.clear(),
                //         icon: Icon(Icons.clear),
                //       )
                //     ),
                //   ),
              ),
            ),
          
            Expanded(
              flex: 2,
              child:Container(
                //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                width: size.width,
                child:Column(
                  children: <Widget>[
                    Caption(context, '式別'),
                    Row(
                      children: <Widget>[
                        InputButton(context, '馬単'),
                        InputButton(context, '馬連'),
                        InputButton(context, 'ﾜｲﾄﾞ'),
                        InputButton(context, '3連単'),
                        InputButton(context, '3連複'),
                        InputButton(context, 'WIN5'),
                      ],
                    ),
                    Caption(context, '方式'),
                    Row(
                      children: <Widget>[
                        InputButton(context, 'ながし'),
                        InputButton(context, 'ﾎﾞｯｸｽ'),
                        InputButton(context, 'ﾌｫｰﾒｰｼｮﾝ'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        InputButton(context, '軸1'),
                        InputButton(context, '軸2'),
                        InputButton(context, 'ﾏﾙﾁ'),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer()
                      ],
                    ),
                    ] 
                  ),
              )
            ),
            Expanded(
              flex: 5,
              child:Container(
                //decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                width: size.width,
                //height: orderAreaHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Caption(context, '1着'),
                    NumberButtons(context),
                    Caption(context, '2着'),
                    NumberButtons(context),
                    Caption(context, '3着'),
                    NumberButtons(context),
                    Caption(context, '4着'),
                    NumberButtons(context),
                    Caption(context, '5着'),
                    NumberButtons(context),
                  ]
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Caption extends Container {
  Caption(BuildContext context, String caption)
  :super(
      width: double.infinity,
      child:Text(caption, textAlign: TextAlign.left, style: Theme.of(context).textTheme.caption)
    );
}

class InputButton extends Expanded {
  InputButton(BuildContext context, String caption)
  :super(
    child:Container(
      margin: EdgeInsets.all(2),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(0, 0, 0, 0)),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: _calc,
            child:Text(
            caption,
            style:TextStyle(fontSize: 20, ),
            // strutStyle: StrutStyle(
            //   fontSize: 20.0,
            //   height: 1.6,
            // )
            //style: Theme.of(context).textTheme.caption,
          ),
        )
    )
  );
}

void _calc() {
  
}


class NumberButtons extends Column {
  NumberButtons(BuildContext context)
  :super(
  children: <Widget>[
      Row(
    		children: <Widget>[
          for (int i = 1; i < 10; i++)
          Expanded(
            child:NumberButton(context, i)
          )
        ],
      ),
      Row(
    		children: <Widget>[
          for (int i = 10; i < 19; i++)
          Expanded(
            child:NumberButton2(context, i)
          )
        ],
      )
    ]
  );
}

class NumberButton2 extends Container {
  NumberButton2(BuildContext context, int number)
	:super(
		margin: EdgeInsets.all(2),
		decoration: BoxDecoration(
			borderRadius: BorderRadius.circular(5),
			color: Colors.grey[600], 
			//border: Border.all(color: Colors.blue)
    ),
		child: Center(
			child:Text(
				'$number',
				style:TextStyle(fontSize: 20,),
			),
		)
	);
}

class NumberButton extends Container {
  NumberButton(BuildContext context, int number)
	:super(
    margin: EdgeInsets.all(2),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(0, 0, 0, 0)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () {print('Pressed');},
          child:Text(
            '$number',
            style:TextStyle(fontSize: 20, backgroundColor: Colors.black),
            //style: Theme.of(context).textTheme.caption,
          ),
      )
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
