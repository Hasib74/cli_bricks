import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{name.snakeCase()}}/core/dependencyInjection/app_dependency_injections.dart';
import 'package:{{name.snakeCase()}}/core/network/app_network.dart';
import 'package:{{name.snakeCase()}}/featchers/product/presentation/bloc/product_cubit.dart';
import 'package:{{name.snakeCase()}}/featchers/product/presentation/functions/product_functions.dart';

void main() async {
//  TestWidgetsFlutterBinding.ensureInitialized();
  await intiGetIt();

  group("Bloc test", () {
    test("Check connectivity", () async {
      var _connectivity = await sl<AppNetworkInfo>().isConnected;
      expectLater(_connectivity, true);
    });

    blocTest<ProductCubit, ProductState>(
      "Load product data",
      build: () => ProductCubit(productUseCase: sl()),
      act: (bloc) => bloc.fetchProduct(),
      expect: () => [
        ProductLoading(),
        ProductLoaded(productModel: sl<ProductFunctions>().productModel),
      ],
    );

    test(
        "Test product",
        () => expectLater(
            sl<ProductFunctions>().productModel!.products![0].title,
            "iPhone 9"));
  });
}
