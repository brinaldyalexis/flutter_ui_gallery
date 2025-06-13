

import 'package:flutter_ui_gallery/models/models.dart';
import 'package:flutter_ui_gallery/routes/animations/animations.dart';
import 'package:flutter_ui_gallery/views/views.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/jobs/search',
    routes: [
      GoRoute(
        path: '/jobs/onboarding',
        pageBuilder: (context, state) => NoTransitionPage(child: OnboardingJobView()),
      ),
      GoRoute(
        path: '/jobs/signin',
        pageBuilder: (context, state) => FadeInLeftPage(child: SigInJobView()),
      ),
      GoRoute(
        path: '/jobs/signup',
        pageBuilder: (context, state) => FadeInLeftPage(child: SignUpJobView()),
      ),
      GoRoute(
        path: '/jobs/recovery-password',
        pageBuilder: (context, state) => FadeInLeftPage(child: RecoveryPasswordView()),
      ),
      GoRoute(
        path: '/jobs/search',
        pageBuilder: (context, state) => FadeInLeftPage(child: SearchJobView()),
      ),
      GoRoute(
        path: '/jobs/job',
        pageBuilder: (context, state) {
          final Job? job = state.extra as Job?;
          return FadeInLeftPage(
            child: JobView(job: job),
          );
        },
      )

    ],
  );
}
