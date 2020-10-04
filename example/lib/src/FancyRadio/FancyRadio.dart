import 'package:flutter/material.dart';

class FancyRadio extends StatefulWidget {
  final List<String> label;
  final List<String> labelValue;
  final double radius;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final Color activeColor;
  final double labelSpacing;
  final double radioSpacing;
  final Axis radioDirection;
  final ValueChanged<String> onChanged;

  const FancyRadio({
    Key key,
    @required this.label,
    @required this.labelValue,
    @required this.onChanged,
    this.radius,
    this.activeBorderColor,
    this.inactiveBorderColor,
    this.activeColor,
    this.labelSpacing,
    this.radioSpacing,
    this.radioDirection,
  }) : super(key: key);

  @override
  _FancyRadioState createState() => _FancyRadioState();
}

class _FancyRadioState extends State<FancyRadio> {
  List<bool> check = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  double mainRadius = 10;

  void _publishSelection(selectedValue) {
    if (widget.onChanged != null) {
      widget.onChanged(selectedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> values = widget.labelValue;
    String value = widget.labelValue[0];

    return Flexible(
      child: ListView(
        scrollDirection: widget.radioDirection == null
            ? Axis.horizontal
            : widget.radioDirection,
        children: List.generate(widget.label.length, (index) {
          return Column(
            children: [
              Center(
                child: Row(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          check[index] = true;
                          value = values[index];
                        });
                        for (int c = 0; c < widget.label.length; c++) {
                          if (c == index && check[index] == true) {
                            setState(() {
                              check[c] = true;
                            });
                          } else {
                            setState(() {
                              check[c] = false;
                            });
                          }
                        }
                        _publishSelection(value);
                      },
                      child: CircleAvatar(
                        radius:
                        widget.radius == null ? mainRadius : widget.radius,
                        backgroundColor: widget.activeBorderColor != null &&
                            check[index] == true
                            ? widget.activeBorderColor
                            : widget.inactiveBorderColor != null
                            ? check[index] == true
                            ? widget.activeColor
                            : Colors.blue
                            : check[index] == true
                            ? Colors.blue
                            : Colors.black,
                        child: CircleAvatar(
                          radius: widget.radius == null
                              ? mainRadius - 1
                              : widget.radius - 1,
                          backgroundColor: Colors.white,
                          child: !check[index]
                              ? Padding(
                            padding: EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                          )
                              : Padding(
                            padding: EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              backgroundColor: widget.activeColor == null
                                  ? Colors.blue
                                  : widget.activeColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: widget.labelSpacing == null
                            ? 10
                            : widget.labelSpacing),
                    Text(widget.label[index]),
                    SizedBox(
                      width: widget.radioSpacing == null
                          ? 20
                          : widget.radioSpacing,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: widget.radioSpacing == null ? 10 : widget.radioSpacing,
              )
            ],
          );
        }),
      ),
    );
  }
}

