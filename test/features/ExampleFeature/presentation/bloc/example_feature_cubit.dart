import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:../core/error/failures.dart';
import 'package:../featchers/example_feature/domain/useCase/example_feature_use_case.dart';
import 'package:../featchers/example_feature/presentation/functions/example_feature_functions.dart';

import '../../../../core/dependencyInjection/app_dependency_injections.dart';
import '../../domain/model/example_feature_model.dart';
import '../../domain/repository/example_feature_repository.dart';

part 'example_feature_state.dart';

//	ExampleFeature

class ExampleFeatureCubit extends Cubit<ExampleFeatureState> {
  ExampleFeatureUseCase? ExampleFeatureUseCase;

  ExampleFeatureCubit({this.ExampleFeatureUseCase}) : super(ExampleFeatureInitial());

  fetchExampleFeature() async {
    emit(ExampleFeatureLoading());
    try {
      Either<Failure, ExampleFeatureModel>? ExampleFeatures =
          await sl<ExampleFeatureFunctions>().getExampleFeatures(productUseCase, emit);

      products.fold((l) {
        emit(ProductError(message: l.toString()));
      }, (r) {
        print("products : ${r.products}");
        emit(ProductLoaded(productModel: r));
      });
    } catch (e) {
      print("The error is : ${e.toString()}");
    }
  }
}
