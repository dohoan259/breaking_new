// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote/services/api_service.dart' as _i5;
import '../data/remote/sources/breaking_news_remote_source.dart' as _i6;
import '../data/remote/sources/breaking_news_remote_source_impl.dart' as _i7;
import '../data/repositories/breaking_news_repository_impl.dart' as _i9;
import '../domain/repositories/breaking_news_repository.dart' as _i8;
import '../domain/usecases/get_article_list_use_case.dart' as _i10;
import '../presentation/base/error_listener.dart' as _i4;
import '../presentation/ui/screens/breaking_news/breaking_news_controller.dart'
    as _i11;
import 'network_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.Dio>(networkModule.getDio());
  gh.singleton<_i4.ErrorListener>(_i4.ErrorListener());
  gh.singleton<_i5.ApiService>(networkModule.getService(get<_i3.Dio>()));
  gh.factory<_i6.BreakingNewsRemoteSource>(
      () => _i7.BreakingNewsRemoteSourceImpl(get<_i5.ApiService>()));
  gh.factory<_i8.BreakingNewsRepository>(() =>
      _i9.BreakingNewsRepositoryImpl(get<_i6.BreakingNewsRemoteSource>()));
  gh.factory<_i10.GetArticleListUseCase>(
      () => _i10.GetArticleListUseCase(get<_i8.BreakingNewsRepository>()));
  gh.factory<_i11.BreakingNewsController>(
      () => _i11.BreakingNewsController(get<_i10.GetArticleListUseCase>()));
  return get;
}

class _$NetworkModule extends _i12.NetworkModule {}
