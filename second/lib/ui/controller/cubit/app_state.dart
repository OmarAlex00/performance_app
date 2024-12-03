part of 'app_cubit.dart';

@immutable
abstract class AppState extends Equatable {
  const AppState();
  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class AppLoading extends AppState {}

final class AppLoadingPagination extends AppState {}

class AppLoaded extends AppState {
  const AppLoaded({required this.products});
  final List<Product> products;
  @override
  List<Object> get props => [products];
}

final class AppError extends AppState {
  const AppError({required this.message});
  final String message;
}

final class AppEmpty extends AppState {}
