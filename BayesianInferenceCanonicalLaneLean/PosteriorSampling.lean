import BayesianInferenceCanonicalLaneLean.PosteriorComputation

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure SamplingPackage (X : Type) (Θ : Type) (Post : PosteriorPackage X Θ P L) where
  sample : X → List Θ
  markovChain : Prop
  stationaryDistribution : ∀ x, stationaryDist (sample x) = Post.posterior x

structure SamplingEvidence (S : SamplingPackage X Θ Post) where
  markovChainClosed : S.markovChain
  stationaryDistributionClosed : S.stationaryDistribution

def SamplingClosed (S : SamplingPackage X Θ Post) : Prop :=
  S.markovChain ∧ S.stationaryDistribution

theorem sampling_closed_from_evidence (S : SamplingPackage X Θ Post) (E : SamplingEvidence S) : SamplingClosed S :=
  And.intro E.markovChainClosed E.stationaryDistributionClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse