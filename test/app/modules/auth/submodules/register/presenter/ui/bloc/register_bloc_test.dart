import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:selective_collect/app/core/shared/failures/register_errors.dart';
import 'package:selective_collect/app/core/shared/services/auth/i_auth_service.dart';
import 'package:selective_collect/app/core/types/either.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/repositories/i_register_repository.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/domain/usecases/i_register_usecase.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_bloc.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_event.dart';
import 'package:selective_collect/app/modules/auth/submodules/register/presenter/ui/bloc/register_states.dart';

void main() {
  late IRegisterUsecase usercase;
  late RegisterWithEmailParam params;

  setUp(() {
    usercase = RegisterUseCaseMock();
    params = RegisterParamMock();
  });

  group('RegisterCase Test - Success:', () {
    blocTest<RegisterBloc, RegisterState>(
        'should return a state of loading and Success',
        build: () {
          when(() => params.email).thenReturn('emailemail.com');
          when(() => params.password).thenReturn('123456789');
          when(() => usercase(params))
              .thenAnswer((_) async => right(UnitMock()));
          return RegisterBloc(usercase);
        },
        act: (bloc) => bloc.add(RegisterUser(params)),
        expect: () => [
              isA<LoadingRegisterState>(),
              isA<SuccessRegisterState>(),
            ]);
  });

  group('RegisterBloc Test - Erros:', () {
    blocTest<RegisterBloc, RegisterState>(
        'should return a state of loading and Exception when email value is incorret',
        build: () {
          when(() => params.email).thenReturn('emailemail.co');
          when(() => params.password).thenReturn('123456789');
          when(() => usercase(params))
              .thenAnswer((_) async => left(EmailError()));
          return RegisterBloc(usercase);
        },
        act: (bloc) => bloc.add(RegisterUser(params)),
        expect: () => [
              isA<LoadingRegisterState>(),
              isA<ExceptionRegisterState>(),
            ]);

    blocTest<RegisterBloc, RegisterState>(
        'should return a state of loading and Exception when password value is incorret',
        build: () {
          when(() => params.email).thenReturn('emailemail.com');
          when(() => params.password).thenReturn('123456');
          when(() => usercase(params))
              .thenAnswer((_) async => left(PasswordError()));
          return RegisterBloc(usercase);
        },
        act: (bloc) => bloc.add(RegisterUser(params)),
        expect: () => [
              isA<LoadingRegisterState>(),
              isA<ExceptionRegisterState>(),
            ]);
  });
}

class RegisterUseCaseMock extends Mock implements IRegisterUsecase {}

class RegisterRepositoryMock extends Mock implements IRegisterRepository {}

class RegisterParamMock extends Mock implements RegisterWithEmailParam {}

class UnitMock extends Mock implements Unit {}
