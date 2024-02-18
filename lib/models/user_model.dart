class UserModel {
  final Name name;
  final Dob dob;

  UserModel({
    required this.name,
    required this.dob,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: Name.fromJson(json['name']),
      dob: Dob.fromJson(json['dob']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name.toJson(),
      'dob': dob.toJson(),
    };
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }
}

class Dob {
  final String date;
  final int age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: json['date'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'age': age,
    };
  }
}
