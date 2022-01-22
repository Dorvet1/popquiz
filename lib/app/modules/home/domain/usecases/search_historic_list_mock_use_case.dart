import 'package:dartz/dartz.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/domain/error/home_failure.dart';
import 'package:popquiz/app/modules/home/domain/repositories/home_repository.dart';

abstract class SearchHistoricFormUseCase {
  Future<Either<HomeFailure, ListOfHistoricForm>> call();
}

class SearchHistoricFormUseCaseImpl implements SearchHistoricFormUseCase {
  HomeRepository repository;
  SearchHistoricFormUseCaseImpl(this.repository);

  @override
  Future<Either<HomeFailure, ListOfHistoricForm>> call() async {
    final result = await repository.searchHistoric();
    return result;
  }
}
