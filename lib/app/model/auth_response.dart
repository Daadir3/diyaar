class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final int expireInSeconds;
  final int userId;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expireInSeconds,
    required this.userId,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'];
    return AuthResponse(
      accessToken: result['accessToken'],
      refreshToken: result['refreshToken'],
      expireInSeconds: result['expireInSeconds'],
      userId: result['userId'],
    );
  }
}
