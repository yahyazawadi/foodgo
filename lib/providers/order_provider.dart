import 'package:flutter/foundation.dart';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  Order? _order;

  Order? get order => _order;

  Future<void> fetchOrderSummary() async {
    //no need for mockdata here Ill add data from the api later on
    notifyListeners();
  }
}
