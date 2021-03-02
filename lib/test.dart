import 'package:cache_test/repository/sqlite_repository.dart';

void main() {
  SqfliteRepository.init();
  print(SqfliteRepository.addUser('Bacz', 'ul@noknok.ru',13));
}
