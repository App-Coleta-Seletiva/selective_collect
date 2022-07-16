import '../../../../../../core/types/either.dart';
import '../../exceptions/login_exceptions.dart';
import '../repositories/login_repository.dart';
import '../entities/login_entity.dart';
import 'i_get_current_user_usecase.dart';

class GetCurrentUser implements IGetCurrentuserUsecase {
  final LoginRepository _repository;

  GetCurrentUser(this._repository);
  @override
Either<ILoginException, LoginEntity>  getCurrentUserUsecase() {

  
    return _repository.getCurrentUserdatasource();
  }
}
