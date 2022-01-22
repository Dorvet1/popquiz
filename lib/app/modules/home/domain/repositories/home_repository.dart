import 'package:dartz/dartz.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/domain/error/home_failure.dart';

abstract class HomeRepository {
  Future<Either<HomeFailure, ListMockForm>> searchList();
  Future<Either<HomeFailure, ListOfHistoricForm>> searchHistoric();
}
