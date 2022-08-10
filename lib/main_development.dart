// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:account/account.dart';
import 'package:crypto_wallet/app/app.dart';
import 'package:crypto_wallet/bootstrap.dart';
import 'package:crypto_wallet/dependency_injection.dart';
import 'package:tokens/tokens.dart';

void main() {
  getIt
    ..registerSingleton<AbstractAccountRepository>(
      MockAccountRepository(),
    )
    ..registerSingleton<AbstractTokensRepository>(
      MockTokensRepository(),
    );

  bootstrap(() => const App());
}
