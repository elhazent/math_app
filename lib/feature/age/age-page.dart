import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:math_app/tools/base-function.dart';

class AgePage extends StatefulWidget {
  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {

  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime dateBirth;
  String umur = "-";
  String nextBirthday = "-";
  AgeDuration age;

  calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    age = Age.dateDifference(fromDate: birthDate, toDate: today, includeToDate: false);
    DateTime tempDate = DateTime(today.year, birthDate.month, birthDate.day);
    DateTime nextBirthdayDate = tempDate.isBefore(today)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;
    AgeDuration nextBirthdayDuration = Age.dateDifference(fromDate: today, toDate: nextBirthdayDate);
    setState(() {
      umur = age.toString();
      nextBirthday = nextBirthdayDuration.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset("assets/images/bg_home.png",height: MediaQuery.of(context).size.height,width:MediaQuery.of(context).size.width,fit: BoxFit.cover,),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Text(
                  "MENGHITUNG UMUR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  "Tanggal Lahir",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: ()async{
                    final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null && picked != selectedDate)
                      setState(() {
                        selectedDate = picked;
                        dateController.text = BaseFunction.milliToLongDate(selectedDate.millisecondsSinceEpoch);
                        dateBirth = selectedDate;
                      });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: dateController,
                      enabled: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Masukkan Tanggal Lahir",
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        calculateAge(dateBirth);
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
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          umur = "-";
                          nextBirthday = "-";
                          dateController.text = "";
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                        child: Text(
                          "HAPUS",
                          style: TextStyle(
                            color: Colors.purple
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Text(
                  "Umur Anda",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Text(
                    umur,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Ulang Tahun Selanjutnya",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                  child: Text(
                    nextBirthday,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.purple
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
