enum GenderType {
  male('male'),
  female('female'),
  other('other');

  const GenderType(this.name);

  final String name;

  static GenderType fromString(String gender) {
    if (gender == 'male') {
      return GenderType.male;
    } else if (gender == 'female') {
      return GenderType.female;
    }

    return GenderType.other;
  }
}
