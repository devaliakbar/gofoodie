part of 'custom_animation.dart';

class CustomAnimatedListView extends StatelessWidget {
  final IndexedWidgetBuilder buildRow;
  final int listLength;
  final CustomAnimationType customAnimationType;
  CustomAnimatedListView({@required this.buildRow, @required this.listLength, this.customAnimationType});

  final List<Widget> _tripTiles = [];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addToWidget(context);
    });

    Offset startingOffset = Offset(1, 0);
    if (customAnimationType == CustomAnimationType.leftToRight) {
      startingOffset = Offset(-1, 0);
    } else if (customAnimationType == CustomAnimationType.topToBottom) {
      startingOffset = Offset(0, -1);
    } else if (customAnimationType == CustomAnimationType.bottomToTop) {
      startingOffset = Offset(0, 1);
    }

    Tween<Offset> tween = Tween(begin: startingOffset, end: Offset(0, 0));

    return AnimatedList(
      key: _listKey,
      initialItemCount: _tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(tween),
          child: _tripTiles[index],
        );
      },
    );
  }

  void _addToWidget(BuildContext context) {
    Future ft = Future(() {});

    for (int i = 0; i < listLength; i++) {
      ft = ft.then((data) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _tripTiles.add(buildRow(context, i));
          _listKey.currentState.insertItem(_tripTiles.length - 1);
        });
      });
    }
  }
}
