import 'package:get_it/get_it.dart';
import '../../features/auth/data/repo/auth_repo_imp.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import 'data_service.dart';
import 'firebase_auth_service.dart';
import 'firestore_servece.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatebaseService>(FirestoreServece());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(getIt<FirebaseAuthService>(), getIt<DatebaseService>()),
  );
}
