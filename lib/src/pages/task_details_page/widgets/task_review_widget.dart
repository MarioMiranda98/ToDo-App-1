import 'package:flutter/material.dart';

class TaskReviewWidget extends StatefulWidget {
  final String title;
  final String description;
  final double containerHeight;

  TaskReviewWidget({
    this.title = 'Titulo',
    this.description = 'Descripción',
    this.containerHeight = 180.0
  });

  @override
  _TaskReviewWidgetState createState() => _TaskReviewWidgetState();
}

class _TaskReviewWidgetState extends State<TaskReviewWidget> with TickerProviderStateMixin {
  bool _containerDirection = false;
  bool _showInfo = false;
  late AnimationController _controller;
  late AnimationController _textController;
  late Animation<double> _containerHeight;
  late Animation<double> _textAnimation; 

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500)
    );

    _containerHeight = Tween(
      begin: 73.0,
      end: widget.containerHeight
    ).animate(
      CurvedAnimation(
        parent: _controller, 
        curve: Curves.decelerate
      )
    );

    _textAnimation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _textController, 
        curve: Curves.easeIn
      )
    );

    super.initState();
  }

  @override
  void dispose() { 
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () {
            if(!_containerDirection) {
              _controller.forward();
              Future.delayed(const Duration(milliseconds: 500), () {
                _textController.forward();
                _showInfo = true;
              });
            } else {
              _textController.reverse();
              Future.delayed(const Duration(milliseconds: 500), () {
                _showInfo = false;
                _controller.reverse();
              });
            }

            setState(() { 
              _containerDirection = !_containerDirection;
            });
          },
          child: Container(
            width: size.width * 0.9,
            height: _containerHeight.value,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.touch_app,
                        size: 20.0,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: _showInfo ? 10.0 : 0.0),
                !_showInfo ? Container() : _buildText(widget.description, theme),
                SizedBox(height: _showInfo ? 10.0 : 0.0),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildText(String text, ThemeData theme) {
    return AnimatedBuilder(
      animation: _textController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _textAnimation.value,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.primary
            ),
            textAlign: TextAlign.justify,
          ),
        );
      }
    );
  }
}