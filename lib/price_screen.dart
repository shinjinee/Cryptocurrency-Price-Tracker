import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'networking.dart';
import 'coin_data.dart';

const API_KEY = '8388A552-D494-4D2E-AC6A-C16A52F1A707';
const API_URL = 'https://rest.coinapi.io/v1/exchangerate';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String currency = 'INR';
  List<DropdownMenuItem<String>> currencyDropdown = [];
  int rate=0;

  void makeDropdownItems() {
    for (String x in currenciesList) {
      currencyDropdown.add(
        DropdownMenuItem<String>(
          child: Text(x),
          value: x,
        ),
      );
    }
  }

  void getData(String coin, String currency) async{
    String url = '$API_URL/$coin/$currency?apikey=$API_KEY';
    Networking networking = Networking(url);
    var data = await networking.getRate();
    setState(() {
      rate = data['rate'].toInt();
    });
    print (rate);
  }

  @override
  Widget build(BuildContext context) {
    currencyDropdown.clear();
    makeDropdownItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑  Crypto Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.red.shade800,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $rate $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.red.shade800,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $rate $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.red.shade800,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $rate $currency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.red.shade900,
            child: DropdownButton<String>(
              value: currency,
              items: currencyDropdown,
              onChanged: (value) {
                setState(() {
                  currency = value!;
                  getData('BTC', currency);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
