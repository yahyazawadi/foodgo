// lib/dependency_locator.dart
import 'package:get_it/get_it.dart';
import 'package:dofood/api/api_client.dart';
import 'package:dofood/api/product_api.dart';
import 'package:dofood/api/cart_api.dart';
import 'package:dofood/api/order_api.dart';

final GetIt locator = GetIt.instance;

void setupDependencies() {
  locator.registerSingleton<ApiClient>(ApiClient());
  locator.registerLazySingleton<ProductApi>(
    () => ProductApi(locator<ApiClient>()),
  );
  locator.registerLazySingleton<CartApi>(() => CartApi(locator<ApiClient>()));
  locator.registerLazySingleton<OrderApi>(() => OrderApi(locator<ApiClient>()));
}
