import BayesianInferenceCanonicalLaneLean.LikelihoodModels
import BayesianInferenceCanonicalLaneLean.PriorDistributions

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure ModelEvidencePackage (X : Type) (Θ : Type) (P : PriorPackage Θ) (L : LikelihoodPackage X Θ) where
  evidence : X → ℝ
  marginalLikelihood : ∀ x, evidence x = ∫ (θ : Θ), L.density x θ * P.density θ ∂ (volume : Measure Θ)

structure ModelEvidenceEvidence (M : ModelEvidencePackage X Θ P L) where
  marginalLikelihoodClosed : M.marginalLikelihood

def ModelEvidenceClosed (M : ModelEvidencePackage X Θ P L) : Prop :=
  M.marginalLikelihood

theorem model_evidence_closed_from_evidence (M : ModelEvidencePackage X Θ P L) (E : ModelEvidenceEvidence M) : ModelEvidenceClosed M :=
  E.marginalLikelihoodClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse