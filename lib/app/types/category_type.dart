enum CategoryType { cake, candy }

extension CategoryKeyword on CategoryType {
  String get keyword {
    switch (this) {
      case CategoryType.cake:
        return "cake";
      case CategoryType.candy:
        return "candy";
    }
  }
}