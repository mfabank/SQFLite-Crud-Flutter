import 'package:sqflite_crud/db/dbhelper.dart';
import 'package:sqflite_crud/model/kelimeler.dart';

class KelimelerDAO {
  Future <List<Kelimeler>> tumKelimeler() async {
    var db = await DBHelper.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * From kelimelerim");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Kelimeler(satir["id"],satir["trKelime"],satir["ingKelime"],satir["ornekCumle"]);
    });
  }

  Future <void> kelimeEkle(String trKelime,String ingKelime,String ornekCumle) async {
    var db = await DBHelper.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["trKelime"] = trKelime;
    bilgiler["ingKelime"] = ingKelime;
    bilgiler["ornekCumle"] = ornekCumle;

    await db.insert("kelimelerim", bilgiler);
  }

  Future <void> kelimeSil(int id) async {
    var db = await DBHelper.veritabaniErisim();
    await db.delete("kelimelerim",where: "id = ?", whereArgs: [id]);
  }

  Future <void> kelimeGuncelle(int id,String trKelime,String ingKelime,String ornekCumle) async {
    var db = await DBHelper.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["trKelime"] = trKelime;
    bilgiler["ingKelime"] = ingKelime;
    bilgiler["ornekCumle"] = ornekCumle;
    await db.update("kelimelerim",bilgiler,where: "id = ?", whereArgs: [id]);
  }

}