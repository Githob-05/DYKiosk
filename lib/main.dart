import 'package:dy_kiosk/widgets/mainsliverappber.dart';
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
    "name": "딸리라떼",
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const MainSliverAppBer(),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("어서오세요. 덕영고 북카페입니다.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text("개발자 - 3학년 10반 신승호"),
                    ],
                  )),
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
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
