import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {

  ///All the [Widget] on this Carousel.
  final List children;

  ///Returns [children]`s [lenght].
  int get childrenCount => children.length;

  ///The transition animation timing curve. Default is [Curves.ease]
  final Curve animationCurve;

  ///The transition animation duration. Default is 250ms.
  final Duration animationDuration;

  // Enable or Disable the indicator (dots). Default is true
  final bool showIndicator;

  //Enable/Disable radius Border for the images. Default is false
  final bool borderRadius;

  //Border Radius of the images. Default is [Radius.circular(8.0)]
  final Radius radius;

  //Move the Indicator From the Bottom
  final double moveIndicatorFromBottom;

  //Remove the radius bottom from the indicator background. Default false
  final bool noRadiusForIndicator;

  //Padding Size of the background Indicator. Default is 20.0
  final double indicatorBgPadding;

  // The base size of the dots. Default is 8.0
  final double dotSize;

  // The distance between the center of each dot. Default is 25.0
  final double dotSpacing;

  // The Color of each dot. Default is Colors.grey[300]
  final Color dotColor;

  // The Color of selected dot. Default is Colors.grey
  final Color dotSelectedColor;

  // The background Color of the dots. Default is [Colors.transparent]
  final Color dotBgColor;

  Carousel({
    this.children,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 250),
    this.showIndicator = true,
    this.borderRadius = false,
    this.radius,
    this.indicatorBgPadding = 20.0,  
    this.moveIndicatorFromBottom = 0.0,
    this.noRadiusForIndicator = false,
    this.dotSize = 8.0,
    this.dotSpacing = 25.0,
    this.dotColor = const Color(0xFFCCCCCC),
    this.dotSelectedColor = Colors.grey,
    this.dotBgColor,
  }) :
        assert(children != null),
        assert(children.length > 1),
        assert(animationCurve != null),
        assert(animationDuration != null);


  @override
  State createState() => new _CarouselState();
}

class _CarouselState extends State<Carousel> with SingleTickerProviderStateMixin {
  TabController _controller;
  ///Actual index of the displaying Widget
  int get actualIndex => _controller.index;

  int selectedIndex = 0;

  ///Returns the calculated value of the next index.
  int get nextIndex {
    var nextIndexValue = actualIndex;

    if(nextIndexValue < _controller.length - 1)
      nextIndexValue++;
    else
      nextIndexValue = 0;

    return nextIndexValue;
  }

  @override
  void initState() {
    super.initState();

    _controller = new TabController(length: widget.childrenCount, vsync: this);
    _controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      selectedIndex = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
        new TabBarView(
          children: widget.children.map((widget) => new Center(child: widget,)).toList(),
          controller: this._controller,
        ),
        widget.showIndicator ? new Positioned(
            bottom: widget.moveIndicatorFromBottom,
            left: 0.0,
            right: 0.0,
            child: new Container(
              decoration: new BoxDecoration(
                color: widget.dotBgColor == null ? Colors.transparent : widget.dotBgColor,
                borderRadius: widget.borderRadius ? (widget.noRadiusForIndicator ? null : new BorderRadius.only(
                    bottomLeft: widget.radius != null ? widget.radius : new Radius.circular(8.0),
                    bottomRight: widget.radius != null ? widget.radius : new Radius.circular(8.0)
                )) : null,
              ),
              padding: new EdgeInsets.all(widget.indicatorBgPadding),
              child: new Center(
                child: new DotsIndicator(
                  controller: _controller,
                  itemCount: widget.children.length,
                  color: widget.dotColor,
                  selectedIndex: selectedIndex,
                  selectedColor: widget.dotSelectedColor,
                  dotSize: widget.dotSize,
                  dotSpacing: widget.dotSpacing,
                ),
              ),
            ),
          ) : new Container(),
        ],
      )
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends StatelessWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.color,
    this.dotSize,
    this.selectedIndex,
    this.selectedColor,
    this.dotSpacing
  });

  // The PageController that this DotsIndicator is representing.
  final TabController controller;

  // The number of items managed by the PageController
  final int itemCount;

  // Selected index
  final int selectedIndex;

  // The color of the dots.
  final Color color;

    // The color of the dots.
  final Color selectedColor;

  // The base size of the dots
  final double dotSize;

  // The distance between the center of each dot
  final double dotSpacing;

  Widget _buildDot(int index) {
    return new Container(
      width: dotSpacing,
      child: new Center(
        child: new Material(
          color: index == selectedIndex ? selectedColor : color,
          type: MaterialType.circle,
          child: new Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}