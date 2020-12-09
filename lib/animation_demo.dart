import 'package:flutter/material.dart';

const kDuration = Duration(seconds: 2);
const kCurve = Curves.elasticOut;
const kStartAlign = Alignment.centerRight;
const kEndAlign = Alignment.centerLeft;
const double kStartRadius = 10;
const double kEndRadius = 150;

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  Alignment startAlign = kStartAlign;
  Alignment endAlign = kEndAlign;
  AnimationController animationController;
  double startRadius = kStartRadius, endRadius = kEndRadius;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: kDuration);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (startAlign == kEndAlign) {
                    startAlign = kStartAlign;
                    endAlign = kEndAlign;
                    animationController.reverse();
                    startRadius = kStartRadius;
                    endRadius = kEndRadius;
                  } else {
                    startAlign = kEndAlign;
                    endAlign = kStartAlign;
                    animationController.forward();
                    startRadius = kEndRadius;
                    endRadius = kStartRadius;
                  }
                });
              },
              child: Text('Refresh'),
            ),
            ImplicitDemo(
              alignment: startAlign,
            ),
            ExplicitDemo(
              controller: animationController,
            ),
            ImplicitCustomDemo(
              start: startAlign,
              end: endAlign,
            ),
            ExplicitCustomDemo(
              controller: animationController,
            ),
            ImplicitPainterDemo(
              startRadius: startRadius,
              endRadius: endRadius,
            ),
          ],
        ),
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

class ImplicitCustomDemo extends StatelessWidget {
  final Alignment start, end;

  const ImplicitCustomDemo({Key key, this.start, this.end}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Alignment>(begin: start, end: end),
      duration: kDuration,
      curve: kCurve,
      child: SampleView(),
      builder: (BuildContext context, Alignment value, Widget child) {
        return Align(
          child: child,
          alignment: value,
        );
      },
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

class ExplicitCustomDemo extends StatefulWidget {
  final AnimationController controller;

  const ExplicitCustomDemo({Key key, this.controller}) : super(key: key);
  @override
  _ExplicitCustomDemoState createState() => _ExplicitCustomDemoState();
}

class _ExplicitCustomDemoState extends State<ExplicitCustomDemo> {
  final _tween = AlignmentTween(begin: kStartAlign, end: kEndAlign)
      .chain(CurveTween(curve: kCurve));
  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: SampleView(),
      builder: (context, child) {
        return Align(
          child: child,
          alignment: _tween.evaluate(widget.controller),
        );
      },
      animation: _tween.animate(widget.controller),
    );
  }
}

class SampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://instagram.fsgn2-4.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/p750x750/126998371_3864954843549213_3328628181047196271_n.jpg?_nc_ht=instagram.fsgn2-4.fna.fbcdn.net&_nc_cat=109&_nc_ohc=Wngmuta2qUMAX_mpsLC&tp=1&oh=062f86e5eac4612ea6ff2b6d7a181481&oe=5FFBE7F2',
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.width / 4,
      fit: BoxFit.cover,
    );
  }
}

class SamplePainter extends CustomPainter {
  final double radius;

  SamplePainter({
    this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.purple;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    canvas.drawCircle(
      size.center(Offset.zero),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return (oldDelegate as SamplePainter).radius != radius;
  }
}

class ImplicitPainterDemo extends StatelessWidget {
  final double startRadius, endRadius;

  const ImplicitPainterDemo({Key key, this.startRadius, this.endRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: startRadius, end: endRadius),
      duration: kDuration,
      curve: kCurve,
      child: SampleView(),
      builder: (BuildContext context, double value, Widget child) {
        return Center(
          child: CustomPaint(
            painter: SamplePainter(radius: value),
          ),
        );
      },
    );
  }
}
