import BayesianInferenceCanonicalLaneLean.PosteriorInferencePackage

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure MCMCAlgorithm where
  algorithmName : String
  proposalDistribution : Type u
  acceptanceCriterion : (Type v → ℝ) → Prop
  convergenceTheorem : Prop

structure MCMCEvidence (alg : MCMCAlgorithm) where
  convergenceTheoremClosed : alg.convergenceTheorem

def MCMCClosed (alg : MCMCAlgorithm) : Prop :=
  alg.convergenceTheorem

theorem mcmc_closed_from_evidence (alg : MCMCAlgorithm) (e : MCMCEvidence alg) : MCMCClosed alg := by
  exact e.convergenceTheoremClosed

structure MCMCPackage (pr : PriorFamily) (ℓ : LikelihoodFamily) (p : PosteriorDistribution pr ℓ) where
  algorithm : MCMCAlgorithm
  algorithmEvidence : MCMCEvidence algorithm
  targetPosterior : p
  samplesGenerated : Prop
  mixingDiagnostic : Prop

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse