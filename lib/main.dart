import 'package:flutter/material.dart';
import 'package:flutter_demo_01/firstView.dart';


void main() => runApp(new MyApp());


// 原 ios nav的那个区域
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Flutter demo",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Flutter first page',),

    );
  }
}


class MyHomePage extends StatefulWidget
{
  MyHomePage({Key key,this.title}) : super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  int _conter = 0;

  void _incrementCounter ()
  {
    setState(() {
      _conter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'hellow word'// 在积木上面的积木会覆盖掉积木下面的积木
        ),
      ),

      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushd the button this many times',
            )
            ,
            new Text(
              '$_conter',
              style: Theme.of(context).textTheme.display2,
            )
            ,
            // 相当于ios中添加 button添加事件
            new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder:
                (context) => new SimplePage()
                  )
                );// 响应式编程的好处，点击的时候方法自动执行。在底层是如何检测和查找用户的点击方法的 需要看底层代码。
              },
              child: new Text('点击我跳转到下一个页面', style: new TextStyle(fontSize: 26.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
      // 位置问题，位置是自动放到这里的，没有
      floatingActionButton: new FloatingActionButton(
        onPressed:_incrementCounter,
        tooltip: 'increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}





