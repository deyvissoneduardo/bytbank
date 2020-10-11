class Contacts {
  final String fullName;
  final int accountNumber;

  Contacts(this.fullName, this.accountNumber);

  @override
  String toString() {
    return 'Contacts{fullName: $fullName, accountNumber: $accountNumber}';
  }
}