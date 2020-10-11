class Contacts {
  final int id;
  final String fullName;
  final int accountNumber;

  Contacts(this.id, this.fullName, this.accountNumber);

  @override
  String toString() {
    return 'Contacts{fullName: $fullName, accountNumber: $accountNumber}';
  }
}