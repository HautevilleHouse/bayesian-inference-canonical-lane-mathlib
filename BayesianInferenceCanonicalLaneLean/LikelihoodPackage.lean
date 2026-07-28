import BayesianInferenceCanonicalLaneLean.PriorConjugacyPackage

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure LikelihoodFamily where
  distributionName : String
  parameterSpace : Type u
  dataSpace : Type v
  density : parameterSpace → dataSpace → ℝ

structure LikelihoodEvidence (ℓ : LikelihoodFamily) where
  densityPositive : ∀ θ x, ℓ.density θ x > 0
  integrable : ∀ θ, (∫ x, ℓ.density θ x) = 1

def LikelihoodClosed (ℓ : LikelihoodFamily) : Prop :=
  (∀ θ x, ℓ.density θ x > 0) ∧ (∀ θ, (∫ x, ℓ.density θ x) = 1)

theorem likelihood_closed_from_evidence (ℓ : LikelihoodFamily) (e : LikelihoodEvidence ℓ) : LikelihoodClosed ℓ := by
  exact And.intro e.densityPositive e.integrable

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse