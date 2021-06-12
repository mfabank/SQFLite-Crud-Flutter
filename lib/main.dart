import 'package:flutter/material.dart';
import 'package:sqflite_crud/db/kelimelerDAO.dart';
import 'package:sqflite_crud/model/kelimeler.dart';

void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: KelimeEzber(),
    theme: ThemeData.dark(),
  ));
}

class KelimeEzber extends StatefulWidget {
  @override
  _KelimeEzberState createState() => _KelimeEzberState();
}

class _KelimeEzberState extends State<KelimeEzber> {


  Future<void> kelimeleriGoster() async {
    var liste = await KelimelerDAO().tumKelimeler();
    for(Kelimeler k in liste) {
      print("Türkçe Kelime : ${k.trKelime}");
      print("İngilizce Kelime : ${k.ingKelime}");
      print("Örnek Cümle : ${k.ornekCumle}");
      print("**********************");
    }
  }

  Future<void> ekle() async {
    await KelimelerDAO().kelimeEkle("silgi", "eraser", "I have an Eraser");
  }

  Future<void> sil() async {
    await KelimelerDAO().kelimeSil(3);
  }

  Future<void> guncelle() async {
    await KelimelerDAO().kelimeGuncelle(1, "kalem", "pencil", "I have a Pencil");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kelimeleriGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Console"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }
}
