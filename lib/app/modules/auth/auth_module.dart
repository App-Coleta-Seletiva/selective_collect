import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/repositories/i_register_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/i_register_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/register_usecase_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/external/register_datasource_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/infra/datasources/i_register_datasource.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/infra/repositories/register_repository_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_bloc.dart';
import '../../core/shared/services/auth/auth_service_firebase_impl.dart';
import '../../core/shared/services/auth/i_auth_service.dart';
import 'submodules/register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => FirebaseAuth.instance),
    Bind.factory<IAuthService>((i) => FirebaseAuthService((i)())),
    Bind.factory<IRegisterDatasource>((i) => RegisterDatasourceImpl((i)())),
    Bind.factory<IRegisterRepository>((i) => RegisterRepositoryImpl((i)())),
    Bind.factory<IRegisterUsecase>((i) => RegisterUsecaseImpl((i)())),
    Bind.singleton((i) => RegisterBloc((i)()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: RegisterModule()),
    ModuleRoute("/register", module: RegisterModule()),
  ];
}
