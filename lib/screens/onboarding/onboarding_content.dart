class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Health Remainder",
    image: "assets/images/1-OnboardScreen.png",
    desc:
        "We will always remind your medication schedule. It is now our responsibility to protect your health.",
  ),
  OnboardingContents(
    title: "Your Caring Partner",
    image: "assets/images/2-OnboardScreen.png",
    desc:
        "We are not your regular doctor but we are more than a doctor. We will always remind your health process.",
  ),
  OnboardingContents(
    title: "Your Virtual Nurse",
    image: "assets/images/3-OnboardScreen.png",
    desc:
        "It is very difficult to take care of ownself, find your virtual nurse today to keep yourself healthy.",
  ),
];
