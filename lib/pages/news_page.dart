import 'package:flutter/material.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> blogPosts = [
      {
        'title': 'Blog post 1',
        'subtitle': 'What is Lorem Ipsum Lorem Ipsum',
        'date': 'Posted on Jan 2',
        'image': 'assets/blog_post1.png',
      },
      {
        'title': 'Blog post 2',
        'subtitle': 'What is Lorem Ipsum Lorem Ipsum',
        'date': 'Posted on Jan 5',
        'image': 'assets/blog_post2.png',
      },
      {
        'title': 'Blog post 3',
        'subtitle': 'What is Lorem Ipsum Lorem Ipsum',
        'date': 'Posted on Jan 10',
        'image': 'assets/blog_post3.png',
      },
    ];

    return Scaffold(
      appBar: AppBarUtils.customAppBar(title: 'Жанылыктар'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              Text(
                'Тема',
                style: TextStyles.textStyleInFlashScreen2.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),

              // Описание
              Text(
                'remrem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faci ',
              ),
              const SizedBox(height: 30),

              // Изображение
              Image.asset('assets/Group21.png'),
              const SizedBox(height: 10),

              // Дата
              Text(
                'Posted on Jan 14',
                style: const TextStyle(
                  color: Color(0xff959595),
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 15),

              // Заголовок для списка
              Text(
                'Блогдор',
                style: TextStyles.textStyleInFlashScreen2.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Список блогов
              ListView.builder(
                shrinkWrap:
                    true, // Позволяет ListView корректно работать внутри ScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // Отключает прокрутку внутри ListView
                itemCount: blogPosts.length,
                itemBuilder: (context, index) {
                  final post = blogPosts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => NewsPage2(
                                title: post['title']!,
                                subtitle: post['subtitle']!,
                                image: post['image']!,
                              ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Изображение поста
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              post['image']!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),

                          // Текстовая информация
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post['title']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  post['subtitle']!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff959595),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  post['date']!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff959595),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsPage2 extends StatelessWidget {
  final String title, subtitle, image;

  const NewsPage2({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyles.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
