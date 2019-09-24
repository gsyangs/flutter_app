
class GoodsItem {
  final String goodsName;
  final String goodsImage;
  final double goodsPrice;
  final String goodsId;
  final String goodsSpec;
  final bool isSelect;
  final int minNumber;
  final int number;
  final int maxNumber;

  const GoodsItem({
    this.goodsId,
    this.goodsName,
    this.goodsImage,
    this.goodsPrice,
    this.goodsSpec,
    this.isSelect,
    this.minNumber,
    this.number,
    this.maxNumber,
  });
}