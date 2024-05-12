import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeSearchEvent>((event, emit) {
      emit(HomeSearchState());
    });

    on<ExitSearchEvent>((event, emit) {
      emit(HomeInitial());
    });
  }
}
