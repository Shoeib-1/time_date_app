// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeDate(),
    );
  }
}

class TimeDate extends StatefulWidget {
  const TimeDate({Key? key}) : super(key: key);

  @override
  State<TimeDate> createState() => _TimeDateState();
}

class _TimeDateState extends State<TimeDate> {
  //Dates
  String years = "";
  String month = "";
  String WeeksDay = "";
  String days = "";
  String end = "";
  String PAm = "Am";

  //Time
  int Hours = 0;
  String minu = "";
  String sec = "";

  ChangeYears() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        //Dates
        years = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        switch (month) {
          case "1":
            month = "January";
            break;

          case "2":
            month = "February";
            break;

          case "3":
            month = "March";
            break;

          case "4":
            month = "April";
            break;

          case "5":
            month = "May";
            break;

          case "6":
            month = "June";
            break;

          case "7":
            month = "July";
            break;

          case "8":
            month = "August";
            break;

          case "9":
            month = "September";
            break;

          case "10":
            month = "October";
            break;

          case "11":
            month = "November";
            break;
          default:
            month = "December";
        }
        days = DateTime.now().day.toString();
      });
      WeeksDay = DateTime.now().weekday.toString();
      switch (WeeksDay) {
        case "1":
          WeeksDay = "Monday";
          break;

        case "2":
          WeeksDay = "Tuesday";
          break;

        case "3":
          WeeksDay = "Wednesday";
          break;

        case "4":
          WeeksDay = "Thursday";
          break;

        case "5":
          WeeksDay = "Friday";
          break;
        case "6":
          WeeksDay = "Saturday";
          break;

        default:
          WeeksDay = "Sunday";
      }
      //Time
      Hours = DateTime.now().hour;
      if (Hours > 12) {
        Hours = Hours - 12;
        PAm = "Pm";
      }
      minu = DateTime.now().minute.toString();
      sec = DateTime.now().second.toString();
    });
  }

  OneAction() {
    Timer(Duration(seconds: 10), () {
      setState(() {
        end = "Thank you!";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChangeYears();
    OneAction();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          title: Text("Time & Date"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text("WELCOME 🌹",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Font")),
              ),
              SizedBox(height: 30),
              ClipRRect(
                child: Image.asset(
                  "assest/img/pexels-tom-swinnen-2249964.jpg",
                  width: 165,
                ),
                borderRadius: BorderRadius.circular(700),
              ),
              SizedBox(height: 60),
              Text("Today is $WeeksDay",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Font")),
              SizedBox(height: 25),
              Text("$month $days, $years",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Font")),
              SizedBox(
                width: 15,
              ),
              SizedBox(height: 25),
              Text(
                  "${Hours.toString().padLeft(2, "0")} : ${minu.padLeft(2, "0")} : ${sec.padLeft(2, "0")}  $PAm",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Font")),
              SizedBox(height: 60),
              Text("$end",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Font")),
            ],
          ),
        ),
      ),
    );
  }
}
