import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PosteriorPackage {P : PriorPackage} {L : LikelihoodPackage P} where
  posteriorDistribution : L.dataSpace → P.parameterSpace → ℝ
  conjugacyClosed : Prop
  consistencyUnderSampling : Prop

structure PosteriorEvidence {P : PriorPackage} {L : LikelihoodPackage P} (Q : PosteriorPackage P L) where
  conjugacyClosedClosed : Q.conjugacyClosed
  consistencyUnderSamplingClosed : Q.consistencyUnderSampling

def PosteriorClosed {P : PriorPackage} {L : LikelihoodPackage P} (Q : PosteriorPackage P L) : Prop :=
  Q.conjugacyClosed ∧ Q.consistencyUnderSampling

theorem posterior_closed_from_evidence {P : PriorPackage} {L : LikelihoodPackage P} (Q : PosteriorPackage P L) (E : PosteriorEvidence Q) : PosteriorClosed Q :=
  And.intro E.conjugacyClosedClosed E.consistencyUnderSamplingClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse
