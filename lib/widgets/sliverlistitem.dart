import 'package:dy_kiosk/pages/selectedDrinkPage.dart';
import 'package:flutter/material.dart';

class SliverListItem extends StatelessWidget {
  const SliverListItem(
      {super.key,
      required this.drinkClass,
      required this.drinkType,
      this.onTap});

  final List<Map> drinkClass;
  final String drinkType;
  final onTap;

  // final File image;

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "이 팝업은 화면의 절반 이상을 가립니다.",
                                style: TextStyle(fontSize: 18),
                              ),
                              // 다른 내용 추가
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SelectedDrinkPage(drinkData: drinkClass[index]),
                //   ),
                // );
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
}
