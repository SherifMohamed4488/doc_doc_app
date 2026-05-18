
class  ApiConstants{

  static const String apiBaseUrl = "https://vcare.integration25.com/api/";
  static const String login = "auth/login";
  static const String signup = "auth/register";


}

class ApiErrors {
  ApiErrors._();

  static const String noContent = "No content";
  static const String badRequestError = "Bad request, try again later";
  static const String unauthorizedError = "User is unauthorized";
  static const String forbiddenError = "Forbidden request";
  static const String notFoundError = "URL not found";
  static const String internalServerError = "Internal server error";

  static const String timeoutError = "Timeout error, try again later";
  static const String cacheError = "Cache error";
  static const String noInternetError = "Please check your internet connection";
  static const String defaultError = "Something went wrong, try again later";
}