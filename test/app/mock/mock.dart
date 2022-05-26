import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/entities/login_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/forgot_password/login/domain/types/params.dart';

class RepositoryMock extends Mock implements ILoginRepository {}

class LoginEmailParamsMock extends Mock implements LoginEmailParams {}

class LoginEntityMock extends Mock implements LoginEntity {}

class UnitMock extends Mock implements Unit {}
