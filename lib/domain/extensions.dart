import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardFormater {
  static var cardFormater = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
  );
  static var dataFormater = MaskTextInputFormatter(
    mask: '##',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
