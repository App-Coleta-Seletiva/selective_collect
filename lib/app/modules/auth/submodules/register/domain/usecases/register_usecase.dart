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
   // * validações: quais?
      
  
    return repository(register);
   
  }  
}