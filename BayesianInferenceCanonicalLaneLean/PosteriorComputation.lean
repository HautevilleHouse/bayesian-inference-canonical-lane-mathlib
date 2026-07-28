import BayesianInferenceCanonicalLaneLean.BayesianModel

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PosteriorComputationPackage (M : BayesianModelPackage) where
  computationMethod : Type
  convergenceGuarantee : Prop
  errorBounds : Prop

structure PosteriorComputationEvidence {M : BayesianModelPackage}
    (P : PosteriorComputationPackage M) where
  convergenceGuaranteeClosed : P.convergenceGuarantee
  errorBoundsClosed : P.errorBounds

def PosteriorComputationClosed {M : BayesianModelPackage}
    (P : PosteriorComputationPackage M) : Prop :=
  P.convergenceGuarantee ∧ P.errorBounds

theorem posterior_computation_closed_from_evidence
    {M : BayesianModelPackage} (P : PosteriorComputationPackage M)
    (E : PosteriorComputationEvidence P) : PosteriorComputationClosed P := by
  exact And.intro E.convergenceGuaranteeClosed E.errorBoundsClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse