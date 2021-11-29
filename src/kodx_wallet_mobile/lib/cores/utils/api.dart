class ApiEndpoints {
  static const baseUrl = 'https://kodx-wallet-backend.herokuapp.com';
  static const login = baseUrl + '/auth/login';
  static const signUp = baseUrl + '/auth/signup';
  static const forgotPassword = baseUrl + '/auth/forgot-password';
  static const resetPassword = baseUrl + '/auth/reset-password';

  static const getUser = baseUrl + '/user';
  static searchUser(String query, {String? lastUsername}) {
    if (lastUsername == null) {
      return baseUrl + '/user/search?query=$query';
    }
    return baseUrl + '/user/search?query=$query&last_username=$lastUsername';
  }

  static const getWallet = baseUrl + '/wallet';
  static fundWallet(String txId) => baseUrl + '/wallet/fund?txId=$txId';
  static getTransactionHistory(int limit, {int? lastDocTime}) {
    if (lastDocTime == null) {
      return baseUrl + '/wallet/history?limit=$limit';
    }
    return baseUrl +
        '/wallet/history?limit=$limit&last_doc_timestamp=$lastDocTime';
  }
}
