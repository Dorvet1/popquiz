import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';
import 'package:popquiz/app/modules/home/domain/error/home_failure.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:dartz/dartz.dart';
import 'package:popquiz/app/modules/home/domain/repositories/home_repository.dart';
import 'package:popquiz/app/modules/home/infra/datasource/data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImpl(this.homeDataSource);
  @override
  Future<Either<HomeFailure, ListMockForm>> searchList() async {
    ListMockForm _listMockFormRepository;
    try {
      _listMockFormRepository = await homeDataSource.fetchListMock();
    } catch (e) {
      return left(HomeDataSourceErro(e.toString()));
    }

    return right(_listMockFormRepository);
  }

  @override
  Future<Either<HomeFailure, ListOfHistoricForm>> searchHistoric() async {
    ListOfHistoricForm historicForm;
    try {
      historicForm = await homeDataSource.fetHistoricForm();
    } catch (e) {
      return left(HomeDataSourceErro(e.toString()));
    }
    return right(historicForm);
  }
}
