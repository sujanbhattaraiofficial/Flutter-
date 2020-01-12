import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String initialText, finalText;
  final ButtonStyle buttonStyle;
  final IconData iconData;
  final double iconSize;
  final Duration animationDuration;
  final Function onTabDone;

  AnimatedButton(
      {this.initialText,
      this.finalText,
      this.buttonStyle,
      this.iconData,
      this.iconSize,
      this.onTabDone,
      this.animationDuration});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  ButtonState _currentState;
  Duration _smallDuration; // indicate how much time to stay animation.
  Animation<double> _scaleTransition;

  @override
  void initState() {
    super.initState();
    _currentState = ButtonState.SHOW_ONLY_TEXT;
    _smallDuration = Duration(
        milliseconds: (widget.animationDuration.inMilliseconds * 0.2).round());
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationController.addListener(() {
      double _controllerValue = _animationController.value;
      if (_controllerValue < 0.5) {
        setState(() {
          _currentState = ButtonState.SHOW_ONLY_ICON;
        });
      } else if (_controllerValue > 0.5) {
        setState(() {
          _currentState = ButtonState.SHOW_ICON_AND_ICON;
        });
      }
    });

    _animationController.addStatusListener((currentStatus) {
      if (currentStatus == AnimationStatus.completed) {
        return widget.onTabDone();
      }
    });
    _scaleTransition =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.buttonStyle.borderRadius)),
      elevation: widget.buttonStyle.elevation,
      child: InkWell(
        onTap: () {
          _animationController.forward();
        },
        child: AnimatedContainer(
          duration: _smallDuration,
          decoration: BoxDecoration(
            color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                    _currentState == ButtonState.SHOW_ICON_AND_ICON)
                ? widget.buttonStyle.secondaryColor
                : widget.buttonStyle.primaryColor,
            border: Border.all(
              color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                      _currentState == ButtonState.SHOW_ICON_AND_ICON)
                  ? Colors.green.shade600
                  : Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.buttonStyle.borderRadius)),
          ),
          padding: EdgeInsets.symmetric(
              vertical: (_currentState == ButtonState.SHOW_ONLY_ICON)
                  ? MediaQuery.of(context).size.height * 0.007
                  : MediaQuery.of(context).size.height * 0.014,
              horizontal: 10.0),
          child: AnimatedSize(
            vsync: this,
            duration: _smallDuration,
            curve: Curves.easeIn,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                (_currentState == ButtonState.SHOW_ONLY_ICON ||
                        _currentState == ButtonState.SHOW_ICON_AND_ICON)
                    ? Center(
                        child: Icon(
                          widget.iconData,
                          size: widget.iconSize,
                          color: Colors.green.shade600,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: (_currentState == ButtonState.SHOW_ICON_AND_ICON)
                      ? 5.0
                      : null,
                ),
                getText(),
                (_currentState == ButtonState.SHOW_ONLY_TEXT)
                    ? Center(
                        // child: getText(),
                        )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getText() {
    if (_currentState == ButtonState.SHOW_ONLY_TEXT) {
      return Text(
        widget.initialText,
        style: widget.buttonStyle.initialTextStyle,
      );
    } else if (_currentState == ButtonState.SHOW_ONLY_ICON) {
      return Container();
    } else if (_currentState == ButtonState.SHOW_ICON_AND_ICON) {
      return ScaleTransition(
        scale: _scaleTransition,
        child: Text(
          widget.finalText,
          style: widget.buttonStyle.finalTextStyle,
        ),
      );
    }
  }
}

class ButtonStyle {
  final TextStyle initialTextStyle, finalTextStyle;
  final Color primaryColor, secondaryColor;
  final double elevation, borderRadius;

  ButtonStyle(
      {this.initialTextStyle,
      this.finalTextStyle,
      this.primaryColor,
      this.borderRadius,
      this.secondaryColor,
      this.elevation});
}

enum ButtonState {
  SHOW_ONLY_TEXT,
  SHOW_ONLY_ICON,
  SHOW_ICON_AND_ICON,
}
