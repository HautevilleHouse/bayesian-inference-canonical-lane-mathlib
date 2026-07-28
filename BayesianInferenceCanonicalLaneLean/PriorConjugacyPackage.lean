import BayesianInferenceCanonicalLaneLean.BayesianAdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PriorFamily where
  familyName : String
  parameters : Type u
  density : parameters → (Type v → ℝ)

structure ConjugatePrior (ℓ : LikelihoodFamily) where
  prior : PriorFamily
  posteriorClosedForm : Prop
  posteriorFormula : String

structure ConjugacyEvidence {ℓ : LikelihoodFamily} (cp : ConjugatePrior ℓ) where
  posteriorClosedFormClosed : cp.posteriorClosedForm

def ConjugacyClosed {ℓ : LikelihoodFamily} (cp : ConjugatePrior ℓ) : Prop :=
  cp.posteriorClosedForm

theorem conjugacy_closed_from_evidence {ℓ : LikelihoodFamily} (cp : ConjugatePrior ℓ) (e : ConjugacyEvidence cp) : ConjugacyClosed cp := by
  exact e.posteriorClosedFormClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse