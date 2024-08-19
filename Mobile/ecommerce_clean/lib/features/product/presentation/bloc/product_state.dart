// part of 'home_page_bloc.dart';

import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

///home page state
sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class InitialState extends ProductState {}

final class LoadingState extends ProductState {}

final class LoadedAllProductState extends ProductState{
  final List<ProductEntity> product;

  const LoadedAllProductState({required this.product});

  @override
  List<Object> get props => [product];
}

final class LoadedSingleProductState extends ProductState{
  final ProductEntity product;

  const LoadedSingleProductState({required this.product});

  @override
  List<Object> get props => [product];
}

final class ErrorState extends ProductState{
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

final class SuccessfulState extends ProductState{
  final String message;
  const SuccessfulState({required this.message});

  @override
  List<Object> get props => [message];
}

final class DeleteProductState extends ProductState{
  final String message;
  const DeleteProductState({required this.message});

  @override
  List<Object> get props => [message];
}


// final class AddProductInitial extends ProductState {}
// final class ProductSubmiting extends ProductState {}
// final class ProductSubmited extends ProductState{
//   String name;
//   String catagory;
//   String description;
//   int price;
//   String imageUrl;

//   ProductSubmited.copyWith({
//     required this.name,
//     required this.catagory,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//   });
  
// }
// ///search

// // part of 'search_page_bloc.dart';

// sealed class SearchPageState extends Equatable {
//   const SearchPageState();
  
//   @override
//   List<Object> get props => [];
// }

// final class SearchPageInitial extends SearchPageState {}


// ///details 


// // part of 'details_page_bloc.dart';

// sealed class DetailsPageState extends Equatable {
//   const DetailsPageState();
  
//   @override
//   List<Object> get props => [];
// }

// final class DetailsPageInitial extends DetailsPageState {}

// ///add product


// // part of 'add_product_bloc.dart';

// sealed class ProductState extends Equatable {
//   const ProductState();
  
//   @override
//   List<Object> get props => [];
// }

// final class AddProductInitial extends ProductState {}
// final class AddProductLoading extends ProductState {}
// final class AddProductLoaded extends ProductState{
//   String name;
//   String catagory;
//   String description;
//   int price;
//   String imageUrl;

//   AddProductLoaded.copyWith({
//     required this.name,
//     required this.catagory,
//     required this.description,
//     required this.price,
//     required this.imageUrl,
//   });
  
// }

// ///update product

// // part of 'update_product_bloc.dart';

// sealed class UpdateProductState extends Equatable {
//   const UpdateProductState();
  
//   @override
//   List<Object> get props => [];
// }

// final class UpdateProductInitial extends UpdateProductState {}


