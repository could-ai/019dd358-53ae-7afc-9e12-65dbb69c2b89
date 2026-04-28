import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const BiologyNotebookApp());
}

class BiologyNotebookApp extends StatelessWidget {
  const BiologyNotebookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بنچینەکانی زیندەوەرزانی',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoKufiArabic', // A good fallback for Kurdish RTL
      ),
      home: const NotebookPage(),
    );
  }
}

class NotebookPage extends StatefulWidget {
  const NotebookPage({super.key});

  @override
  State<NotebookPage> createState() => _NotebookPageState();
}

class _NotebookPageState extends State<NotebookPage> {
  final GlobalKey _globalKey = GlobalKey();

  // Content for the notebook
  final List<NotebookSection> sections = [
    NotebookSection(
      title: '١. ترشە ناوکییەکان و بۆماوە (DNA & Genetics)',
      titleColor: Colors.red[800]!,
      points: [
        'DNA: ماددەی بۆماوەییە کە زانیارییەکانی لەش هەڵدەگرێت.',
        'جین (Gene): یەکەی بنەڕەتی بۆماوەیە، بەرپرسە لە گواستنەوەی سیفەتەکان.',
      ],
      pointColor: Colors.blue[900]!,
    ),
    NotebookSection(
      title: '٢. کۆئەندامی دەمار (Nervous System)',
      titleColor: Colors.purple[800]!,
      points: [
        'دەمارەخانە (Neuron): یەکەی پێکهاتن و فەرمانی کۆئەندامی دەمارە.',
        'ئەرک: گواستنەوەی خێرای پەیامەکان لە نێوان مێشک و ئەندامەکانی لەش.',
      ],
      pointColor: Colors.teal[900]!,
    ),
    NotebookSection(
      title: '٣. کوێرەڕژێنەکان (Endocrine System)',
      titleColor: Colors.orange[800]!,
      points: [
        'هۆرمۆنەکان: ماددەی کیمیایین ڕاستەوخۆ دەڕژێنە ناو خوێنەوە.',
        'ئەرک: ڕێکخستنی گەشە، زیندەچالاکی و هاوسەنگی ناوەکی لەش.',
      ],
      pointColor: Colors.brown[900]!,
    ),
    NotebookSection(
      title: '٤. بەرگری لەش (Immunity)',
      titleColor: Colors.green[800]!,
      points: [
        'خڕۆکە سپییەکان: سەربازی لەشن بۆ بەرەنگاربوونەوەی نەخۆشییەکان.',
        'دژەتەن (Antibody): پڕۆتینێکن بۆ لەناوبردنی بەکتریا و ڤایرۆسە بێگانەکان دروست دەکرێن.',
      ],
      pointColor: Colors.indigo[900]!,
    ),
    NotebookSection(
      title: '٥. زۆربوون و دابەشبوونی خانە',
      titleColor: Colors.pink[800]!,
      points: [
        'میتۆز (Mitosis): دابەشبوونی خانە بۆ گەشەکردن و نوێبوونەوە.',
        'میۆز (Meiosis): دابەشبوونی خانە بۆ دروستبوونی خانەی زاوزێ.',
      ],
      pointColor: Colors.deepOrange[900]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6EE), // Paper color
      appBar: AppBar(
        title: const Text(
          'دەفتەری زیندەوەرزانی',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // Right-to-Left for Kurdish
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800), // Max width for A4 aspect
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RepaintBoundary(
                  key: _globalKey,
                  child: CustomPaint(
                    painter: NotebookPainter(),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 40,
                        right: 60, // Margin for the notebook red line
                        left: 20,
                        bottom: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'بنچینەکانی زیندەوەرزانی - پۆلی ١٢',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[900],
                                shadows: const [
                                  Shadow(
                                    color: Colors.black12,
                                    offset: Offset(1, 1),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          ...sections.map((section) => Padding(
                                padding: const EdgeInsets.only(bottom: 24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      section.title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: section.titleColor,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ...section.points.map((point) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 6.0,
                                            right: 16.0,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '• ',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: section.pointColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  point,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: section.pointColor,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 40),
                          Center(
                            child: Text(
                              'هیوای سەرکەوتن بۆ پۆلی ١٢ ✨',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Instruct user how to save
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تکایە سکرین شۆتی شاشەکە بگرە بۆ ئەوەی وەک وێنە سەیڤ بێت لە مۆبایلەکەت.'),
              backgroundColor: Colors.teal,
              duration: Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: const Icon(Icons.camera_alt),
        label: const Text('سەیڤکردن'),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

class NotebookSection {
  final String title;
  final Color titleColor;
  final List<String> points;
  final Color pointColor;

  NotebookSection({
    required this.title,
    required this.titleColor,
    required this.points,
    required this.pointColor,
  });
}

class NotebookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF9F6EE)
      ..style = PaintingStyle.fill;

    // Draw background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw horizontal blue lines
    final linePaint = Paint()
      ..color = Colors.lightBlue.withOpacity(0.3)
      ..strokeWidth = 1.5;

    const double lineSpacing = 30.0;
    for (double i = 50; i < size.height; i += lineSpacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), linePaint);
    }

    // Draw vertical red margin line on the right (for RTL)
    final marginPaint = Paint()
      ..color = Colors.redAccent.withOpacity(0.6)
      ..strokeWidth = 2.0;

    final marginX = size.width - 50.0;
    canvas.drawLine(Offset(marginX, 0), Offset(marginX, size.height), marginPaint);
    // Double line
    canvas.drawLine(Offset(marginX - 4, 0), Offset(marginX - 4, size.height), marginPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
