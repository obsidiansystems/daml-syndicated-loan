# Release log for syndicated-lending-capstone

## 0.2.0.0 - 2023-05-11

* *Breaking change*: Refactor some of the many-parameter scripts to take records
* *Breaking change*: Remove unused "years" field, which is subsumed in the period data structure
* *Breaking change*: Remove agent field from LoanApplicationProcess, since it is present as a subfield of another field
* *Breaking change*: Underwriter must now sign all underwriting disclosures
* Improve documentation
* Add additional ensure clauses to:
  * Loan application
  * Underwriting result
* Add tests for
  * Underwriting result
  * Negative loan amounts
  * Mandate letter rejection
* Fix DAML Hub deployment
## 0.1.0.0 - 2023-05-11

* Implement base syndicated loan including:
  * Pre-origination setup
  * Origination
  * Distribution of funds
  * Repayment on schedule
