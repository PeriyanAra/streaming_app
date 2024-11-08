import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart'
    hide FactoryFunc, FactoryFuncParam, DisposingFunc;
import 'package:music_streaming_app/core/di/di.dart';

final class DiGetItImplementation implements DependencyInjection {
  factory DiGetItImplementation() => _instance ??= DiGetItImplementation._();

  DiGetItImplementation._() : getIt = GetIt.asNewInstance();

  static DiGetItImplementation? _instance;

  @visibleForTesting
  final GetIt getIt;

  @override
  T get<T extends Object>({String? instanceName}) =>
      getIt.get(instanceName: instanceName);

  @override
  T getWithParam<T extends Object, P>(
    P param, {
    String? instanceName,
  }) =>
      getIt.get(instanceName: instanceName, param1: param);

  @override
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    getIt.registerFactory(() => factoryFunc(), instanceName: instanceName);
  }

  @override
  void registerFactoryParam<T extends Object, P1>(
    FactoryFuncParam<T, P1> factoryFuncParam, {
    String? instanceName,
  }) {
    getIt.registerFactoryParam<T, P1, void>(
      (p1, _) => factoryFuncParam(p1),
      instanceName: instanceName,
    );
  }

  @override
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    getIt.registerSingleton(
      instance,
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    getIt.registerLazySingleton(
      () => factoryFunc(),
      instanceName: instanceName,
      dispose: dispose,
    );
  }

  @override
  T call<T extends Object>({String? instanceName}) =>
      get(instanceName: instanceName);

  @override
  void allowReassignment() {
    getIt.allowReassignment = true;
  }

  Future<void> reset() {
    return getIt.reset();
  }

  @override
  bool isRegistered<T extends Object>() {
    return getIt.isRegistered<T>();
  }
}
