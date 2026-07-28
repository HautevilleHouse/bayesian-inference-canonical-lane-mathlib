import BayesianInferenceCanonicalLaneLean.PosteriorComputation

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure InferenceEnginePackage {M : BayesianModelPackage}
    (P : PosteriorComputationPackage M) where
  samplingMethod : Type
  mcmcConvergence : Prop
  effectiveSampleSize : Prop

structure InferenceEngineEvidence {M : BayesianModelPackage}
    {P : PosteriorComputationPackage M} (I : InferenceEnginePackage P) where
  mcmcConvergenceClosed : I.mcmcConvergence
  effectiveSampleSizeClosed : I.effectiveSampleSize

def InferenceEngineClosed {M : BayesianModelPackage}
    {P : PosteriorComputationPackage M} (I : InferenceEnginePackage P) : Prop :=
  I.mcmcConvergence ∧ I.effectiveSampleSize

theorem inference_engine_closed_from_evidence
    {M : BayesianModelPackage} {P : PosteriorComputationPackage M}
    (I : InferenceEnginePackage P) (E : InferenceEngineEvidence I) :
    InferenceEngineClosed I := by
  exact And.intro E.mcmcConvergenceClosed E.effectiveSampleSizeClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse