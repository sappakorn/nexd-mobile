class KeyboardList {
  final String id;
  final String name;
  final double price;
  final String image;
  final String description;
  final int    quantity;
  final String color;
  final String typeProfile;
  final String switchType;
  final String switchName;
  final String switchColor;
  final String layout;

  KeyboardList({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.quantity,
    required this.color,
    required this.typeProfile,
    required this.switchType,
    required this.switchName,
    required this.switchColor,
    required this.layout,
  });

  factory KeyboardList.fromJson(Map<String, dynamic> json) {
    return KeyboardList(
      id:           json['id'],
      name:         json['name'],
      price:        json['price'].toDouble(),
      image:        json['image'],
      description:  json['description'],
      quantity:     json['quantity'],
      color:        json['color'],
      typeProfile:  json['type_profile'],
      switchType:   json['switch_type'],
      switchName:   json['switch_name'],
      switchColor:  json['switch_color'],
      layout:       json['layout'],
    );
  }
}