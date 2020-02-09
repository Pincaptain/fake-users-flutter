import 'package:injectable/injectable.dart';

import 'package:fake_users/injection.iconfig.dart';

@injectableInit
void setupInjection(String environment) => $initGetIt(environment: environment);