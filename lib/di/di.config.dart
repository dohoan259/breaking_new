// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/error_handler.dart' as _i6;
import '../data/remote/services/api_service.dart' as _i8;
import '../data/remote/sources/breaking_news_remote_source.dart' as _i9;
import '../data/remote/sources/breaking_news_remote_source_impl.dart' as _i10;
import '../data/repositories/breaking_news_repository_impl.dart' as _i12;
import '../domain/repositories/breaking_news_repository.dart' as _i11;
import '../domain/use_cases/get_article_list_use_case.dart' as _i13;
import '../presentation/views/dialogs/error_dialog.dart' as _i4;
import '../presentation/views/dialogs/error_dialog_with_retry.dart' as _i5;
import '../presentation/views/dialogs/loading_dialog.dart' as _i7;
import '../presentation/views/screens/breaking_news/breaking_news_controller.dart'
    as _i14;
import 'network_module.dart' as _i15; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i4.ErrorDialog>(_i4.ErrorDialog());
  gh.singleton<_i5.ErrorDialogWithRetry>(_i5.ErrorDialogWithRetry());
  gh.singleton<_i6.ErrorHandler>(_i6.ErrorHandler());
  gh.singleton<_i7.LoadingDialog>(_i7.LoadingDialog());
  gh.singleton<_i8.ApiService>(networkModule.getService(get<_i3.Dio>()));
  gh.factory<_i9.BreakingNewsRemoteSource>(
      () => _i10.BreakingNewsRemoteSourceImpl(get<_i8.ApiService>()));
  gh.factory<_i11.BreakingNewsRepository>(() =>
      _i12.BreakingNewsRepositoryImpl(get<_i9.BreakingNewsRemoteSource>()));
  gh.factory<_i13.GetArticleListUseCase>(
      () => _i13.GetArticleListUseCase(get<_i11.BreakingNewsRepository>()));
  gh.factory<_i14.BreakingNewsController>(
      () => _i14.BreakingNewsController(get<_i13.GetArticleListUseCase>()));
  return get;
}

class _$NetworkModule extends _i15.NetworkModule {}
