abstract class Failure {
  final String message;

  Failure(this.message);
}

class serverFailure extends Failure {
  serverFailure(super.message);
}
