import 'package:get_it/get_it.dart';
import 'package:search_calculate/calculate/domain/usecases/filter_companies.dart';
import 'package:search_calculate/calculate/presentation/cubit/calculate_cubit.dart';
import 'package:search_calculate/calculation_flow/domain/usecases/validate_form_data.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/home/data/datasources/companies_fixture_datasource.dart';
import 'package:search_calculate/home/data/fixtures/companies_data.dart';
import 'package:search_calculate/home/data/repositories/companies_repository.dart';
import 'package:search_calculate/home/domain/usecases/get_companies.dart';
import 'package:search_calculate/home/presentation/cubit/home_cubit.dart';
import 'package:search_calculate/results/domain/usecases/add_to_watchlist.dart';
import 'package:search_calculate/results/domain/usecases/calculate_5_year_avg_fair_value.dart';
import 'package:search_calculate/results/domain/usecases/calculate_year_by_year_fair_value.dart';
import 'package:search_calculate/results/domain/usecases/remove_from_watchlist.dart';
import 'package:search_calculate/results/presentation/cubit/results_cubit.dart';
import 'package:search_calculate/watchlist/data/datasources/watchlist_local_datasource.dart';
import 'package:search_calculate/watchlist/data/repositories/watchlist_repository.dart';
import 'package:search_calculate/watchlist/domain/usecases/get_watchlist.dart';
import 'package:search_calculate/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance..allowReassignment = true;

init() async {
  //Other
  SharedPreferences sp = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sp);

  //Fixtures
  sl.registerFactory(() => companiesData);

  //DataSources
  sl.registerFactory(() => CompaniesFixtureDatasource(sl()));
  sl.registerFactory(() => WatchlistLocalDatasource(sl()));

  //Repositories
  sl.registerFactory(() => CompaniesRepository(sl()));
  sl.registerFactory(() => WatchlistRepository(sl()));

  //Usecases
  sl.registerFactory(() => GetCompanies(sl<CompaniesRepository>()));
  sl.registerFactory(() => FilterCompanies());
  sl.registerFactory(() => GetWatchlist(sl<WatchlistRepository>()));
  sl.registerFactory(() => AddToWatchlist(sl<WatchlistRepository>()));
  sl.registerFactory(() => RemoveFromWatchlist(sl<WatchlistRepository>()));
  sl.registerFactory(() => ValidateFormData());
  sl.registerFactory(() => CalculateYearByYearFairValue());
  sl.registerFactory(() => Calculate5YearAvgFairValue());

  //Cubits
  HomeCubit homeCubit = HomeCubit(sl());
  sl.registerFactory(() => homeCubit);
  sl.registerFactory(() => CalculateCubit(homeCubit, sl()));
  sl.registerFactory(() => WatchlistCubit(homeCubit, sl(), sl()));
  sl.registerFactory(() => ResultsCubit(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => CalculationFlowCubit(sl()));
}
