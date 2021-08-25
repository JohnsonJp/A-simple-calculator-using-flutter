import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String equ="";
  bool e = false;
  String ans = "";
  bool an=false;
  String expression = "";
  var _size = 40.0;
  var c = Colors.black45;
  var l;
  String q="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$equ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,)),
                  Text("$ans",style: TextStyle(fontSize: _size,color: c,fontWeight: FontWeight.bold),)
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              color: Colors.black12,
                              height: MediaQuery.of(context).size.height/6,
                              child: MaterialButton(
                                child: Text("AC",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  setState(() {
                                    _size = 40;
                                    c = Colors.black45;
                                    equ="";
                                    ans="";
                                    e = false;
                                  });                                
                                },
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height/6,
                              color: Colors.black12,
                              child: MaterialButton(
                                child: Text("C",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                    if(equ.length==1){
                                      setState(() {
                                        c = Colors.black45;
                                        _size = 40;
                                        equ="";
                                        ans="";
                                      });                                     
                                    }else if(equ[(equ.length)-2].contains(new RegExp(r'[0-9]'))){
                                      setState(() {
                                        c = Colors.black45;
                                        _size = 40;
                                        equ=equ.substring(0, equ.length - 1);
                                        expression = equ;
                                        expression = expression.replaceAll('x', '*');
                                      });
                                      try{
                                        Parser p = Parser();
                                        Expression exp = p.parse(expression);
                                        ContextModel cm = ContextModel();
                                        ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                      }catch(e){
                                        ans = "Error";
                                      }
                                    }else{
                                      setState(() {
                                        c = Colors.black45;
                                        _size = 40;
                                        equ=equ.substring(0, equ.length - 1);
                                        expression = equ;
                                        expression = expression.replaceAll('x', '*');
                                        q=expression.substring(0, equ.length - 1);
                                      });
                                      try{
                                        Parser p = Parser();
                                        Expression exp = p.parse(q);
                                        ContextModel cm = ContextModel();
                                        ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                      }catch(e){
                                        ans = "Error";
                                      }

                                    }
                                },
                                ),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height/6,
                              color: Colors.black12,
                              child: MaterialButton(
                                child: Text("%",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  if(an==false){
                                    setState(() {
                                    an = false;
                                    equ=ans;
                                    c = Colors.black45;
                                    _size = 40;
                                    equ=equ+"%";
                                    expression = equ;
                                    expression = expression.replaceAll('x', '*');
                                    expression = expression.replaceAll('%', '/100');
                                  });
                                  }else{
                                    setState(() {
                                    c = Colors.black45;
                                    _size = 40;
                                    equ=equ+"%";
                                    expression=equ;
                                    expression = expression.replaceAll('x', '*');
                                    expression = expression.replaceAll('%', '/100');
                                  });
                                  }
                                  
                                  try{
                                    Parser p = Parser();
                                    Expression exp = p.parse(expression);

                                    ContextModel cm = ContextModel();
                                    ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                  }catch(e){
                                    ans = "Error";
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height/6,
                              color: Colors.black12,
                              child: MaterialButton(
                                child: Text("/",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                onPressed: (){
                                  if(an==true){
                                    setState(() {
                                    an = false;
                                    c = Colors.black45;
                                    _size = 40;
                                    equ=ans;
                                    equ=equ+"/";
                                  });
                                  }else{
                                    setState(() {
                                    c = Colors.black45;
                                    _size = 40;
                                    equ=equ+"/";
                                  });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    color: Colors.black12,
                                    height: MediaQuery.of(context).size.height/6,
                                    child: MaterialButton(
                                      child: Text("7",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"7";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("8",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"8";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                      ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("9",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"9";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("x",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        if(an==true){
                                          setState(() {
                                          an = false;
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=ans;
                                          equ=equ+"x";
                                        });
                                        }else{
                                          setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"x";
                                        });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    color: Colors.black12,
                                    height: MediaQuery.of(context).size.height/6,
                                    child: MaterialButton(
                                      child: Text("4",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"4";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("5",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"5";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                      ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("6",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"6";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("-",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        if(an==true){
                                          setState(() {
                                          an = false;
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=ans;
                                          equ=equ+"-";
                                        });
                                        }else{
                                          setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"-";
                                        });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    color: Colors.black12,
                                    height: MediaQuery.of(context).size.height/6,
                                    child: MaterialButton(
                                      child: Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          _size = 40;
                                          c = Colors.black45;
                                          equ=equ+"1";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          _size = 40;
                                          c = Colors.black45;
                                          equ=equ+"2";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                      ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("3",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          c = Colors.black45;
                                          _size = 40;
                                          equ=equ+"3";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("+",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        if(an==true){
                                          setState(() {
                                          an = false;
                                          _size = 40;
                                          c = Colors.black45;
                                          equ=ans;
                                          equ=equ+"+";
                                        });
                                        }else{
                                          setState(() {
                                          _size = 40;
                                          c = Colors.black45;
                                          equ=equ+"+";
                                        });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Row(
                            children: [
                              
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("0",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){setState(() {
                                          equ=equ+"0";
                                          c = Colors.black45;
                                          _size = 40;
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                        },
                                      ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text(".",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          _size = 40;
                                          c = Colors.black45;
                                          equ=equ+".";
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/6,
                                    color: Colors.black12,
                                    child: MaterialButton(
                                      child: Text("=",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                      onPressed: (){
                                        setState(() {
                                          an = true;
                                          c = Colors.black;
                                          _size = 50;
                                          expression = equ;
                                          expression = expression.replaceAll('x', '*');
                                        });
                                        try{
                                          Parser p = Parser();
                                          Expression exp = p.parse(expression);

                                          ContextModel cm = ContextModel();
                                          ans = '${exp.evaluate(EvaluationType.REAL, cm)}';
                                        }catch(e){
                                          ans = "Error";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}