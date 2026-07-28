import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceCanonicalLaneLean.MarginalEvidence

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure ModelComparisonPackage {P1 : PriorPackage} {L1 : LikelihoodPackage}
    {M1 : MarginalEvidencePackage P1 L1} {P2 : PriorPackage} {L2 : LikelihoodPackage}
    {M2 : MarginalEvidencePackage P2 L2} where
  bayesFactor : Type u
  ratioComputed : Prop
  modelSelectionValid : Prop

structure ModelComparisonEvidence {P1 : PriorPackage} {L1 : LikelihoodPackage}
    {M1 : MarginalEvidencePackage P1 L1} {P2 : PriorPackage} {L2 : LikelihoodPackage}
    {M2 : MarginalEvidencePackage P2 L2} (C : ModelComparisonPackage P1 L1 M1 P2 L2 M2) where
  ratioComputedClosed : C.ratioComputed
  modelSelectionValidClosed : C.modelSelectionValid

def ModelComparisonClosed {P1 : PriorPackage} {L1 : LikelihoodPackage}
    {M1 : MarginalEvidencePackage P1 L1} {P2 : PriorPackage} {L2 : LikelihoodPackage}
    {M2 : MarginalEvidencePackage P2 L2} (C : ModelComparisonPackage P1 L1 M1 P2 L2 M2) : Prop :=
  C.ratioComputed ∧ C.modelSelectionValid

theorem model_comparison_closed_from_evidence {P1 : PriorPackage} {L1 : LikelihoodPackage}
    {M1 : MarginalEvidencePackage P1 L1} {P2 : PriorPackage} {L2 : LikelihoodPackage}
    {M2 : MarginalEvidencePackage P2 L2} (C : ModelComparisonPackage P1 L1 M1 P2 L2 M2)
    (E : ModelComparisonEvidence C) : ModelComparisonClosed C := by
  exact And.intro E.ratioComputedClosed E.modelSelectionValidClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse