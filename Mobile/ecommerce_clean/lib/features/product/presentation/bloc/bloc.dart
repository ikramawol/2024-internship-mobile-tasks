import 'package:bloc/bloc.dart';
// import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/state.dart';



class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final ProductRepository productRepository;

  HomePageBloc(this.productRepository) : super(HomePageLoading()) {
    
    on<LoadProductsEvent>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProductsEvent event, Emitter<HomePageState> emit) async {
  
    final products =  await productRepository.getAllProduct();

    products.fold(
      (failure) => emit(const HomePageLoadingError(message : 'Failed to load products')),
      (products) => emit(HomePageLoaded( product: products)),
    );
  }
}

/// search

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(SearchPageInitial()) {
    on<SearchPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

/// details

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc() : super(DetailsPageInitial()) {
    on<DetailsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

/// add product

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc() : super(AddProductInitial()) {
    on<AddProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}


/// update product

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc() : super(UpdateProductInitial()) {
    on<UpdateProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}




