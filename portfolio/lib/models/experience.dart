class Experience {
  const Experience({
    required this.index,
    required this.image,
    required this.organization,
    required this.position,
    required this.year,
    required this.location,
    required this.responsibilities,
    required this.achievements,
  });

  final int index;
  final String image;
  final String organization;
  final String position;
  final String year;
  final String location;
  final List<String> responsibilities;
  final List<String> achievements;
}