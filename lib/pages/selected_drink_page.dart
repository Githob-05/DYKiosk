import 'package:flutter/material.dart';

class SelectedDrinkPage extends StatefulWidget {
  final Map drinkData;

  const SelectedDrinkPage({Key? key, required this.drinkData})
      : super(key: key);

  @override
  _SelectedDrinkPageState createState() => _SelectedDrinkPageState();
}

class _SelectedDrinkPageState extends State<SelectedDrinkPage> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _requestTextController = TextEditingController();

  int drinkCount = 1;

  void _showNameInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('성함을 입력해주세요!'),
          content: TextField(
            controller: _nameTextController,
            decoration: const InputDecoration(hintText: "ex)홍길동"),
            keyboardType: TextInputType.text,
          ),
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
                String inputValue = _nameTextController.text;
                print(
                    "$inputValue, ${_requestTextController.text}, $drinkCount");
                inputValue = "";
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  _drinkCount(Size size) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: size.width * 0.5,
      decoration: BoxDecoration(
          color: Colors.brown.shade100,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (drinkCount == 1) {
                    drinkCount += 0;
                  } else {
                    drinkCount--;
                  }
                });
              },
              icon: const Icon(Icons.remove)),
          Text(drinkCount.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
          IconButton(
            onPressed: () {
              setState(() {
                if (drinkCount == 10) {
                  drinkCount += 0;
                } else {
                  drinkCount++;
                }
              });
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }

  void _showRequestInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('추가 요청사항을 입력해주세요.'),
          content: TextField(
            controller: _requestTextController,
            decoration: const InputDecoration(
                hintText:
                    "추가 요청사항을 입력해주세요.\n ex) 물 적게주세요, 얼음 조금 주세요, 커피 빼주세요 등"),
            maxLines: 5,
          ),
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
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      appBar: AppBar(
        flexibleSpace: Image.network(
          "https://blog.kakaocdn.net/dn/pW6x2/btrV0Q1FR5w/yugBLAZhQxVGlWTpWMQLVk/img.jpg",
          fit: BoxFit.cover,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          widget.drinkData["name"],
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.7,
          width: size.width * 0.6,
          decoration: BoxDecoration(
              color: const Color(0xfffefefe),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                )
              ]),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                        child: Image.asset(
                          widget.drinkData["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        child: _drinkCount(size),
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: size.height * 0.2,
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              spreadRadius: 2,
                              blurRadius: 20,
                            )
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: TextField(
                          style: const TextStyle(
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "추가 요청사항 있으면 입력해주세요!\n ex) 얼음 조금 주세요, 커피 빼주세요 등",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 18,
                            ),
                          ),
                          showCursor: false,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.2),
                      spreadRadius: 0.5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Map<String, dynamic> orderInfo = {
                            "name": widget.drinkData["name"], // 선택한 음료 이름
                            "count": drinkCount.toString(), // 선택한 음료 수량
                            "request":
                                _requestTextController.text, // 요청사항 (필요하면 추가)
                          };
                          Navigator.of(context).pop(orderInfo);
                        },

                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.brown.shade100,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.brown.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "목록 추가하기",
                                style: TextStyle(
                                  fontSize: size.height * 0.025,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
