import 'package:cache_test/repository/sqlite_repository.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SqfliteRepository.init();
  int res = SqfliteRepository.addUser('Bacz', 'ul@noknok.ru',13);
  print(res);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}
