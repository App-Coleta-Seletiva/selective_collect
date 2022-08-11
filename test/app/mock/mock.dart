import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/i_app_exception.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/entities/login_entity.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/repositories/i_login_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/domain/types/params_type.dart';
import 'package:selective_collect/app/modules/auth/submodules/login/infra/datasource/i_login_datasource.dart';

class IRepositoryMock extends Mock implements ILoginRepository {}

class LoginEmailParamsMock extends Mock implements LoginEmailParamsType {}

class LoginEntityMock extends Mock implements LoginEntity {}

class UnitMock extends Mock implements Unit {}

class ILoginDatasourceMock extends Mock implements ILoginDatasource {}

class ILoginRepositoryMock extends Mock implements ILoginRepository {}

class IAppExceptionMock extends Mock implements IAppException {}

class IAuthServiceMock extends Mock implements IAuthService {}
//defite tecnico I nos nomes dos mocks