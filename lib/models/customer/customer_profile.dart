class CustomerList {
  final String id;
  final String username;
  final String password;
  final String passwordView;
  final String imageProfile;
  final String imageCover; // เปลี่ยนจาก String? เป็น String
  final String name;
  final String telephone;
  final bool telephoneVerify;
  final String email; // เปลี่ยนจาก String? เป็น String
  final bool emailVerify;
  final String gender;
  final String birthDate; // เปลี่ยนจาก String? เป็น String
  final String age; // เปลี่ยนจาก String? เป็น String
  final String facebookId; // เปลี่ยนจาก String? เป็น String
  final String gmailId; // เปลี่ยนจาก String? เป็น String
  final String lineId; // เปลี่ยนจาก String? เป็น String
  final dynamic customerAddresses;

  CustomerList({
    required this.id,
    required this.username,
    required this.password,
    required this.passwordView,
    required this.imageProfile,
    required this.imageCover,
    required this.name,
    required this.telephone,
    required this.telephoneVerify,
    required this.email,
    required this.emailVerify,
    required this.gender,
    required this.birthDate,
    required this.age,
    required this.facebookId,
    required this.gmailId,
    required this.lineId,
    this.customerAddresses,
  });

  factory CustomerList.fromJson(Map<String, dynamic> json) {
    return CustomerList(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      passwordView: json['password_view'] ?? '',
      imageProfile: json['image_profile'] ?? '',
      imageCover: json['image_cover'] ?? '', // ตั้งค่าเริ่มต้นเป็น ""
      name: json['name'] ?? '',
      telephone: json['telephone'] ?? '',
      telephoneVerify: json['telephone_verify'] ?? false,
      email: json['email'] ?? '', // ตั้งค่าเริ่มต้นเป็น ""
      emailVerify: json['email_verify'] ?? false,
      gender: json['gender'] ?? '',
      birthDate: json['birth_date'] ?? '', // ตั้งค่าเริ่มต้นเป็น ""
      age: json['age'] ?? '', // ตั้งค่าเริ่มต้นเป็น ""
      facebookId: json['facebook_id'] ?? '', // ตั้งค่าเริ่มต้นเป็น ""
      gmailId: json['gmail_id'] ?? '', // ตั้งค่าเริ่มต้นเป็น ""
      lineId: json['line_id'] ?? '', // ตั้งค่าเริ่มต้นเป็น ""
      customerAddresses: json['customer_addresses'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'password_view': passwordView,
      'image_profile': imageProfile,
      'image_cover': imageCover,
      'name': name,
      'telephone': telephone,
      'telephone_verify': telephoneVerify,
      'email': email,
      'email_verify': emailVerify,
      'gender': gender,
      'birth_date': birthDate,
      'age': age,
      'facebook_id': facebookId,
      'gmail_id': gmailId,
      'line_id': lineId,
      'customer_addresses': customerAddresses,
    };
  }
}
