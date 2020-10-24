import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }

}



class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {


  var balance = 200;
  var text = "";
//  var text = "Balance "+"$balance"+" tk";


  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Not enough Balace'));
    Scaffold.of(context).showSnackBar(snackBar);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Balance Page"),
      ),

      body: Builder(
        builder: (context) =>
         Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(text),



                RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: (){

                    setState(() {
//                      balance = 100;
                      text = "Balance "+"$balance"+" tk";
                    });

                    // _displaySnackBar(context);
                  },
                  child: Text("Show Balance"),
                ),



                RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: (){

                    if(balance<30){
                       _displaySnackBar(context);
                    }else{
                      setState(() {
                        balance = balance - 20;
                        text = "Balance "+"$balance"+" tk";



                      });
                    }




                   // _displaySnackBar(context);
                  },
                  child: Text("Buy"),
                ),





              ],
            ),
          ),
        ),
      ),


    );
  }
}


