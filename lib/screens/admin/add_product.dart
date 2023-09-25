import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Include dependencies

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  var formatter = NumberFormat('###,###'); // Integer formatter ke bentuk ribuan
  int jumlahOrder = 1;
  int hargaItem = 99999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack( // Image dan Tombol quit
          children: [
            Container(
              child: Image(image: AssetImage("assets/pizza.jpg")),
            ),
            Container( // Floating button X disini
                padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                child: FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: Colors.white70,
                  child: Text(
                    "X",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ))
          ],
        ),
        Row( // Nama produk, deskripsi dan harga
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama Produk",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Deskripsi Tulis Disini",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.fromLTRB(5, 10, 20, 10),
                  child: Text(
                    "IDR " + formatter.format(hargaItem),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  )),
            )
          ],
        ),
        Container( // Divider
          padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Divider(
            thickness: 3,
          ),
        ),
        Align( // Text
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
            child: Text(
              "Additional Preferences (Optional) : ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding( // Textfield Area
          padding: EdgeInsets.all(10),
          child: TextField(
            maxLines: 5,
            textAlign: TextAlign.justify,
            decoration: InputDecoration(
                hintText: "Spicy lvl : 100",
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          ),
        ),
        Container( // Divider antara textfield dan button
          padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Divider(
            thickness: 3,
          ),
        ),
        Container( // Button remove dan add untuk produk
          padding: EdgeInsets.fromLTRB(40, 70, 40, 70),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.small(
                onPressed: () {
                  setState(() {
                    if (jumlahOrder > 0) {
                      jumlahOrder--;
                    }
                  });
                },
                foregroundColor: Colors.amber,
                backgroundColor: Colors.white,
                elevation: 3,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Icon(Icons.remove),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                  child: Text(
                    jumlahOrder.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )),
              FloatingActionButton.small(
                onPressed: () {
                  setState(() {
                    jumlahOrder++;
                  });
                },
                foregroundColor: Colors.amber,
                backgroundColor: Colors.white,
                elevation: 3,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
        Padding( // Button untuk tambah ke cart, modif di method dibawah untuk add to cart backend
          padding: EdgeInsets.all(15),
          child: addToCart(),
        ),
      ]),
    );
  }

  // Method return button untuk mengubah teks button bila jumlah = 0 atau jumlah > 0
  ElevatedButton addToCart() {
    if (jumlahOrder == 0) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          minimumSize: Size.fromHeight(50),
          elevation: 5,
        ),
        onPressed: () {},
        child: Text(
          "Back to Menu",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          minimumSize: Size.fromHeight(50),
          elevation: 5,
        ),
        onPressed: () {},
        child: Text(
          "Add to Basket - IDR " + formatter.format((hargaItem * jumlahOrder)),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      );
    }
  }
}
