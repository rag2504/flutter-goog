class User {
  int? id;
  String name;
  String email;
  String mobile;
  int age;
  String city;
  String gender;
  String password;
  String? profileImagePath;
  int isFavorite;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.age,
    required this.city,
    required this.gender,
    required this.password,
    this.profileImagePath,
    this.isFavorite = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'age': age,
      'city': city,
      'gender': gender,
      'password': password,
      'profileImagePath': profileImagePath,
      'isFavorite': isFavorite,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      mobile: map['mobile'],
      age: map['age'],
      city: map['city'],
      gender: map['gender'],
      password: map['password'],
      profileImagePath: map['profileImagePath'],
      isFavorite: map['isFavorite'],
    );
  }
}