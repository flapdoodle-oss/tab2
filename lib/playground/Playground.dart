import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tab2/logging.dart';

class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Playground"),
      ),
      body: MakeSquareWidget(
        children: false
            ? [const Text("Wooohooo")]
            : [
                Container(
                  color: Colors.green,
                  //width: 100.0,
                  //height: 100.0,
                  alignment: Alignment.center,
                  child: const Text("Wooohooo"),
                )
              ],
      ),
    );
  }
}

class _MakeSquareData extends ContainerBoxParentData<RenderBox>
    with ContainerParentDataMixin<RenderBox> {}

class MakeSquare extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _MakeSquareData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _MakeSquareData> {
  final _logger = Logging.newLogger();

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = _MakeSquareData();
  }

  @override
  bool get sizedByParent => false;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return firstChild!.computeDryLayout(constraints);
  }

  @override
  void performLayout() {
    visitChildren((child) {
      child.layout(constraints);
    });

    size = computeDryLayout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    visitChildren((child) {
      context.paintChild(child, offset);
    });
  }
}

class MakeSquareWidget extends MultiChildRenderObjectWidget {
  const MakeSquareWidget({super.key, required super.children});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MakeSquare();
  }
}
