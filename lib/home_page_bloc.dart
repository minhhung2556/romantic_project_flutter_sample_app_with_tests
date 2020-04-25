import 'package:lightweight_bloc/lightweight_bloc.dart';

enum HomePageStateId {
  loading,
  doneLoading,
  error,
  //other ids
}

class HomePageState {
  final HomePageStateId id;
  final int count;

  //other datas

  HomePageState({
    this.id,
    this.count,
  });

  HomePageState copyWith({
    HomePageStateId id,
    int count,
  }) {
    return new HomePageState(
      id: id ?? this.id,
      count: count ?? this.count,
    );
  }
}

class HomePageBloc extends Bloc<HomePageState> {
  HomePageBloc();

  @override
  void init() {
    //initial logic
    update(latestState.copyWith(id: HomePageStateId.doneLoading));
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
    update(latestState.copyWith(count: latestState.count + 1));
  }

  void decrease() {
    update(latestState.copyWith(count: latestState.count - 1));
  }
}
