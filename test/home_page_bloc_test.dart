import 'package:fluttersampleappwithtests/home_page_bloc.dart';
import 'package:test/test.dart';

main() {
  test('HomePageBloc', () {
    final bloc = HomePageBloc()..init();
    expect(bloc.initialState.count, 0);

    bloc.increase();
    expect(bloc.state.count, 1);

    bloc.decrease();
    expect(bloc.state.count, 0);
  });

  test('HomePageBloc', () {
    final bloc = HomePageBloc()..init();
    expect(bloc.initialState.count, 0);

    bloc.increase();
    expect(bloc.state.count, 1);
  });

  test('HomePageBloc', () {
    final bloc = HomePageBloc()..init();
    expect(bloc.initialState.count, 0);

    bloc.decrease();
    expect(bloc.state.count, -1);
  });
}
