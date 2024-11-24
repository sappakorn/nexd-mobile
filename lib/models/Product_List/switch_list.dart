class SwitchList {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description;
  final int    quantity;
  final String color;
  final String type;

  SwitchList({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
    required this.color,
    required this.type,
  });

  factory SwitchList.fromJson(Map<String, dynamic> json) {
    return SwitchList(
      id:           json['id'],
      name:         json['name'],
      price:        json['price'].toDouble(),
      image:        json['image'],
      description:  json['description'],
      quantity:     json['quantity'],
      color:        json['color'],
      type:         json['type'],
    );
  }
}