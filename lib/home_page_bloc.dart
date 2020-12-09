import 'package:lightweight_bloc/lightweight_bloc.dart';

import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageState> {
  HomePageBloc();

  @override
  void init() {
    //initial logic
    update(state.copyWith(id: HomePageStateId.doneLoading));
  }

  @override
  void dispose() {
    //dispose logic
    super.dispose();
  }

  @override
  HomePageState get initialState =>
      HomePageState(id: HomePageStateId.loading, count: 0);

  void increase() {
    update(state.copyWith(count: state.count + 1));
  }

  void decrease() {
    update(state.copyWith(count: state.count - 1));
  }
}
