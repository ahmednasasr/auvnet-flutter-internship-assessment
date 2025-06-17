class BottomNavBarEntity {
  final String activeImage,InactiveImage;
  final String name;

  BottomNavBarEntity({
    required this.activeImage,
    required this.InactiveImage,
    required this.name,
  });
}

List<BottomNavBarEntity> get bottomNavBarItems => [
      BottomNavBarEntity(
        activeImage: "assets/images/bold/home.svg",
        InactiveImage: "assets/images/outlined/home.svg",
        name: "الرئيسيه",
      ),
      BottomNavBarEntity(
        activeImage: "assets/images/bold/product.svg",
        InactiveImage: "assets/images/outlined/product.svg",
        name: "المنتحات",
      ),
      BottomNavBarEntity(
        activeImage: "assets/images/bold/shopping-cart.svg",
        InactiveImage: "assets/images/outlined/shopping-cart.svg",
        name: "سله التسوق",
      ),
      BottomNavBarEntity(
        activeImage: "assets/images/bold/user.svg",
        InactiveImage: "assets/images/outlined/user.svg",
        name: "حسابي",
      ),
    ];