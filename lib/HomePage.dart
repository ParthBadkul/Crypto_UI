import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/Post.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String stringResponse = "";
Map mapRespone = {};
Map data = {};

class _HomePageState extends State<HomePage> {
  @override
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse('http://139.59.57.191:5000/user/getCryptoList'));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapRespone = json.decode(response.body);
        // data = mapRespone['data'];
        // print(data);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicall();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 38, 44, 47),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 5),
              // padding: EdgeInsets.all(5),

              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              // color: Colors.amber,
              padding: EdgeInsets.all(5),
              child: Text(
                "Swap ETH",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(5),
              child: Text(
                "Ethereum Mainnet",
                style: TextStyle(
                  color: Colors.white54,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 300,
              // color: Colors.amber,
              child: Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white24),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      // borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 38, 44, 47),
                      height: 100,
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      mapRespone['data'][1]['icon'].toString()),
                                ),
                              ),
                              Spacer(),
                              Container(
                                // padding: EdgeInsets.only(left: 10),
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Balance : 0",
                                  style: TextStyle(
                                    color: Colors.white38,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '${mapRespone['data'][1]['code']} ▼',
                              style: TextStyle(
                                color: Colors.white,
                                // letterSpacing: 0.2,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(top: 5, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '₹ ${mapRespone['data'][1]['price']}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    // letterSpacing: 0.2,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    '₹ 0.00',
                                    style: TextStyle(
                                      color: Colors.white30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white24),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        // borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(178, 38, 44, 47),
                        height: 100,
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        mapRespone['data'][2]['icon']
                                            .toString()),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  // padding: EdgeInsets.only(left: 10),
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Balance : 0",
                                    style: TextStyle(
                                      color: Colors.white38,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                '${mapRespone['data'][2]['code']} ▼',
                                style: TextStyle(
                                  color: Colors.white,
                                  // letterSpacing: 0.2,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(top: 5, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₹ ${mapRespone['data'][2]['price']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      // letterSpacing: 0.2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    padding: EdgeInsets.only(top: 6),
                                    child: Text(
                                      '₹ 0.00',
                                      style: TextStyle(
                                        color: Colors.white30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    right: 20,
                    left: 30,
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(253, 20, 131, 221),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.swap_vert_sharp,
                          size: 32,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
