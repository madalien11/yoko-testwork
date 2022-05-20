enum SocialMediaEnum {
  facebook,
  google,
}

String socialMediaIcon(SocialMediaEnum name) {
  switch (name) {
    case SocialMediaEnum.facebook:
      return "facebook";

    case SocialMediaEnum.google:
      return "google";

    default:
      return "facebook";
  }
}
