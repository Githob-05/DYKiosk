import 'package:dy_kiosk/pages/selected_drink_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({super.key});

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

void _showRequestInputDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('주문하시겠습니까?'),
        actions: <Widget>[
          TextButton(
            child: const Text('취소'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('확인'),
            onPressed: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text("주문이 완료되었습니다."),
                  );
                },
              );
            },
          ),
        ],
      );
    },
  );
}

class _HomeState extends State<Home> {
  List<Map> orderList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 키보드 닫기 이벤트
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
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
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(left: 8),
                              alignment: Alignment.centerLeft,
                              color: Colors.white,
                              child: const Text(
                                "주문 목록",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: ListView.builder(
                                      itemCount: orderList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: size.height * 0.04,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin:
                                                      const EdgeInsets.all(3),
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.brown
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    orderList[index]["name"],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin:
                                                      const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.brown
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    orderList[index]["count"],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  margin:
                                                      const EdgeInsets.all(3),
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.brown
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    orderList[index]["request"],
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  margin:
                                                      const EdgeInsets.all(3),
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: IconButton(
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    onPressed: () {
                                                      orderList.remove(
                                                          orderList[index]);
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Builder(
                                              builder: (BuildContext context) {
                                            return Container(
                                              margin: const EdgeInsets.all(6),
                                              width: size.width,
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.brown
                                                      .withOpacity(0.5),
                                                ),
                                                onPressed: () {},
                                                child: const Text(
                                                  "취소",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Builder(
                                              builder: (BuildContext context) {
                                            return Container(
                                              margin: const EdgeInsets.all(6),
                                              width: size.width,
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.brown
                                                      .withOpacity(0.5),
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Center(
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical:
                                                                      size.height *
                                                                          0.3),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.all(10),
                                                                  child: Text("선택해주세요!"),
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child: TextButton(
                                                                          onPressed: () {  },
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            margin: EdgeInsets.all(10),
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.brown.shade200,
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                            height: size.height,
                                                                              child: Text("선생님", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                        TextButton(
                                                                          onPressed: () {  },
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            margin: EdgeInsets.all(10),
                                                                            decoration: BoxDecoration(
                                                                                color: Colors.brown.shade100,
                                                                                borderRadius: BorderRadius.circular(20)
                                                                            ),
                                                                            height: size.height,
                                                                            child: Text("학생", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Text(
                                                  "주문하기",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
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
                  child: SizedBox(
                    height: size.height * 0.03,
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
        ),
      ),
    );
  }

  SliverListItem({required List<Map> drinkClass, required String drinkType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(drinkType,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                final orderInfo = await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => SelectedDrinkPage(
                            drinkData: drinkClass[index],
                          )),
                );

                if (orderInfo != null) {
                  setState(() {
                    orderList.add(orderInfo);
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30)),
                        child: Image.asset(drinkClass[index]["image"],
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text(drinkClass[index]["name"]),
                          Text("${drinkClass[index]["price"]}원")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            itemCount: drinkClass.length,
          ),
        ),
      ],
    );
  }

  void selectStudentTeacher(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
  }

  void teacherOrderDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('주문하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("주문이 완료되었습니다."),
                    );
                  },
                );
              },
            ),
          ],
        );
      },
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
