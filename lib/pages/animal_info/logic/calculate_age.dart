class AgeCalculator {
  static String calculateAge(DateTime? birthDate) {
    if (birthDate == null) return 'N/A';

    final currentDate = DateTime.now();
    final ageInYears = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      return (ageInYears - 1).toString();
    } else {
      return ageInYears.toString();
    }
  }
}