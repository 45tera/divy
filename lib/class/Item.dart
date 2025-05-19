class Item{
  String itemName;
  double itemPrice;
  int itemQuantity;

  Item({
    required this.itemName,
    required this.itemPrice,
  }) : itemQuantity = 1;

  Item.withQuantity({
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
  });

}