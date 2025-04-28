import 'package:flutter/material.dart';
import 'package:vet_mobile_app/theme/text_styles.dart';
import 'package:vet_mobile_app/widgets/my_appbar.dart';
import 'package:vet_mobile_app/widgets/navigate_button.dart';

class VetListPage extends StatelessWidget {
  const VetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUtils.customAppBar(title: 'Ветеринар'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/veterinar.png'),
              const SizedBox(height: 20),
              // Имя доктора и опыт
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Имя доктора
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr.Асанов Асан',
                        style: TextStyles.textStyleInFlashScreen2.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Ветеринар',
                        style: TextStyles.buttonTextStyle.copyWith(
                          fontSize: 13,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  // Опыт
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Тажрыйба',
                          style: TextStyles.buttonTextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '7 жыл',
                          style: TextStyles.buttonTextStyle.copyWith(
                            fontSize: 13,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                width: 363,
                height: 224,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18, top: 13),
                      child: Text(
                        'Автобиография',
                        style: TextStyles.textStyleInFlashScreen2.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Lorem Ipsum i. Lorem Ipsum has been the industry's standard Lorem Ipsum is simply dummy text of the  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
                        style: TextStyles.textStyleInFlashScreen2.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: NavigateButton(
                  text: 'Билдирүү таштоо',
                  borderRadius: BorderRadius.circular(24),
                  minimumSize: Size(307, 48),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
