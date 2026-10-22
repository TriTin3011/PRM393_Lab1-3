class Product {
  final int id;
  final String name;
  final double price;

  Product(
  {
   required this.id,
   required this.name,
   required this.price
  });

  @override
  String toString() => 'Prduct: \nid: $id \nname: $name \nprice: $price';
}