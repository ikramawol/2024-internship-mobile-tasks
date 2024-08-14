// part of 'search_page_bloc.dart';


// part of 'home_page_bloc.dart';
import 'package:equatable/equatable.dart';

/// home page event

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}
class LoadProductsEvent extends HomePageEvent{}

// serach page event

sealed class SearchPageEvent extends Equatable {
  const SearchPageEvent();

  @override
  List<Object> get props => [];
}
//details

// part of 'details_page_bloc.dart';

sealed class DetailsPageEvent extends Equatable {
  const DetailsPageEvent();

  @override
  List<Object> get props => [];
}


///add product
// part of 'add_product_bloc.dart';

sealed class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

///update product

// part of 'update_product_bloc.dart';

sealed class UpdateProductEvent extends Equatable {
  const UpdateProductEvent();

  @override
  List<Object> get props => [];
}





