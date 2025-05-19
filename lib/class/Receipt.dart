import 'package:divy/class/Item.dart';

class Receipt {
  String _receiptID;
  DateTime _scannedDateTime;
  List<Item> _itemList = [];

  Receipt(this._receiptID,this._itemList) : _scannedDateTime = DateTime.now();

  addItem(Item item) {
    _itemList.add(item);
  }


}