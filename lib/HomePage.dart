import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slide_to_act/slide_to_act.dart';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
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
    _tabController = TabController(length: 2, vsync: this);
  }

  double _currentSliderValue = 20;

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
            Container(
              height: 20,
              alignment: Alignment.topCenter,
              // color: Colors.amber,
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Text('SLIPPAGE'),
                  Text('Details'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 180,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      side:
                          BorderSide(color: Color.fromARGB(18, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color.fromARGB(140, 38, 44, 47),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Slider(
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.blueGrey[100],
                        value: _currentSliderValue,
                        max: 100,
                        divisions: 100,
                        thumbColor: Colors.blueGrey,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      side:
                          BorderSide(color: Color.fromARGB(18, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Color.fromARGB(140, 38, 44, 47),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Rate',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '1 AVAX = 1.16 0KB',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Slippage tolerance',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '1,29%',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Estimated Fees ',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '0.076 ETH',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 70,
              // color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: SlideAction(
                  onSubmit: () {
                    // do something
                  },
                  // elevation: 10,
                  outerColor: Color.fromARGB(255, 38, 44, 47),
                  innerColor: Colors.blueAccent,
                  sliderButtonIconSize: 15,
                  height: 70,
                  sliderRotate: false,
                  // sliderButtonIconPadding: 16,
                  text: "Slide to Pay",
                  textStyle: TextStyle(
                    color: Colors.white38,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                  // borderRadius: 30,
                  sliderButtonYOffset: -5,
                  sliderButtonIcon: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.white60,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
