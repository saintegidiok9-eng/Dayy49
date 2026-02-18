abstract class Rule {
  bool evaluate(Applicant applicant);
}

class Applicant {
  final String name;
  final int age;
  final double income;
  final int creditScore;

  Applicant(this.name, this.age, this.income, this.creditScore);
}

class AgeRule implements Rule {
  @override
  bool evaluate(Applicant applicant) {
    return applicant.age >= 18;
  }
}

class IncomeRule implements Rule {
  @override
  bool evaluate(Applicant applicant) {
    return applicant.income >= 2000;
  }
}

class CreditScoreRule implements Rule {
  @override
  bool evaluate(Applicant applicant) {
    return applicant.creditScore >= 600;
  }
}

class LoanEngine {
  final List<Rule> rules;

  LoanEngine(this.rules);

  bool approve(Applicant applicant) {
    for (var rule in rules) {
      if (!rule.evaluate(applicant)) {
        return false;
      }
    }
    return true;
  }
}

void main() {
  Applicant applicant = Applicant("Ama", 25, 3000, 650);

  LoanEngine engine = LoanEngine([
    AgeRule(),
    IncomeRule(),
    CreditScoreRule(),
  ]);

  bool approved = engine.approve(applicant);

  print("Loan Approved: $approved");
}