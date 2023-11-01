import 'package:dy_kiosk/widgets/sliverlistitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Map> ades = [
  {
    "name": "애플망고 에이드",
    "price": 2000,
    "image": "assets/images/appleMangoAde.jpeg",
  },
  {
    "name": "청포도 에이드",
    "price": 2000,
    "image": "assets/images/whiteGrapeAde.jpeg",
  },
  {
    "name": "레몬 에이드",
    "price": 2000,
    "image": "assets/images/lemonAde.jpeg",
  },
  {
    "name": "복숭아 에이드",
    "price": 2000,
    "image": "assets/images/peachAde.jpeg",
  },
];

List<Map> americano = [
  {
    "name": "아메리카노",
    "price": 2000,
    "image": "assets/images/americano.jpeg",
  },
  {
    "name": "아이스 아메리카노",
    "price": 2000,
    "image": "assets/images/iceAmericano.jpeg",
  },
];

List<Map> latte = [
  {
    "name": "아이스 라떼",
    "price": 2000,
    "image": "assets/images/iceLatte.jpeg",
  },
  {
    "name": "카페라떼",
    "price": 2000,
    "image": "assets/images/cafeLatte.jpeg",
  },
  {
    "name": "녹차라떼",
    "price": 2000,
    "image": "assets/images/greenLatte.jpeg",
  },
  {
    "name": "딸기라떼",
    "price": 2000,
    "image": "assets/images/strawberryLatte.jpeg",
  },
];

List<Map> cocoa = [
  {
    "name": "핫초코",
    "price": 2000,
    "image": "assets/images/hotCocoa.jpeg",
  },
  {
    "name": "아이스초코",
    "price": 2000,
    "image": "assets/images/iceCocoa.jpeg",
  },
];

List<Map> milkTea = [
  {
    "name": "밀크티",
    "price": 2000,
    "image": "assets/images/hotMilkTea.jpeg",
  },
  {
    "name": "아이스 밀크티",
    "price": 2000,
    "image": "assets/images/milkTea.jpeg",
  },
];

List<Map> etc = [
  {
    "name": "미숫가루",
    "price": 2000,
    "image": "assets/images/grainPowderTea.jpeg",
  },
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text("덕영고 북카페"),
                background: Image(
                  image: NetworkImage(
                    "https://blog.kakaocdn.net/dn/pW6x2/btrV0Q1FR5w/yugBLAZhQxVGlWTpWMQLVk/img.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: TabBarDelegate(
                minHeight: 200,
                maxHeight: 200,
                child: Container(
                  height: size.height * 0.2,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          color: Colors.white,
                          child: const Text("주문 목록"),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.white,
                                child: ListView.builder(
                                  itemCount: 100,
                                  itemBuilder: (BuildContext ctx, int idx) {
                                    return Container(
                                      child: Text('Content Number ${idx}'),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SliverListItem(
                drinkClass: americano,
                drinkType: '커피',
              ),
            ),
            SliverToBoxAdapter(
              child: SliverListItem(
                drinkClass: latte,
                drinkType: '라떼',
              ),
            ),
            SliverToBoxAdapter(
              child: SliverListItem(
                drinkClass: ades,
                drinkType: '에이드',
              ),
            ),
            SliverToBoxAdapter(
              child: SliverListItem(
                drinkClass: cocoa,
                drinkType: '음료',
              ),
            ),
            SliverToBoxAdapter(
              child: SliverListItem(
                drinkClass: milkTea,
                drinkType: '밀크티',
              ),
            ),
            SliverToBoxAdapter(
              child: SliverListItem(
                drinkClass: etc,
                drinkType: '기타',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final Widget child;

  TabBarDelegate({
    required this.maxHeight,
    required this.minHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(TabBarDelegate oldDelegate) {
    return oldDelegate.maxHeight != maxHeight ||
        oldDelegate.minHeight != minHeight ||
        oldDelegate.child != child;
  }
}
