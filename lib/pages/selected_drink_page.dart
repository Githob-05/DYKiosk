import 'package:flutter/material.dart';

import '../main.dart';

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
                print("$inputValue, ${_requestTextController.text}, $drinkCount");
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

  _drinkCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                if (drinkCount == 0) {
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
              drinkCount++;
            });
          },
          icon: const Icon(
            Icons.add,
          ),
        )
      ],
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
                String inputValue = _requestTextController.text;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.3,
                      child: Image.asset(
                        widget.drinkData["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: _drinkCount(),
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                      width: size.width * 0.6,
                      child: TextField(
                        controller: _requestTextController,
                        decoration: const InputDecoration(
                          hintText:
                          "추가 요청사항을 입력해주세요.\n ex) 물 적게주세요, 얼음 조금 주세요, 커피 빼주세요 등",
                        ),
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: size.height * 0.12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.5,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        _showNameInputDialog(context);
                      },
                      child: Ink(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "선생님",
                              style: TextStyle(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        _showRequestInputDialog(context);
                      },
                      child: Ink(
                        color: Colors.white,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "학생",
                              style: TextStyle(
                                fontSize: size.height * 0.03,
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
    );
  }
}
