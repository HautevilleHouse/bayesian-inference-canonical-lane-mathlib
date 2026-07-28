import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceCanonicalLaneLean.PosteriorDistribution

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PredictivePackage {P : PriorPackage} {L : LikelihoodPackage} {Q : PosteriorPackage P L} where
  predictiveDistribution : Type u
  posteriorIntegrated : Prop
  wellNormalized : Prop

structure PredictiveEvidence {P : PriorPackage} {L : LikelihoodPackage} {Q : PosteriorPackage P L}
    (R : PredictivePackage P L Q) where
  posteriorIntegratedClosed : R.posteriorIntegrated
  wellNormalizedClosed : R.wellNormalized

def PredictiveClosed {P : PriorPackage} {L : LikelihoodPackage} {Q : PosteriorPackage P L}
    (R : PredictivePackage P L Q) : Prop :=
  R.posteriorIntegrated ∧ R.wellNormalized

theorem predictive_closed_from_evidence {P : PriorPackage} {L : LikelihoodPackage} {Q : PosteriorPackage P L}
    (R : PredictivePackage P L Q) (E : PredictiveEvidence R) : PredictiveClosed R := by
  exact And.intro E.posteriorIntegratedClosed E.wellNormalizedClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse