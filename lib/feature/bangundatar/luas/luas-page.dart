import 'package:flutter/material.dart';
import 'package:math_app/tools/triagle.dart';
import 'dart:math' as math;
import "dart:math" show pi;

class LuasPage extends StatefulWidget {
  int codeBangunDatar;
  LuasPage({@required this.codeBangunDatar});
  @override
  _LuasPageState createState() => _LuasPageState();
}

class _LuasPageState extends State<LuasPage> {

  TextEditingController persegiController = TextEditingController();
  TextEditingController segitigaAlasController = TextEditingController();
  TextEditingController segitigaTinggiController = TextEditingController();
  String hasil = "-";
  int $Pi = 0x03A0;

  calculateLuasPersegi(String sisi){
    int result = int.parse(sisi)*int.parse(sisi);
    setState(() {
      hasil = result.toString();
    });
  }

  calculateLuasLingkaran(String jarijari){
    double result = math.pi * int.parse(jarijari)*int.parse(jarijari);
    setState(() {
      hasil = result.toString();
    });
  }

  calculateLuasSegitiga(String alas,String tinggi){
    double result = 0.5 * int.parse(alas)*int.parse(tinggi);
    setState(() {
      hasil = result.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset("assets/images/bg_home.png",height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
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
          widget.codeBangunDatar == 0?Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 2)
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "S",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "S",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rumus : L = S",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: persegiController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    onSubmitted: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Masukkan Nilai Sisi",
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    calculateLuasPersegi(persegiController.text);
                    print("kdjfalks");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                    child: Text(
                      "HITUNG",
                      style: TextStyle(
                          color: Colors.purple
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Text(
                    hasil,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                hasil != "-"?Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jawab : ",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : S x S",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : ${persegiController.text} x ${persegiController.text}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : $hasil",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ):SizedBox(),
              ],
            ),
          ):SizedBox(),
          widget.codeBangunDatar == 1?Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: -math.pi/2,
                          child: ClipPath(
                            child: Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                            ),
                            clipper: CustomClipPath(),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          "T",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "A",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Text(
                    "Rumus : L = 1/2 x A x T",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: segitigaAlasController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    onSubmitted: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Masukkan Nilai Alas",
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: segitigaTinggiController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    onSubmitted: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Masukkan Nilai Tinggi",
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    calculateLuasSegitiga(segitigaAlasController.text,segitigaTinggiController.text);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                    child: Text(
                      "HITUNG",
                      style: TextStyle(
                          color: Colors.purple
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Text(
                    hasil,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                hasil != "-"?Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jawab : ",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : 1/2 x A X T",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : 1/2 x ${segitigaAlasController.text} x ${segitigaTinggiController.text}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : $hasil",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ):SizedBox(),
              ],
            ),
          ):SizedBox(),
          widget.codeBangunDatar == 2?Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white,width: 2),
                                shape: BoxShape.circle
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 45,
                              child: Column(
                                children: [
                                  Text(
                                    "r",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24
                                    ),
                                  ),
                                  Container(
                                    height: 2,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rumus : L = ${String.fromCharCodes([$Pi,])} x r",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: persegiController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    onSubmitted: (s){
                      if (s == null || s == ""){
                        hasil = "-";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Masukkan Nilai Jari-jari",
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    calculateLuasLingkaran(persegiController.text);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                    child: Text(
                      "HITUNG",
                      style: TextStyle(
                          color: Colors.purple
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Text(
                    hasil,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                hasil != "-"?Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jawab : ",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : ${String.fromCharCodes([$Pi,])} x r x r",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : ${math.pi} x ${persegiController.text} x ${persegiController.text}",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        "L : $hasil",
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),
                ):SizedBox(),
              ],
            ),
          ):SizedBox(),

        ],
      ),
    );
  }
}
