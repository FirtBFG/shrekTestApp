import 'package:flutter/material.dart';
import 'package:shrek_app/app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  runApp(App());
}

class DBWidgetModel {
  DBWidgetModel() {
    Hive.initFlutter();
  }
  void reg(login, password) async {
    // if (!Hive.isAdapterRegistered(0)) {
    //   Hive.registerAdapter(UserAdapter());
    // }
    var box = await Hive.openBox<dynamic>('authBox');
    await box.put(login, password);
    //ignore: avoid_print
    print(box.values);
    box.close();
  }

  Future<bool> auth(login, password) async {
    var box = await Hive.openBox<dynamic>('authBox');
    try {
      final mainPassword = box.get(login);
      return password == mainPassword;
    } finally {
      // Гарантированно закрываем Box даже при ошибке
      await box.close();
    }
  }
}

// class User {
//   String login;
//   String password;
//   User(this.login, this.password);

//   @override
//   String toString() {
//     return "$login $password";
//   }
// }

// class UserAdapter extends TypeAdapter<User> {
//   @override
//   final typeId = 0;

//   @override
//   User read(BinaryReader reader) {
//     final login = reader.readString();
//     final password = reader.readString();
//     return User(login, password);
//   }

//   @override
//   void write(BinaryWriter writer, User obj) {
//     writer.writeString(obj.login);
//     writer.writeString(obj.password);
//   }
// }
