import 'package:selective_collect/app/modules/auth/submodules/register/domain/entities/address_entity.dart';

class RegisterEntity {

  final String name;
  final String cpfCnpj;
  final String typePerson;
  final int idUser;
  final bool collector;
  final String email;
  final String imageUrl;
  final double rating;
  final AddressEntity adress;


  RegisterEntity({
 
    required this.name,
    required this.cpfCnpj,
    required this.typePerson,
    required this.idUser,
    required this.collector,
    required this.email,
    required this.imageUrl,
    required this.rating,
    required this.adress,
  });
}

