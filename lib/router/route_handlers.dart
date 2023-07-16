import 'package:fluro/fluro.dart';

import '../ui/views/counter_provider_view.dart';
import '../ui/views/counter_view.dart';
import '../ui/views/view_404.dart';

final Handler counterHandler = Handler(
  handlerFunc: (context, parameters) {
    return CounterView(
      base: parameters['base']?.first ?? '5',
    );
  },
);
final Handler providerHandler = Handler(
  handlerFunc: (context, parameters) {
    print(parameters);

    return CounterProviderView(base: parameters['q']?.first ?? '');
  },
);
final Handler pageNotFound = Handler(
  handlerFunc: (context, parameters) => const View404(),
);
final Handler dashboardUserHandler = Handler(
  handlerFunc: (context, parameters) {
    print(parameters);
    return const View404();
  },
);
