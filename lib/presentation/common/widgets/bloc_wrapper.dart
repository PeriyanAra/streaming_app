import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_streaming_app/core/core.dart';
import 'package:music_streaming_app/presentation/common/blocs/user_bloc/user_bloc.dart';
import 'package:music_streaming_app/presentation/setting/settings_bloc/settings_bloc.dart';

class BlocsWrapper extends StatelessWidget {
  const BlocsWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DiGetItImplementation()<UserBloc>()..add(const UserEvent.fetchData()),
        ),
        BlocProvider(
          create: (context) => DiGetItImplementation()<SettingsBloc>()..add(SettingsEvent.fetchSettings(context: context)),
        ),
      ],
      child: child,
    );
  }
}
