part of 'example_feature_cubit.dart';

abstract class ExampleFeatureState extends Equatable {
  const ExampleFeatureState();
}

class ExampleFeatureInitial extends ExampleFeatureState {
  @override
  List<Object> get props => [];
}

class ExampleFeatureLoading extends ExampleFeatureState {
  @override
  List<Object> get props => [];
}

class ExampleFeatureLoaded extends ExampleFeatureState {
  final ExampleFeatureModel? ExampleFeatureModel;

  ExampleFeatureLoaded({this.ExampleFeatureModel}) {
    // print("ExampleFeatureModel :: ${ExampleFeatureModel!.limit.toString()}");
  }

  @override
  List<Object> get props => [ExampleFeatureModel!];
}

class ExampleFeatureError extends ExampleFeatureState {
  final String message;

  ExampleFeatureError({required this.message});

  @override
  List<Object> get props => [message];
}
