import 'dart:math';

class UtilService {
  static int generateId() {
    return (DateTime.now().second * DateTime.now().day) + Random().nextInt(10);
  }
}
