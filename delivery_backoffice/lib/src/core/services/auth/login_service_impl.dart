import '../../../repositories/auth/auth_repository.dart';
import '../../exceptions/repository_exception.dart';
import '../../global/constants.dart';
import '../../storage/storage.dart';
import './login_service.dart';

class LoginServiceImpl implements LoginService {
  final AuthRepository _authRepository;
  final Storage _storage;

  LoginServiceImpl(this._authRepository, this._storage);

  @override
  Future<void> execute(String email, String password) async {
    final authModel = await _authRepository.login(email, password);
    _storage.setData(SessionStorageKeys.accessToken.key, authModel.accessToken);
  }
}
