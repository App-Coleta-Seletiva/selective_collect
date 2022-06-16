import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/services/auth/auth_service_firebase_impl.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/register_usecase_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/external/register_datasource_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/infra/repositories/register_repository_impl.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_bloc.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_event.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_states.dart';

void main() {
  Bloc bloc;
  IAuthService service;
  RegisterWithEmailParam params = const RegisterWithEmailParam(
      email: 'email@email.com', password: 'paassaaaa');

  blocTest<RegisterBloc, RegisterState>(
      'should return a state of loading and Success',
      build: () {
        service = FirebaseMock();
        return RegisterBloc(RegisterUsecaseImpl(
            RegisterRepositoryImpl(RegisterDatasourceImpl(service))));
      },
      act: (bloc) => bloc.add(RegisterUser(params)),
      expect: () => [
            isA<LoadingRegisterState>(),
            isA<SuccessRegisterState>(),
          ]);
}

class FirebaseMock extends Mock implements FirebaseAuthService {}
