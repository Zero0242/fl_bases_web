import 'package:fluro/fluro.dart';
import './route_handlers.dart';

class WebAppRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.notFoundHandler = pageNotFound;
    router.define(
      '/',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
    );

    // * Stateful routes
    router.define(
      '/stateful',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/stateful/:base',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn,
    );
    // * provider routes
    router.define(
      '/provider',
      handler: providerHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/dashboard/users/:userid/:roleid',
      handler: dashboardUserHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
