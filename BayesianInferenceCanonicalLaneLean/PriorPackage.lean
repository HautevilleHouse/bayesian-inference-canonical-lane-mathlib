import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PriorPackage where
  parameterSpace : Type u
  priorDistribution : parameterSpace → ℝ
  proper : Prop
  hyperparameterConjugate : Prop

structure PriorEvidence (P : PriorPackage) where
  properClosed : P.proper
  hyperparameterConjugateClosed : P.hyperparameterConjugate

def PriorClosed (P : PriorPackage) : Prop :=
  P.proper ∧ P.hyperparameterConjugate

theorem prior_closed_from_evidence (P : PriorPackage) (E : PriorEvidence P) : PriorClosed P :=
  And.intro E.properClosed E.hyperparameterConjugateClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse
