abstract class HomeFailure implements Exception {}

class HomeDataSourceErro extends HomeFailure {
  String msg;
  HomeDataSourceErro(this.msg);
}
