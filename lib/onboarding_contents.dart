class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Mixify Radio excels in delivering Live Music",
    image: "assets/images/image1.png",
    desc: "Mixify radio offers a sense of spontaneity and authenticity.",
  ),
  OnboardingContents(
    title: "Listen to Live Music 24*7",
    image: "assets/images/image2.png",
    desc:
        "Mixify radio remains a popular and influential medium for delivering Live Music.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/images/image3.png",
    desc: "This localized content helps to strengthen bonds.",
  ),
];
