import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
 
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result="0";
  String mainresult="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";
 buttonPressed(String text)
 {
   if(text=="CLR")
   {
     mainresult="0";
     result="0";
     num1=0;
     num2=0;
     operand="";
   }
   else if(text=="+"||text=="-"||text=="*"||text=="/"||text=="MOD")
   {
     num1=double.parse(result);
     operand=text;
      mainresult="0";
   }
   else if(text==".")
   {
     if(mainresult.contains("."))
     {
       return ;
     }
     else{
       mainresult=mainresult + text;
     }
   }
   else if(text=="=")
   {
     num2=double.parse(result);
     if(operand=="+")
     {
       mainresult=(num1+num2).toString();
     }
     if(operand=="-")
     {
       mainresult=(num1-num2).toString();
     }
     if(operand=="*")
     {
       mainresult=(num1*num2).toString();
     }
     if(operand=="/")
     {
       mainresult=(num1/num2).toString();
     }
     if(operand=="MOD")
     {
       mainresult=(num1%num2).toString();
     }

     num1=0;
     num2=0;
    operand="";
   }
   else 
   {
     mainresult=mainresult+text;
   }
   print(mainresult);
   setState(() {
     result=double.parse(mainresult).toStringAsFixed(2);
   });
 }
   Widget btn(String num)
   {
     return new  Expanded(
                child: new OutlineButton(
                padding: new EdgeInsets.all(24.0),
                 child: new Text(num,
                 style: TextStyle(
                   fontSize:20.0,
                   fontWeight:FontWeight.bold
                 ),

                 ),
                
                 onPressed:()=>
                   buttonPressed(num),   
               ),
             );
   }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: new Container(
       child: new Column(children:<Widget>[
        new  Container(
          alignment: Alignment.centerRight,
          padding: new EdgeInsets.symmetric(
            vertical:28.0,
            horizontal:12.0
          ),
          child: new Text(result,style: TextStyle(
            fontSize:43.0,
            fontWeight:FontWeight.bold
          ),)
          ),
         new Expanded(
           child: new Divider()
           ),
     new Column(
         children: <Widget>[
           new Row(
              children:[ 
            
             btn("CLR"),
              btn("MOD"),
               btn("."),
             btn("/"),
              ],
            ),
           new Row(
              children:[ 
             btn("7"),
             btn("8"),
             btn("9"),
             btn("*")
              ],
            ),
            new Row(
              children:[ 
             btn("4"),
             btn("5"),
             btn("6"),
             btn("-")
              ],
            ),
           new Row(
              children:[ 
             btn("1"),
             btn("2"),
             btn("3"),
             btn("+")
              ],
            ),
            new Row(
              children:[ 
             btn("0"),
             btn("=")
              ],
            ),
         ],
       )
       ],)
        
      ),
     
    );
  }
}
