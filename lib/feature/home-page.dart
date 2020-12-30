import 'package:flutter/material.dart';
import 'package:math_app/feature/age/age-page.dart';
import 'package:math_app/feature/bangundatar/bangundatar-page.dart';

import 'calculator/calculator-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/bg_home.png",height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.purple,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20 * (MediaQuery.of(context).size.width/450),vertical: 20* (MediaQuery.of(context).size.width/450)),
                  // height: (145* (MediaQuery.of(context).size.width/450)) * (3.0* (MediaQuery.of(context).size.width/450)),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Colors.deepPurpleAccent,
                          Color(0xffb6a8cc)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return CalculatorPage();
                          }));
                        },
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(horizontal: 80 * (MediaQuery.of(context).size.width/450),vertical: 40 * (MediaQuery.of(context).size.width/450)),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            "KALKULATOR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24 * (MediaQuery.of(context).size.width/450)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return BangunDatarPage();
                          }));
                        },
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(horizontal: 80 * (MediaQuery.of(context).size.width/450),vertical: 40 * (MediaQuery.of(context).size.width/450)),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            "LUAS BANGUN DATAR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24 * (MediaQuery.of(context).size.width/450)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AgePage();
                          }));
                        },
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(horizontal: 80 * (MediaQuery.of(context).size.width/450),vertical: 40 * (MediaQuery.of(context).size.width/450)),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            "MENGHITUNG UMUR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24 * (MediaQuery.of(context).size.width/450)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
