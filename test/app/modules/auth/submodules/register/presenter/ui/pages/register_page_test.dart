import 'package:bloc_test/bloc_test.dart';
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
  late IAuthService service;
  late RegisterWithEmailParam params;
  setUp(() {
    service = FirebaseMock();
  });

  group('RegisterPage Test - Sucess.', () {
    blocTest<RegisterBloc, RegisterState>(
        'should return a state of loading and Success',
        setUp: () => params = const RegisterWithEmailParam(
            email: 'email@email.com', password: '12345678'),
        build: () {
          return RegisterBloc(RegisterUsecaseImpl(
              RegisterRepositoryImpl(RegisterDatasourceImpl(service))));
        },
        act: (bloc) => bloc.add(RegisterUser(params)),
        expect: () => [
              isA<LoadingRegisterState>(),
              isA<SuccessRegisterState>(),
            ]);
  });

  group('RegisterPage Test - Exception.', () {
    blocTest<RegisterBloc, RegisterState>(
        'should return a state of loading and Exception when e-mail is incorrect',
        setUp: () => params = const RegisterWithEmailParam(
            email: 'emailemail.com', password: '12345678'),
        build: () {
          return RegisterBloc(RegisterUsecaseImpl(
              RegisterRepositoryImpl(RegisterDatasourceImpl(service))));
        },
        act: (bloc) => bloc.add(RegisterUser(params)),
        expect: () => [
              isA<LoadingRegisterState>(),
              isA<ExceptionRegisterState>(),
            ]);

    blocTest<RegisterBloc, RegisterState>(
        'should return a state of loading and Exception when password is incorrect',
        setUp: () => params = const RegisterWithEmailParam(
            email: 'email@email.com', password: '1234567'),
        build: () {
          return RegisterBloc(RegisterUsecaseImpl(
              RegisterRepositoryImpl(RegisterDatasourceImpl(service))));
        },
        act: (bloc) => bloc.add(RegisterUser(params)),
        expect: () => [
              isA<LoadingRegisterState>(),
              isA<ExceptionRegisterState>(),
            ]);
  });
}

class FirebaseMock extends Mock implements FirebaseAuthService {}
