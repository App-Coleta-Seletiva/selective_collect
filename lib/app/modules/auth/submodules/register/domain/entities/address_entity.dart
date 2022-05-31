class AddressEntity {
  final int id;
  final String street;
  final int number;
  final String district;
  final String zipCode;
  final String city;
  final String complement;
  final String state;
  final String locale;

  AddressEntity({
    required this.id,
    required this.street,
    required this.number,
    required this.district,
    required this.zipCode,
    required this.city,
    required this.complement,
    required this.state,
    required this.locale,
  });
}
