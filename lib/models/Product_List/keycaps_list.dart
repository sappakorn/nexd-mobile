class KeycapsList {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description;
  final int    quantity;
  final String color;
  final String type;
  final String profile;

  KeycapsList({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
    required this.color,
    required this.type,
    required this.profile,
  });

  factory KeycapsList.fromJson(Map<String, dynamic> json) {
    return KeycapsList(
      id:           json['id'],
      name:         json['name'],
      price:        json['price'].toDouble(),
      image:        json['image'],
      description:  json['description'],
      quantity:     json['quantity'],
      color:        json['color'],
      type:         json['type'],
      profile:      json['profile'],
    );
  }
}