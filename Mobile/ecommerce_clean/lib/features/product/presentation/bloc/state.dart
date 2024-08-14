// part of 'home_page_bloc.dart';

import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

///home page state
sealed class HomePageState extends Equatable {
  const HomePageState();
  
  @override
  List<Object> get props => [];
}

// final class HomePageInitial extends HomePageState {}
final class HomePageLoading extends HomePageState {}
final class HomePageLoaded extends HomePageState{
  final List<ProductEntity> product;

  const HomePageLoaded({required this.product});

  @override
  List<Object> get props => [product];
}
final class HomePageLoadingError extends HomePageState{
  final String message;
  const HomePageLoadingError({required this.message});

  @override
  List<Object> get props => [message];
}

///search

// part of 'search_page_bloc.dart';

sealed class SearchPageState extends Equatable {
  const SearchPageState();
  
  @override
  List<Object> get props => [];
}

final class SearchPageInitial extends SearchPageState {}


///details 


// part of 'details_page_bloc.dart';

sealed class DetailsPageState extends Equatable {
  const DetailsPageState();
  
  @override
  List<Object> get props => [];
}

final class DetailsPageInitial extends DetailsPageState {}

///add product


// part of 'add_product_bloc.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();
  
  @override
  List<Object> get props => [];
}

final class AddProductInitial extends AddProductState {}
final class AddProductLoading extends AddProductState {}
final class AddProductLoaded extends AddProductState{
  String name;
  String catagory;
  String description;
  int price;
  String imageUrl;

  AddProductLoaded.copyWith({
    required this.name,
    required this.catagory,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
  
}

///update product

// part of 'update_product_bloc.dart';

sealed class UpdateProductState extends Equatable {
  const UpdateProductState();
  
  @override
  List<Object> get props => [];
}

final class UpdateProductInitial extends UpdateProductState {}


