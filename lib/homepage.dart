import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:seb7a/constants/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

int colorHex = AppColors.darkRedColor;
int counter = 0;
int goal = 33;
int rep = 0;
bool isActive = false;
const List<String> list = <String>[
  'سبحان الله',
  'الحمد لله',
  'الله أكبر',
  'لا إله إلا الله',
  'اللهم صل علي سيدنا محمد',
  'استغفر الله',
  'لا حول ولا قوة إلا بالله'
];
String dropdownValue = list.first;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  resetToDefault({
    bool resetGoal = false,
  }) {
    setCount(counter = 0);
    setRep(rep = 0);
    resetGoal == true ? setGoal(goal = 33) : null;
  }

  setCount(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', value);
    getCount();
  }

  setRep(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('rep', value);
    getCount();
  }

  setGoal(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('goal', value);
    getCount();
  }

  setColor(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('color', value);
    getCount();
  }
  setWord(String word) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('word', word);
    getCount();
  }

  getCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
      rep = prefs.getInt('rep') ?? 0;
      goal = prefs.getInt('goal') ?? 33;
      colorHex = prefs.getInt('color') ?? AppColors.darkRedColor;
      dropdownValue = prefs.getString('word') ?? list.first ;
    });
  }

  @override
  void initState() {
    getCount();
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(colorHex);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            resetToDefault(resetGoal: true);
          },
          backgroundColor: mainColor,
          child: const Icon(Icons.restart_alt),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                child: Icon(
                    isActive ? Icons.color_lens : Icons.color_lens_outlined,
                    size: 27),
                onTap: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: mainColor,
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      'الهدف',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (goal > 1) {
                              resetToDefault();
                              setGoal(goal - 1);
                            }
                          },
                          icon: const Icon(
                            Icons.do_disturb_on,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '$goal',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            resetToDefault();
                            setGoal(goal + 1);
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              resetToDefault();
                              setGoal(goal = 10);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Text('10'),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              resetToDefault();
                              setGoal(goal = 33);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Text('33'),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              resetToDefault();
                              setGoal(goal = 100);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Text('100'),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              resetToDefault();
                              setGoal(goal = 1000);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Text('1000'),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              resetToDefault();
                              setGoal(goal + 100);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Text('100+'),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              resetToDefault();
                              setGoal(goal + 1000);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: const Text('1000+'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                          setWord(value);
                        });
                      },
                      value: dropdownValue,
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      underline: Container(
                        height: 2,
                        color: mainColor.withOpacity(0.5),
                      ),
                      elevation: 16,
                      alignment: Alignment.center,
                      icon:  Icon(Icons.arrow_drop_down_outlined,
                      color: mainColor,),
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(child: Text(value)),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$counter',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (counter >= goal) {
                            setRep(rep + 1);
                            setCount(counter = 1);
                            final assetsAudioPlayer = AssetsAudioPlayer();
                            assetsAudioPlayer.open(Audio('assets/vibrate.mp3'));
                          } else {
                            setCount(counter + 1);
                          }
                        });
                      },
                      child: CircularPercentIndicator(
                        animateFromLastPercent: true,
                        animation: true,
                        animationDuration: 450,
                        radius: 110.0,
                        lineWidth: 8.0,
                        percent: counter / goal,
                        center: Icon(
                          Icons.touch_app,
                          color: mainColor,
                          size: 65,
                        ),
                        progressColor: mainColor,
                        backgroundColor: mainColor.withOpacity(0.1),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      ' مرات التكرار : $rep',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      ' المجموع : ${rep * goal + counter}',
                      style: TextStyle(
                          color: mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Visibility(
                  visible: isActive,
                  child: Row(
                    children: [
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => const Color(AppColors.darkRedColor)),
                          value: AppColors.darkRedColor,
                          groupValue: colorHex,
                          onChanged: (val) {
                            setState(() {
                              setColor(val as int);
                            });
                          }),
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => const Color(AppColors.blackColor)),
                          value: AppColors.blackColor,
                          groupValue: colorHex,
                          onChanged: (val) {
                            setState(() {
                              setColor(val as int);
                            });
                          }),
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => const Color(AppColors.purpleColor)),
                          value: AppColors.purpleColor,
                          groupValue: colorHex,
                          onChanged: (val) {
                            setState(() {
                              setColor(val as int);
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
