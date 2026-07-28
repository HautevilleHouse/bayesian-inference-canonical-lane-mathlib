import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceCanonicalLaneLean.PriorModel
import HautevilleHouse.BayesianInferenceCanonicalLaneLean.LikelihoodFunction

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PosteriorPackage {P : PriorPackage} {L : LikelihoodPackage} where
  posteriorDistribution : Type u
  bayesTheoremApplied : Prop
  properPosterior : Prop

structure PosteriorEvidence {P : PriorPackage} {L : LikelihoodPackage} (Q : PosteriorPackage P L) where
  bayesTheoremAppliedClosed : Q.bayesTheoremApplied
  properPosteriorClosed : Q.properPosterior

def PosteriorClosed {P : PriorPackage} {L : LikelihoodPackage} (Q : PosteriorPackage P L) : Prop :=
  Q.bayesTheoremApplied ∧ Q.properPosterior

theorem posterior_closed_from_evidence {P : PriorPackage} {L : LikelihoodPackage}
    (Q : PosteriorPackage P L) (E : PosteriorEvidence Q) : PosteriorClosed Q := by
  exact And.intro E.bayesTheoremAppliedClosed E.properPosteriorClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse