import BayesianInferenceCanonicalLaneLean.BayesianAdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PriorPackage (Θ : Type) where
  density : Θ → ℝ
  support : Set Θ
  proper : ∫ (θ : Θ), density θ ∂ (volume : Measure Θ) = 1
  measurable : Measurable density

structure PriorEvidence (P : PriorPackage Θ) where
  properClosed : P.proper
  measurableClosed : P.measurable

def PriorClosed (P : PriorPackage Θ) : Prop :=
  P.proper ∧ P.measurable

theorem prior_closed_from_evidence (P : PriorPackage Θ) (E : PriorEvidence P) : PriorClosed P :=
  And.intro E.properClosed E.measurableClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse