import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lightweight_bloc/lightweight_bloc.dart';

import 'home_page_bloc.dart';
import 'keys.dart';

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    //dispose logic
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, bloc, state) {
        switch (state.id) {
          case HomePageStateId.doneLoading:
            //some logic
            break;
          case HomePageStateId.error:
            //some logic
            break;
          case HomePageStateId.loading:
          default:
            //some logic
            break;
        }
      },
      child: BlocWidgetBuilder<HomePageBloc, HomePageState>(
        builder: (context, bloc, state) {
          switch (state.id) {
            case HomePageStateId.doneLoading:
              return _buildDoneLoading(context, bloc, state);
            case HomePageStateId.error:
              return _buildError(context, bloc, state);
            case HomePageStateId.loading:
            default:
              return _buildLoading(context, bloc, state);
          }
        },
      ),
    );
  }

  Widget _buildDoneLoading(
      BuildContext context, HomePageBloc bloc, HomePageState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${state.count}',
              key: ValueKey(AssetKeys.counterText),
              style: Theme.of(context).textTheme.display1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  key: ValueKey(AssetKeys.increaseButton),
                  onPressed: bloc.increase,
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  key: ValueKey(AssetKeys.decreaseButton),
                  onPressed: bloc.decrease,
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(
      BuildContext context, HomePageBloc bloc, HomePageState state) {
    return Container();
  }

  Widget _buildLoading(
      BuildContext context, HomePageBloc bloc, HomePageState state) {
    return Container();
  }
}

class HomePage extends StatefulWidget {
  static Widget newInstance() {
    return BlocProvider(
      builder: (context) => HomePageBloc(),
      child: HomePage(),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}
