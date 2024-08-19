import 'package:bloc/bloc.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_state.dart';



class ProductBloc extends Bloc<ProductEvent, ProductState> {
  
  final ProductRepository productRepository;
  

  ProductBloc(this.productRepository) : super(InitialState()) {

    
    on<LoadAllProductsEvent>((event, emit) async{
      emit(LoadingState());
      final products =  await productRepository.getAllProduct();
      print(products);

      products.fold(
        (failure) => emit(const ErrorState(message : 'Failed to load products')),
        (products) => emit(LoadedAllProductState( product: products)),
      );
    });

    on<GetSingleProductEvent>((event, emit) async{
      emit(LoadingState());
      final products =  await productRepository.getProduct(event.productId);
      products.fold(
      (failure) => emit(const ErrorState(message: 'Failed to load product') ),
      (products) => emit(LoadedSingleProductState(product: products)),
    );
    });

    on<UpdateProductEvent>((event, emit) async {
      emit(LoadingState());
      final product = await productRepository.updateProduct(event.product);
      product.fold(
        (failure) => emit(const ErrorState(message: 'Failed to update product')),
        (product) => emit(LoadedSingleProductState(product: product)),
      );
    });

    on<CreateProductEvent>((event, emit) async {
      emit(LoadingState());
      final product = await productRepository.addProduct(event.newProduct);
      product.fold(
        (failure) => emit(const ErrorState(message: 'Failed to create product')),
        (product) => emit(const SuccessfulState(message: 'Product succesfully created')),
      );
    });
    
    on<DeleteProductEvent>((event, emit) async {
      emit(LoadingState());
      final product = await productRepository.deleteProduct(event.productId);
      product.fold(
        (failure) => emit(const ErrorState(message: 'Failed to delete product')),
        (product) => emit(const SuccessfulState(message: 'Product succesfully deleted')),
      );
    });
  }
}


  // void _onLoadProducts(LoadAllProductsEvent event, Emitter<State> emit) async {

  //   emit(LoadingState());
  //   final products =  await productRepository.getAllProduct();

  //   products.fold(
  //     (failure) => emit(const ErrorState(message : 'Failed to load products')),
  //     (products) => emit(LoadedAllProductState( product: products)),
  //   );
  // }

  // void _onGetSingleProduct(GetSingleProductEvent event, Emitter<GetSingleProductEvent> emit) async {
  //   // emit(LoadedAllProductState(product:event.productId));
  //   emit(LoadingState() as GetSingleProductEvent);
  //   final products =  await productRepository.getProduct(event.productId);
  //   products.fold(
  //     (failure) => emit(const ErrorState(message: 'Failed to load product') as GetSingleProductEvent),
  //     (products) => emit(LoadedSingleProductState(product: products) as GetSingleProductEvent),
  //   );
  // }

  // void _onUpdateProduct()async {
    
  // }

  // void _onCreateProduct()async {
    
  // }

  // void _onDeleteProduct()async {
    
  // }

// }

  
//   @override
//   Stream<State> mapEventToState(Event event) async*{
//     if(event is LoadAllProductsEvent) yield* _onLoadProducts(event);
//     if (event is GetSingleProductEvent) yield* _onGetSingleProduct(event);
//     if (event is UpdateProductEvent) yield* _onUpdateProduct(event);
//     if (event is CreateProductEvent) yield* _onCreateProduct(event);
//     if (event is DeleteProductEvent) yield* _onDeleteProduct(event);
//   }
//   }

//   Stream<State> _onLoadProducts(LoadAllProductsEvent event) async*{
//     yield LoadingState();
//   }
// }


