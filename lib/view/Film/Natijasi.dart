import 'package:mymovie/core/constants/color.dart';
import 'package:flutter/material.dart';


class Natijasi extends StatelessWidget {
  const Natijasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.AppBar,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: AppColors.Icon_Text),
            ),
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                child: Image.asset(
                  "assets/treyler/teryler.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                    // Adjust padding as needed
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mahobhorat Hind seriali Barcha qismlar O'zbek tilida 2013-2014 Uzbekcha tarjima",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Wrap(
                          spacing: 10.0, // Bo'shliqlar orasidagi masofa
                          runSpacing: 10.0, // Qatorlar orasidagi masofa
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.flag,
                                    color: AppColors.Icon_Text,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("Aqsh",
                                      style: TextStyle(
                                          color: AppColors.Icon_Text)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.record_voice_over,
                                    color: Colors.green,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("Uz",
                                      style: TextStyle(color: Colors.green)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.timer_rounded,
                                    color: Colors.cyanAccent,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("2 soat",
                                      style:
                                          TextStyle(color: Colors.cyanAccent)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.create,
                                    color: Colors.deepPurple,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("15.07.2023",
                                      style:
                                          TextStyle(color: Colors.deepPurple)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.blue,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("#543",
                                      style: TextStyle(color: Colors.blue)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.save_sharp,
                                    color: Colors.blueGrey,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("Saqlab qo'yish",
                                      style: TextStyle(color: Colors.blueGrey)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.download_for_offline,
                                    color: Colors.indigo,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("Yuklab olish",
                                      style: TextStyle(color: Colors.indigo)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.movie_creation_outlined,
                                    color: Colors.orange,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("Treyler",
                                      style: TextStyle(color: Colors.orange)),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.AppBar,
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.play_circle_outline_sharp,
                                    color: Colors.red,
                                    size: 24.0,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text("Filmni ko'rish",
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            Container(
                              width: 370.0, // Chiziq uzunligi
                              child: Divider(
                                height: 24.0,
                                thickness: 2.0,
                                color: AppColors
                                    .BottomNavigationBarWidget_backgroundColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "FILM HAQIDA QISQACHA:",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Asosiy e'tibor ikkita klanga qaratilgan - Pandavalar va Kauravalar. Ular bir xil Kuru sulolasiga mansub, ammo ular orasidagi raqobat chegara bilmaydi. Pandava urug'i yorqin, mehribon, ilohiy tamoyilni o'zida mujassam etgan bo'lsa, Kaurava urug'i esa yovuzlik, hasad va beadablik markazidir. Xuddi shu sulolaning ikki tarmog'i o'rtasidagi raqobat hokimiyat, boylik, mamlakat poytaxti - Xastinapurga egalik qilish uchundir. Pandavalar oilasining eng to‘ng‘ichi va donosi Yudxishthir mamlakat qiroli bo‘lgandan so‘ng, Kauravalarning nafrat va g‘azabi barcha chegaralarni kesib o‘tadi: ular qabih va makkorona reja tuzadilar.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
      backgroundColor: AppColors.AppBar,
    );
  }
}
