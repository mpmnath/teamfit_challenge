// Image parser class to construct image url

class ImageParser {
  static String constructImageUrl(
    String partnerId,
    String productId,
    String imageName,
    String suffix,
  ) {
    return 'https://product-images.cdn.moebel.de/$partnerId/$productId-$imageName-366x275.$suffix?quality=85&format=webp';
  }
}
