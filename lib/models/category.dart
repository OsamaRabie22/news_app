class Category {
  String id;
  String titel;
  String image;
  static String path = 'assets/images/category/'; // اجعل المتغير ثابتًا

  Category({required this.id, required this.titel, required this.image});

  static List<Category> getCategoryList(bool isDark) {
    return [
      Category(
        id: 'general',
        titel: 'General',
        image: isDark ? '${path}general.png' : '${path}general-1.png',

      ),
      Category(
        id: 'health',
        titel: 'Health',
        image: isDark ? '${path}health.png' : '${path}health-1.png',
      ),
      Category(
        id: 'sports',
        titel: 'Sports',
        image: isDark ? '${path}sport.png' : '${path}sport-1.png',
      ),
      Category(
        id: 'technology',
        titel: 'Technology',
        image: isDark ? '${path}technology.png' : '${path}technology-1.png',
      ),
      Category(
        id: 'science',
        titel: 'Science',
        image: isDark ? '${path}science.png' : '${path}science-1.png',
      ),
      Category(
        id: 'business',
        titel: 'Business',
        image: isDark ? '${path}business.png' : '${path}business-1.png',
      ),
      Category(
        id: 'entertainment',
        titel: 'Entertainment',
        image: isDark
            ? '${path}entertainment.png'
            : '${path}entertainment-1.png',
      ),
    ];
  }
}
