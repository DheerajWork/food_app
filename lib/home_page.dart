import 'package:flutter/material.dart';
import 'package:food_app/global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> myItemList = [
    {
      "id": "1",
      "name": "Pizza",
      "price":150,
      "itemCount":1,
      "totalPrice" : 150,
      "image":
          "https://hungrito.com/wp-content/uploads/2019/09/thumbnail_large.jpg"
    },
    {
      "id": "2",
      "name": "Dabeli",
      "price":30,
      "itemCount":1,
      "totalPrice" : 30,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAcc1y1aGwWLPRuKtuOZJgqXE7VTmZADspgQ&usqp=CAU"
    },
    {
      "id": "3",
      "name": "Hot Dog",
      "price":70,
      "itemCount":1,
      "totalPrice" : 70,
      "image": "https://media.smallbiztrends.com/2020/09/hot-dog-franchise.png"
    },
    {
      "id": "4",
      "name": "Vada-pav",
      "price":50,
      "itemCount":1,
      "totalPrice" : 50,
      "image":
          "https://static.toiimg.com/photo/msid-76973747/76973747.jpg?142445"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Text(
                      "Foods",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: myItemList.length, itemBuilder: (BuildContext context, int index){
                          return MyItems(
                            onTap: (){
                              Global.cartList.add(myItemList[index]);
                              setState(() {
                                print("Add ${Global.cartList}");
                              });
                            },
                            img: myItemList[index]["image"],
                            name: myItemList[index]["name"],
                            price: myItemList[index]["totalPrice"],
                          );
                    })),
                SizedBox(
                  height: 10,
                ),
                // ignore: deprecated_member_use
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ignore: deprecated_member_use
                 ElevatedButton(onPressed: (){
                   Navigator.of(context).pushNamed('cart');
                   print('Add Successful');
                 }, child: Text('My Cart'))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyItems extends StatelessWidget {
  final String? img;
  final VoidCallback ?onTap;
  final int ?price;
  final String ?name;

  const MyItems({Key? key, this.img, this.onTap, this.price, this.name}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      fit: BoxFit.cover, image: NetworkImage(img!))),
            ),
            Column(
              children: [
                Text(name!),
                Text(price.toString())
              ],
            ),
            ElevatedButton(onPressed: onTap, child: Text("Add To Cart")),
          ],
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
