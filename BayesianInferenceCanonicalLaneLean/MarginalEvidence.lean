import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceCanonicalLaneLean.PriorModel
import HautevilleHouse.BayesianInferenceCanonicalLaneLean.LikelihoodFunction

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure MarginalEvidencePackage {P : PriorPackage} {L : LikelihoodPackage} where
  marginalLikelihood : Type u
  integralConverges : Prop
  modelEvidenceWellDefined : Prop

structure MarginalEvidenceEvidence {P : PriorPackage} {L : LikelihoodPackage}
    (M : MarginalEvidencePackage P L) where
  integralConvergesClosed : M.integralConverges
  modelEvidenceWellDefinedClosed : M.modelEvidenceWellDefined

def MarginalEvidenceClosed {P : PriorPackage} {L : LikelihoodPackage}
    (M : MarginalEvidencePackage P L) : Prop :=
  M.integralConverges ∧ M.modelEvidenceWellDefined

theorem marginal_evidence_closed_from_evidence {P : PriorPackage} {L : LikelihoodPackage}
    (M : MarginalEvidencePackage P L) (E : MarginalEvidenceEvidence M) : MarginalEvidenceClosed M := by
  exact And.intro E.integralConvergesClosed E.modelEvidenceWellDefinedClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse