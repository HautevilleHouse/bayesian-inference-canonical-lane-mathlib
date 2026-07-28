import BayesianInferenceCanonicalLaneLean.BayesianAdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure LikelihoodPackage (X : Type) (Θ : Type) where
  density : X → Θ → ℝ
  measurableX : ∀ θ, Measurable (λ x => density x θ)
  measurableΘ : ∀ x, Measurable (density x)
  integrable : ∀ x, ∫ (θ : Θ), density x θ ∂ (volume : Measure Θ) < ∞

structure LikelihoodEvidence (L : LikelihoodPackage X Θ) where
  measurableXClosed : L.measurableX
  measurableΘClosed : L.measurableΘ
  integrableClosed : L.integrable

def LikelihoodClosed (L : LikelihoodPackage X Θ) : Prop :=
  L.measurableX ∧ L.measurableΘ ∧ L.integrable

theorem likelihood_closed_from_evidence (L : LikelihoodPackage X Θ) (E : LikelihoodEvidence L) : LikelihoodClosed L :=
  And.intro E.measurableXClosed (And.intro E.measurableΘClosed E.integrableClosed)

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse