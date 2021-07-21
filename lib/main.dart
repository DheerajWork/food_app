import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/global.dart';
import 'package:food_app/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {"cart": (context) => MyCart()},
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int grandTotal = 0;

  // ignore: non_constant_identifier_names
  // List<int> MyList = [
  //   1,12,3,25,5,21,57,28,9,10
  // ];

  int getGrandTotal() {
    grandTotal = 0;
    for (int i = 0; i < Global.cartList.length; i++) {
      grandTotal =
          grandTotal + int.parse(Global.cartList[i]["totalPrice"].toString());
      setState(() {});
    }
    return grandTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: Global.cartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${Global.cartList[index]["image"]}")
                              )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (Global.cartList[index]["itemCount"] != 1) {
                              Global.cartList[index]["itemCount"]--;
                              Global.cartList[index]["totalPrice"] =
                                  Global.cartList[index]["price"] *
                                      Global.cartList[index]["itemCount"];
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Center(
                              child: Text('-'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${Global.cartList[index]["itemCount"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Global.cartList[index]["itemCount"]++;
                            Global.cartList[index]["totalPrice"] =
                                Global.cartList[index]["price"] *
                                    Global.cartList[index]["itemCount"];

                            setState(() {});
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: Center(
                              child: Text('+'),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 30),
                              child: Text(
                                  '${Global.cartList[index]["totalPrice"]}'),
                            ))
                      ],
                    );
                  }),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    getGrandTotal().toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Back"))
            ],
          ),
        ),
      ),
    );
  }
}
