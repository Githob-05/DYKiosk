import 'package:flutter/material.dart';

class SliverListItem extends StatelessWidget {
  const SliverListItem({
    super.key,
    required this.drinkClass,
    required this.drinkType,
  });

  final List<Map> drinkClass;
  final String drinkType;

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
                        padding: const EdgeInsets.all(100),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  drinkClass[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          left: 30,
                                        ),
                                        height: 200,
                                        child: ClipRRect(
                                          child: Image.asset(
                                              drinkClass[index]["image"],
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        height: 200,
                                        margin: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              drinkClass[index]["name"],
                                              style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.brown.withOpacity(0.8),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                        ),
                                      ),
                                      height: 100,
                                      child: const Text(
                                        "👨🏻‍🏫  선생님  👩🏻‍🏫",
                                        style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.brown.withOpacity(0.6),
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      height: 100,
                                      child: const Text(
                                        "👨🏻‍🎓  학생  👩🏻‍🎓",
                                        style: TextStyle(
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
