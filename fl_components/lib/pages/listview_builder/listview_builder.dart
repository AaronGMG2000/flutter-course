import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListviewBuilderPage extends StatefulWidget {
  const ListviewBuilderPage({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderPage> createState() => _ListviewBuilderPageState();
}

class _ListviewBuilderPageState extends State<ListviewBuilderPage> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  ScrollController scrollControler = ScrollController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollControler.addListener(() async {
      if ((scrollControler.position.pixels + 500) >=
          scrollControler.position.maxScrollExtent) {
        await fetchData();
      }
    });
  }

  void _loadMore() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    _loadMore();
    isLoading = false;
    setState(() {});
    if (scrollControler.position.pixels + 100 <=
        scrollControler.position.maxScrollExtent) return;
    scrollControler.animateTo(
      scrollControler.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollControler,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    placeholder:
                        const AssetImage("assets/images/jar-loading.gif"),
                    image: NetworkImage(
                        "https://picsum.photos/500/300?image=${imagesIds[index]}"),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            if (isLoading)
              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon(),
              )
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CircularProgressIndicator(color: AppTheme.primary),
    );
  }
}
