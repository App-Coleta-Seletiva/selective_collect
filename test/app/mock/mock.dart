import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/entities/login_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/types/params.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/infra/datasource/i_login_datasoure.dart';

class RepositoryMock extends Mock implements ILoginRepository {}

class LoginEmailParamsMock extends Mock implements LoginEmailParams {}

class LoginEntityMock extends Mock implements LoginEntity {}

class UnitMock extends Mock implements Unit {}

class LoginDatasourseMock extends Mock implements ILoginDatasouce {}

class AppExceptionMock extends Mock implements IAppException {}
