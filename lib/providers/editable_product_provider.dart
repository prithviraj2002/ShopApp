import 'package:flutter/cupertino.dart';

class EditableProduct with ChangeNotifier {
  String id = '';

  String newID = '';

  void addId(String productId) {
    id = productId;
  }

  String get productId {
    return id;
  }

  String get newEmptyId {
    return newID;
  }
}
