import 'package:flutter/material.dart';

const kDuration = Duration(seconds: 2);
const kCurve = Curves.elasticOut;
const kStartAlign = Alignment.centerRight;
const kEndAlign = Alignment.centerLeft;

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  Alignment initialAlignment = kStartAlign;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: kDuration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              setState(() {
                if (initialAlignment == kEndAlign) {
                  initialAlignment = kStartAlign;
                  animationController.reverse();
                } else {
                  initialAlignment = kEndAlign;
                  animationController.forward();
                }
              });
            },
            child: Text('Refresh'),
          ),
          ImplicitDemo(
            alignment: initialAlignment,
          ),
          ExplicitDemo(
            controller: animationController,
          ),
        ],
      ),
    );
  }
}

class ImplicitDemo extends StatelessWidget {
  final Alignment alignment;

  const ImplicitDemo({Key key, this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      child: SampleView(),
      alignment: alignment,
      duration: kDuration,
      curve: kCurve,
    );
  }
}

class ExplicitDemo extends StatefulWidget {
  final AnimationController controller;

  const ExplicitDemo({Key key, this.controller}) : super(key: key);
  @override
  _ExplicitDemoState createState() => _ExplicitDemoState();
}

class _ExplicitDemoState extends State<ExplicitDemo> {
  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlignTransition(
      child: SampleView(),
      alignment: AlignmentTween(begin: kStartAlign, end: kEndAlign)
          .chain(CurveTween(curve: kCurve))
          .animate(widget.controller),
    );
  }
}

class SampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://instagram.fsgn2-4.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p750x750/126998371_3864954843549213_3328628181047196271_n.jpg?_nc_ht=instagram.fsgn2-4.fna.fbcdn.net&_nc_cat=109&_nc_ohc=Wngmuta2qUMAX_mpsLC&tp=1&oh=062f86e5eac4612ea6ff2b6d7a181481&oe=5FFBE7F2',
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 2,
      fit: BoxFit.cover,
    );
  }
}
