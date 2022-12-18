import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_18_12_2022/pages/detail.dart';
import 'package:flutter_application_18_12_2022/pages/film.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Film>> data() async {
    List<Film> list = [];
    list = Ekle(list);

    return list;
  }

  List<Film> Ekle(List<Film> list) {
    list = [
      new Film(1, "Esaretin Bedeli", "images/indir.jpg", 30),
      new Film(2, "Yıldızlar Arası", "images/indir2.jpg", 19.5),
      new Film(3, "Başlangıç", "images/indir3.jpg", 12.4),
      new Film(4, "Bir zamanlar anadoluda", "images/indir4.jpg", 20.4),
      new Film(5, "Demir yumruk", "images/indir5.jpg", 30),
      new Film(6, "Yenilmezler 3", "images/indir6.jpg", 25),
      new Film(7, "Django", "images/indir7.jpg", 15.5),
    ];
    return list;
    /**
    * 
     Film a = new Film(1, "Esaretin Bedeli", "images/indir.jpg", 30);
    Film b = new Film(2, "Yıldızlar Arası", "images/indir2.jpg", 19.5);
    Film c = new Film(3, "Başlangıç", "images/indir3.jpg", 12.4);
    Film d = new Film(4, "Bir zamanlar anadoluda", "images/indir4.jpg", 20.4);
    Film e = new Film(5, "Demir yumruk", "images/indir5.jpg", 30);
    Film f = new Film(6, "Yenilmezler 3", "images/indir6.jpg", 25);
    Film g = new Film(7, "Django", "images/indir7.jpg", 15.5);
    */
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Filmeler"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: data(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var dataList = snapshot.data;
            return GridView.builder(
              itemCount: dataList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2/ 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(
                              dataList[index].name,dataList[index].image, dataList[index].price),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(side: BorderSide(width: 1),borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        SizedBox(
          
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(dataList![index].image),
                            )),
                        Spacer(),
                        Text(
                          dataList[index].price.toString() + " \u20BA",
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                      ]),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
