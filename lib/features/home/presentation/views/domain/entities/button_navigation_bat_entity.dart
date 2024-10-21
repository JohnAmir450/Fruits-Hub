class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});

  
}
List<BottomNavigationBarEntity> bottomNavigationBarList = [
    BottomNavigationBarEntity(
        activeImage: 'assets/images/bold_home.svg',
        inActiveImage: 'assets/images/home.svg',
        name: 'الرئيسية'),
    BottomNavigationBarEntity(
        activeImage: 'assets/images/bold_categories.svg',
        inActiveImage: 'assets/images/categories.svg',
        name: 'المنتجات'),
    BottomNavigationBarEntity(
        activeImage: 'assets/images/bold_shopping_cart.svg',
        inActiveImage: 'assets/images/shopping_cart.svg',
        name: 'سلة التسوق'),
    BottomNavigationBarEntity(
        activeImage: 'assets/images/bold_user.svg',
        inActiveImage: 'assets/images/user.svg',
        name: 'حسابي'),
  ];