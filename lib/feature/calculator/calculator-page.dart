import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  final double _padding = 16.0;
  final double _buttonFontSize = 24.0;

  final Color _primarySwatchColor = Colors.orange;
  final Color _titleAppBarColor = Colors.white;
  final Color _textColorWhite = Colors.white;
  final Color _buttonColorWhite = Colors.white;
  final Color _buttonHighlightColor = Colors.grey[800];
  final Color _buttonColorGrey = Colors.grey[500];

  int valueA;
  int valueB;
  String operator;
  var sbValue = new StringBuffer();

  @override
  void initState() {
    super.initState();
    sbValue.write("0");
    operator = "";
  }

  void appendValue(String str) => setState(() {
    bool isDoCalculate = false;
    String strValue = sbValue.toString();
    String lastCharacter = strValue.substring(strValue.length - 1);
    if (str == "0" &&
        (lastCharacter == "/" ||
            lastCharacter == "x" ||
            lastCharacter == "-" ||
            lastCharacter == "+")) {
      return;
    } else if (str == "0" && sbValue.toString() == "0") {
      return;
    } else if (str == "=") {
      isDoCalculate = true;
    } else if (str == "/" || str == "x" || str == "-" || str == "+") {
      if (operator.isEmpty) {
        operator = str;
      } else {
        isDoCalculate = true;
      }
    }

    if (!isDoCalculate) {
      if (sbValue.toString() == "0" && str != "0") {
        sbValue.clear();
      }
      sbValue.write(str);
    } else {
      List<String> values = sbValue.toString().split(operator);
      if (values.length == 2 &&
          values[0].isNotEmpty &&
          values[1].isNotEmpty) {
        valueA = int.parse(values[0]);
        valueB = int.parse(values[1]);
        sbValue.clear();
        int total = 0;
        switch (operator) {
          case "/":
            total = valueA ~/ valueB;
            break;
          case "x":
            total = valueA * valueB;
            break;
          case "-":
            total = valueA - valueB;
            break;
          case "+":
            total = valueA + valueB;
        }
        sbValue.write(total);
        if (str == "/" || str == "x" || str == "-" || str == "+") {
          operator = str;
          sbValue.write(str);
        } else {
          operator = "";
        }
      } else {
        String strValue = sbValue.toString();
        String lastCharacter = strValue.substring(strValue.length - 1);
        if (str == "/" || str == "x" || str == "-" || str == "+") {
          operator = "";
          sbValue.clear();
          sbValue
              .write(strValue.substring(0, strValue.length - 1) + "" + str);
          operator = str;
        } else if (str == "=" &&
            (lastCharacter == "/" ||
                lastCharacter == "x" ||
                lastCharacter == "-" ||
                lastCharacter == "+")) {
          operator = "";
          sbValue.clear();
          sbValue.write(strValue.substring(0, strValue.length - 1));
        }
      }
    }
  });

  void clearValue() => setState(() {
    operator = "";
    sbValue.clear();
    sbValue.write("0");
  });

  void deleteValue() => setState(() {
    String strValue = sbValue.toString();
    if (strValue.length > 0) {
      String lastCharacter = strValue.substring(strValue.length - 1);
      if (lastCharacter == "/" ||
          lastCharacter == "x" ||
          lastCharacter == "-" ||
          lastCharacter == "+") {
        operator = "";
      }
      strValue = strValue.substring(0, strValue.length - 1);
      sbValue.clear();
      sbValue.write(strValue.length == 0 ? "0" : strValue);
    }
  });

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
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10)
              ),
              height: 700 * (MediaQuery.of(context).size.width/450),
              width: 400 * (MediaQuery.of(context).size.width/450),
              child: Column(
                children: <Widget>[
                  Expanded(
                    key: Key("expanded_bagian_atas"),
                    flex: 1,
                    child: Container(
                      key: Key("expanded_container_bagian_atas"),
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.all(_padding),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          AutoSizeText(
                            sbValue.toString(),
                            style: Theme.of(context).textTheme.display2,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    key: Key("expanded_bagian_bawah"),
                    flex: 1,
                    child: Column(
                      key: Key("expanded_column_bagian_bawah"),
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "C",
                                    style: TextStyle(
                                        color: _primarySwatchColor,
                                        fontSize: _buttonFontSize),
                                  ),
                                  onPressed: () {
                                    clearValue();
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Icon(
                                    Icons.backspace,
                                    color: _buttonColorGrey,
                                  ),
                                  onPressed: () {
                                    deleteValue();
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "/",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("/");
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("7");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("8");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("9");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "x",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("x");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("4");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("5");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("6");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("-");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("1");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("2");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("3");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("+");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: RaisedButton(
                                  color: _buttonColorWhite,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                      color: _buttonColorGrey,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("0");
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  color: _primarySwatchColor,
                                  highlightColor: _buttonHighlightColor,
                                  child: Text(
                                    "=",
                                    style: TextStyle(
                                      color: _textColorWhite,
                                      fontSize: _buttonFontSize,
                                    ),
                                  ),
                                  onPressed: () {
                                    appendValue("=");
                                  },
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
            ),
          )
        ],
      ),
    );
  }
}
