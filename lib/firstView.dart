import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimplePage extends StatefulWidget {
  @override
  _SimplePageState createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          '发布成功',
          style: new TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
        ),

        leading: IconButton(
            icon: new Image.asset("assets/images/nav_close.png"),
            onPressed:(){
              Navigator.maybePop(context);
            }
        ),
      ),
      /// line 2-5 
      body: new SamplePageContent(),
    );
  }
}

class SamplePageContent extends StatefulWidget {
  @override
  _SamplePageContentState createState() => _SamplePageContentState();
}

class _SamplePageContentState extends State<SamplePageContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top:40),
      child: new Column(
        children: <Widget>[
          /// line 2
          new Row(
           children: <Widget>[
             new Container(
               width: 52,
               height: 52,
               margin: const EdgeInsets.only(left: 16.0),
               child: new CircleAvatar(
                 backgroundImage: new AssetImage("assets/images/avatar2.png"),
               ),
             ),

             new Container(
               margin: const EdgeInsets.only(left: 10.0),
               height: 48.0,
               child: new Stack(
                 children: <Widget>[
                   new Image.asset("assets/images/publish_chat_box.png"),
                   new Positioned(
                     left: 20,
                       /// 总体高度48，上 14 字体 14 下 48 - 28 = 20
                       top: 14,
                       child: new Text(
                         '张老师发布了一个任务',
                         style: new TextStyle(
                           fontSize: 14,
                           color: Colors.black,
                         ),
                   ),)
                 ],
               ),
             )
           ],
          ),

          /// Line 3
          new Container(
            margin: const EdgeInsets.fromLTRB(6.0, 24.0, 6.0, 24.0),// 和最外面的距离
            child: new RoundInnerSquareBox(
              child: new Container(// 里面绿色的容器
                padding: const EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 12.0),
                width: double.infinity,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "Unit 1 Lession 3 About ...",
                      style:new TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Round",
                        color: Colors.white,
                      ),
                    ),

                    new Container(
                      margin: const EdgeInsets.only(top: 5.0,bottom: 12.0),
                      child: new Image.asset("assets/images/publish_work_line.png"),
                    ),

                    new Wrap(
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        new WorkTotalItem(
                          title:"课文跟读 12",
                        ),
                        new WorkTotalItem(
                          title:"课文跟读 12",
                        ),
                        new WorkTotalItem(
                          title:"课文跟读 12",
                        ),
                        new WorkTotalItem(
                          title:"课文跟读 12",
                        )
                        ,
                      ],
                    )
                  ],
                ),
            ),),
          ),
        ],
      ),
    );
  }
}

class RoundInnerSquareBox extends StatelessWidget
{
  static const double gap = 12.0;
  // 相当于构造方法吧
  RoundInnerSquareBox({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ClipRRect(
      borderRadius: const BorderRadius.all(const Radius.circular(16.0)),
      child: new Container(
        color: const Color(0xFFF0D5A9),// 边框的颜色
        padding: const EdgeInsets.all(gap),
        child: new Container(
          color: const Color(0xFF3C594E),
          child: child,
        ),
      ),
    );//带有圆角的 框
  }

}
// 有点像ios 的label label 的参数直接系统封装好的，这个要自己写
class WorkTotalItem extends StatelessWidget
{
  final String title;
  /// 为啥 构造方法要加上一个 中括号呢？
  WorkTotalItem({this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return new Container(
        padding: EdgeInsets.all(6.0),
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        )

      );
  }
}
