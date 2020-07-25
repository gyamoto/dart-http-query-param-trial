import 'package:equatable/equatable.dart';

abstract class Resource extends Equatable {
  const Resource();

  @override
  List<Object> get props => [];
}

class Ready extends Resource {
  const Ready();
}

class Loading extends Resource {
  const Loading();
}

class Complete extends Resource {
  const Complete(this.response);

  final String response;

  @override
  List<Object> get props => [response];
}

class Error extends Resource {
  const Error(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
