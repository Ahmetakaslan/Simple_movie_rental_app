import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  String name;
  String image;
  double price;
  Detail(this.name, this.image, this.price);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          backgroundColor: Colors.red,
        ),
        body: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.minHeight),
            child: IntrinsicHeight(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                  children: [
                  Image.asset(widget.image),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    widget.price.toString() + " \u20BA",
                    style: TextStyle(fontSize: 30,color: Colors.blue),
                  ),
                  ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Colors.red) ,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("${widget.name} Kiralandı"),
                          duration: Duration(seconds: 1, milliseconds: 5),
                        ));
                      },
                      child: Text("Kirala"),),
                ]),
              ),
            ),
          ));
        }));
  }
}
