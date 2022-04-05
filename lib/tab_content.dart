import 'package:flutter/material.dart';
import 'package:my_app/provider.dart';
import 'package:provider/provider.dart';

final itemsList1 = List.generate(50, (index) => index);
final itemsList2 = List.generate(20, (index) => index);
final itemsList3 = List.generate(10, (index) => index);

class TabContent extends StatefulWidget {
  const TabContent({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _TabContentState createState() => _TabContentState();
}

class _TabContentState extends State<TabContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final offset = widget.index == 0
        ? context.watch<HeaderProvider>().offsetTab1
        : widget.index == 1
            ? context.watch<HeaderProvider>().offsetTab2
            : context.watch<HeaderProvider>().offsetTab3;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollStartNotification) {}
          if (scrollInfo is ScrollUpdateNotification) {
            final dy = scrollInfo.dragDetails?.delta.dy ?? 0;
            context.read<HeaderProvider>().updateHeaderHeight(dy);

            if (widget.index == 0) {
              context.read<HeaderProvider>().setOffsetTab1(-dy);
              context.read<HeaderProvider>().setOffsetTab2(0);
              context.read<HeaderProvider>().setOffsetTab3(0);
            }

            if (widget.index == 1) {
              context.read<HeaderProvider>().setOffsetTab1(0);
              context.read<HeaderProvider>().setOffsetTab2(-dy);
              context.read<HeaderProvider>().setOffsetTab3(0);
            }

            if (widget.index == 2) {
              context.read<HeaderProvider>().setOffsetTab1(0);
              context.read<HeaderProvider>().setOffsetTab2(0);
              context.read<HeaderProvider>().setOffsetTab3(-dy);
            }
          }
          if (scrollInfo is ScrollEndNotification) {
            final headerHeight = context.read<HeaderProvider>().headerHeight;
            if (headerHeight < maxHeight &&
                headerHeight > maxHeight - delta / 2) {
              context.read<HeaderProvider>().setHeaderHeight(maxHeight);
            } else {
              // context.read<HeaderProvider>().setHeaderHeight(minHeight);
            }
          }
          return false;
        },
        child: ListView.builder(
          padding: EdgeInsets.only(top: offset),
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.index == 0
              ? itemsList1.length
              : widget.index == 1
                  ? itemsList2.length
                  : itemsList3.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: SizedBox(
                height: 36,
                child: Column(
                  children: [
                    Text('$index'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
