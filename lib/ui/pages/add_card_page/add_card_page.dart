import 'dart:io';
import 'dart:math';
import 'package:cat_trivia/domain/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_formatter/money_formatter.dart';
import '../../../infra/models/cards_model.dart';
import '../../../presentation/presenters/card_bloc/card_bloc.dart';
import '../../components/card_widget.dart';
import '../../components/custom_textform_comp.dart';
import '../../components/styles.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  late TextEditingController nameController;
  late TextEditingController cardNumberController;
  late TextEditingController cardMonthController;
  late TextEditingController cardYearController;
  final cropKey = GlobalKey<CropState>();
  Color currentColor = Colors.blue;

  @override
  void initState() {
    nameController = TextEditingController();
    cardNumberController = TextEditingController();
    cardMonthController = TextEditingController();
    cardYearController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Add Card",
              style: Style.semiBold16(size: 20.sp, color: Style.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  CardWidget(
                    isActiveIconButton: true,
                    imgFile: File(state.cardImage),
                    gradient: state.gradientValue,
                    color: currentColor,
                    name: nameController.text,
                    cardName: state.cardName,
                    cardNumber: cardNumberController.text,
                    month: cardMonthController.text,
                    year: cardYearController.text,
                    money: "10000",
                    onTapIcon: () => getImageAndCropper(context),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    controller: nameController,
                    title: "Enter your name",
                    hintText: "John",
                    onChanged: (value) => setState(
                      () => validator(context),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    onChanged: (value) => validator(context),
                    controller: cardNumberController,
                    formatter: [CardFormater.cardFormater],
                    title: "Enter Card number",
                    hintText: "**** **** **** ****",
                    error: state.cardNumberError == ''
                        ? null
                        : state.cardNumberError,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 160.w,
                        child: CustomTextField(
                          formatter: [CardFormater.dataFormater],
                          controller: cardMonthController,
                          title: "Month",
                          hintText: "11",
                          error:
                              state.monthError == '' ? null : state.monthError,
                          onChanged: (value) => validator(context),
                        ),
                      ),
                      SizedBox(
                        width: 160.w,
                        child: CustomTextField(
                          formatter: [CardFormater.dataFormater],
                          controller: cardYearController,
                          error: state.yearError == '' ? null : state.yearError,
                          title: "Year",
                          hintText: "23",
                          onChanged: (value) => validator(context),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Slider(
                      value: state.gradientValue,
                      onChanged: (double v) {
                        context.read<CardBloc>().add(
                              CardEvent.onChangedGradient(value: v),
                            );
                      }),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(fixedSize: Size(1.sw, 25.h)),
                    child: const Text("Select color"),
                    onPressed: () async {
                      showModalBottomSheet(
                        barrierColor: Colors.black.withOpacity(0.2),
                        context: context,
                        builder: (context) => Container(
                          margin: EdgeInsets.all(16.sp),
                          height: 340.h,
                          child: Column(
                            children: [
                              SizedBox(height: 8.h),
                              Text(
                                'Pick a color!',
                                style: Style.bold20(),
                              ),
                              SizedBox(height: 8.h),
                              ColorPicker(
                                pickerColor: Colors.blue,
                                enableAlpha: false,
                                colorPickerWidth: 180,
                                // ignore: deprecated_member_use
                                showLabel: false,
                                pickerAreaBorderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                onHistoryChanged: (b) {},
                                onColorChanged: (v) {
                                  currentColor = v;
                                  setState(() {});
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(1.sw, 25.h)),
                                child: const Text("Select"),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 140.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          state.isEnabled ? Style.grey : Colors.blue,
                      fixedSize: Size(1.sw, 25.h),
                    ),
                    child: const Text("Add Card"),
                    onPressed: () async {
                      if (!state.isEnabled) {
                        Navigator.pop(context);
                        final CardsModel cardsModel = CardsModel(
                          name: nameController.text,
                          cardName: state.cardName,
                          cardNumber: cardNumberController.text,
                          cardMonth: cardMonthController.text,
                          cardYear: cardYearController.text,
                          color: currentColor.value,
                          gradient: state.gradientValue,
                          image: state.cardImage,
                          money: MoneyFormatter(
                                  amount: Random().nextInt(100000).toDouble())
                              .output
                              .nonSymbol
                              .toString(),
                        );
                        context.read<CardBloc>().add(
                              CardEvent.addCard(cardsModel: cardsModel),
                            );
                      }
                    },
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void validator(BuildContext context) {
    setState(() {});
    context.read<CardBloc>().add(
          CardEvent.validateCard(
            name: nameController.text,
            cardNumber: cardNumberController.text,
            month: cardMonthController.text,
            year: cardYearController.text,
          ),
        );
  }

  void getImageAndCropper(BuildContext ctx) {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Crop Image"),
            content: Container(
              width: 1.sw / 2,
              height: 1.sw / 2,
              color: Colors.transparent,
              padding: const EdgeInsets.all(20.0),
              child: Crop(
                key: cropKey,
                image: FileImage(File(value!.path)),
                aspectRatio: 4.0 / 2.0,
              ),
            ),
            actions: [
              ButtonBar(children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                  onPressed: () async {
                    final crop = cropKey.currentState;
                    final area = crop?.area;
                    if (area == null) {
                      return;
                    }
                    final croppedFile = await ImageCrop.cropImage(
                      file: File(value.path),
                      area: crop!.area!,
                    );
                    Navigator.pop(context);
                    ctx.read<CardBloc>().add(
                          CardEvent.addImage(
                            image: croppedFile.path,
                          ),
                        );
                  },
                  child: const Text("OK"),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }
}
