// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:image_picker_login/setup.dart';
//
// import 'models/model.dart';
//
// enum LocalKey {
//   noteKey,
// }
//
// @immutable
// sealed class HiveService {
//   static const String dbName = "first_db";
//
//   static Box box = Hive.box(dbName);
//
//   Future<void> saveDate(List<NoteApp> notes, {required LocalKey key}) async {
//     List<String> stringList = notes.map((e) => jsonEncode(e.toJson())).toList();
//     await box.put(key.name, stringList);
//   }
//
//   Future<List<NoteApp>> loadDate({required LocalKey key}) async {
//     List<String> stringList = await box.get(key.name) ?? <String>[];
//     List<NoteApp> notes =
//         stringList.map((e) => NoteApp.fromJson(jsonDecode(e))).toList();
//     return notes;
//   }
//
//   Future<void> clearAll({required LocalKey key}) async {
//     await box.delete(key.name);
//   }
// }
//
// class NoteAppServices {
//   void noteAdd(NoteApp model) {
//     box.add(model);
//   }
//
//   void deleteNote(int index) {
//     box.deleteAt(index);
//   }
//
//   void updateNote(NoteApp model, int index) {
//     box.putAt(index, model);
//   }
// }
