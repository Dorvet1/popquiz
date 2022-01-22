import 'package:dartz/dartz.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/error/home_failure.dart';
import 'package:popquiz/app/modules/home/domain/repositories/home_repository.dart';

abstract class SearchMockListUseCase {
  Future<Either<HomeFailure, ListMockForm>> call();
}

class SearchMockListUseCaseImpl implements SearchMockListUseCase {
  final HomeRepository repository;
  SearchMockListUseCaseImpl(this.repository);

  @override
  Future<Either<HomeFailure, ListMockForm>> call() async {
    final result =await  repository.searchList();
    return result;
  }
}
