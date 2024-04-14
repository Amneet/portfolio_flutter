class Education {
  const Education({
    required this.index,
    required this.image,
    required this.institution,
    required this.degree,
    required this.year,
    required this.location,
    required this.relevantCoursework,
  });

  final int index;
  final String image;
  final String institution;
  final String degree;
  final String year;
  final String location;
  final List<String> relevantCoursework;
}