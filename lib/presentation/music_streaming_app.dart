import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_streaming_app/gen/strings.g.dart';
import 'package:music_streaming_app/presentation/common/blocs/user_bloc/user_bloc.dart';
import 'package:music_streaming_app/presentation/common/widgets/bloc_wrapper.dart';
import 'package:music_streaming_app/presentation/router/app_router.dart';
import 'package:music_streaming_app/presentation/router/app_router.gr.dart';
import 'package:music_streaming_app/presentation/theme/theme.dart';

class MusicStreamingApp extends StatefulWidget {
  const MusicStreamingApp({super.key});

  @override
  State<MusicStreamingApp> createState() => _MusicStreamingAppState();
}

class _MusicStreamingAppState extends State<MusicStreamingApp> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocsWrapper(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Music Streaming App',
            theme: MusicStreamingTheme.dark(),
            darkTheme: MusicStreamingTheme.dark(),
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: AppLocaleUtils.supportedLocales,
            locale: TranslationProvider.of(context).flutterLocale,
            routerDelegate: AutoRouterDelegate.declarative(
              _appRouter,
              routes: (_) {
                final isAuthenticated = state is UserLoadedState && state.user != null;

                return isAuthenticated
                    ? [const AuthenticatedRoute()]
                    : [const UnauthenticatedRoute()];
              },
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            // localizationsDelegates: const [
            //   ...AppLocalizations.localizationsDelegates,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   RefreshLocalizations.delegate
            // ],
          );
        },
      ),
    );
  }
}
