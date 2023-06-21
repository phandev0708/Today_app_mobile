// Khai báo thư viện
import 'package:flutter/material.dart';

import 'widgets/card_body_widget.dart';

// Hàm main chạy ứng dụng
void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Bài tập 1',
              style: TextStyle(color: Colors.white, fontSize: 30)),
          // backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: 10,

                // shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CardBody(
                    index: index,
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      // color: Colors.white,
                      child: Column(
                        children: [
                          const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nhập công việc',
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Thêm công việc')),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ));
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  // Hàm build để tạo giao diện
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const SingleChildScrollView(
        child: Text(
          'Giấu hết đi giọt lệ'
          '\nĐừng buồn em ơi'
          '\nPhải chăng kiếp sau lại gặp nhau'
          '\nChẳng có gì'
          '\nPhải buồn phiền ở trên môi'
          '\nVì.em, em chọn hết thôi'
          '\nThời con gái áo bà ba'
          '\nBước đi theo cha'
          '\nTrong xóm ngó ra là nhà anh'
          '\nTuổi thơ lớn dần'
          '\nNgười ta đến đưa em về'
          '\nTừ nay không còn thấy nhau'
          '\nThêm vòng hoa trên đầu'
          '\nNgười đâu còn nhớ đến cái người năm xưa'
          '\nGiữa buổi trưa trời mưa'
          '\nCây cầu tre vắng bóng một người'
          '\nThôi cách xa một đời'
          '\nThương nhớ thêm ngàn lời'
          '\nLà sông trôi nhanh'
          '\nLà em sẽ quên anh'
          '\nĐêm mồ côi'
          '\nVì tình mình yêu mình giữ'
          '\nCó còn chi đâu'
          '\nHứa chi vài câu'
          '\nĐể giờ đây hai đứa không thành'
          '\nThế thôi đành rồi'
          '\nAnh thấy sau này rồi'
          '\nLà sông trôi nhanh'
          '\nLà em sẽ quên anh'
          '\nSao em yêu lại khóc'
          '\nKhi em đi xa mà'
          '\nCon tim anh phút chốc'
          '\nKhi được nhận ra là'
          '\nLà bao nhiêu năm qua'
          '\nTình cảm từ đây'
          '\nĐôi ta phải phai nhòa'
          '\nAnh đâu có biết cầm viết'
          '\nCần thiết vẽ hình ai'
          '\nEm như một trang giấy trắng'
          '\nThì đâu có hình sai'
          '\nĐời em phiêu bạc'
          '\nAnh đây rất tiếc đã không còn em'
          '\nKhông còn may mắn, hai bàn tay trắng'
          '\nĐêm đường khuya vắng anh lại chờ em'
          '\nTình yêu dang dở rồi chi'
          '\nThời con gái áo bà ba'
          '\nBước đi theo cha'
          '\nTrong xóm ngó ra là nhà anh'
          '\nTuổi thơ lớn dần'
          '\nNgười ta đến đưa em về'
          '\nTừ nay không còn thấy nhau'
          '\nThêm vòng hoa trên đầu'
          '\nNgười đâu còn nhớ đến cái người năm xưa'
          '\nGiữa buổi trưa trời mưa'
          '\nCây cầu tre vắng bóng một người'
          '\nThôi cách xa một đời'
          '\nThương nhớ thêm ngàn lời'
          '\nLà sông trôi nhanh'
          '\nLà em sẽ quên anh'
          '\nĐêm mồ côi'
          '\nVì tình mình yêu mình giữ'
          '\nCó còn chi đâu'
          '\nHứa chi vài câu'
          '\nĐể giờ đây hai đứa không thành'
          '\nThế thôi đành rồi'
          '\nAnh thấy sau này rồi'
          '\nLà sông trôi nhanh'
          '\nLà em sẽ quên anh'
          '\nMột lòng thương nhớ người ta'
          '\nMong chờ ai'
          '\nDần xa bóng ai qua cầu'
          '\nMột mình cô đơn có ai chẳng buồn'
          '\nBuồn thì ngó bên sông'
          '\nChờ mong'
          '\nCó ai, có ai về không'
          '\nThêm vòng hoa trên đầu'
          '\nNgười đâu còn nhớ cái người năm xưa'
          '\nGiữa buổi trưa trời mưa'
          '\nCây cầu tre vắng bóng một người'
          '\nThôi cách xa một đời'
          '\nThương nhớ thêm ngàn lời'
          '\nLà sông trôi nhanh'
          '\nLà em sẽ quên anh'
          '\nĐêm mồ côi vì tình'
          '\nĐêm mồ côi vì tình',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
