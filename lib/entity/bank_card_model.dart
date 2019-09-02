import 'package:flutter/material.dart';

class CreditCardViewModel {
  /// 银行
  final String bankName;

  /// 银行Logo
  final String bankLogoUrl;

  /// 卡类型
  final String cardType;

  /// 卡号
  final String cardNumber;

  /// 卡片颜色
  final List<Color> cardColors;

  /// 有效期
  final String validDate;

  const CreditCardViewModel({
    this.bankName,
    this.bankLogoUrl,
    this.cardType,
    this.cardNumber,
    this.cardColors,
    this.validDate,
  });
}