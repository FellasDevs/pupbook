int calculateAge(DateTime birthDate) {
  final currentDate = DateTime.now();
  final ageInYears = currentDate.year - birthDate.year;

  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    return (ageInYears - 1);
  } else {
    return ageInYears;
  }
}
