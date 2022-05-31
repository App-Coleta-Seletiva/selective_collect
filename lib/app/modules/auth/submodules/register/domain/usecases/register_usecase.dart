import '../../../../../../core/shared/failures/i_app_exception.dart';
import '../../../../../../core/types/either.dart';
import '../entities/register_entity.dart';
import '../repositories/i_register_repository.dart';
import 'i_register_usecase.dart';

class RegisterUsecaseImpl implements IRegisterUsecase {

  final IRegisterRepository repository;

  RegisterUsecaseImpl(this.repository);

  @override
  Future<Either<IAppException, void>> call(RegisterEntity register) async {

    //falta implementar.
    
    /* --Validações para registrar o usuário --.
    // Usuário já esta registrado?
    // campo nome esta vazio?
    // CPF/CNPJ é valido?
    // Telefone é válido?
    // Email é válido?
    // cep é valido? busca api de cadastro de endereços?
    */

    return repository(register);
   
  }  
}