import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String firstName;
  final String lastName;
  final int age;
  final String bloodType;

  const User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.bloodType,
  });

  User copywith({
    String? firstName,
    String? lastName,
    int? age,
    String? bloodType,
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
        bloodType: bloodType ?? this.bloodType,
      );

  @override
  List<Object?> get props => [firstName, lastName, age, bloodType];
}
