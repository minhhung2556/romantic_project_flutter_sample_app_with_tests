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
