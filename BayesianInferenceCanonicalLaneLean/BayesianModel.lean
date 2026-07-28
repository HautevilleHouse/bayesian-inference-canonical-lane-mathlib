import BayesianInferenceCanonicalLaneLean.BayesianCore

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure BayesianModelPackage where
  priorDistribution : Type
  likelihoodFunction : Type
  priorProper : Prop
  likelihoodIntegrable : Prop
  modelIdentifiable : Prop

structure BayesianModelEvidence (M : BayesianModelPackage) where
  priorProperClosed : M.priorProper
  likelihoodIntegrableClosed : M.likelihoodIntegrable
  modelIdentifiableClosed : M.modelIdentifiable

def BayesianModelClosed (M : BayesianModelPackage) : Prop :=
  M.priorProper ∧ M.likelihoodIntegrable ∧ M.modelIdentifiable

theorem bayesian_model_closed_from_evidence (M : BayesianModelPackage) (E : BayesianModelEvidence M) :
    BayesianModelClosed M :=
  And.intro E.priorProperClosed
    (And.intro E.likelihoodIntegrableClosed E.modelIdentifiableClosed)

structure BayesianPosteriorPackage (M : BayesianModelPackage) where
  posteriorDistribution : Type
  posteriorProper : Prop
  posteriorCalibrated : Prop
  posteriorConsistent : Prop

structure BayesianPosteriorEvidence {M : BayesianModelPackage} (P : BayesianPosteriorPackage M) where
  posteriorProperClosed : P.posteriorProper
  posteriorCalibratedClosed : P.posteriorCalibrated
  posteriorConsistentClosed : P.posteriorConsistent

def BayesianPosteriorClosed {M : BayesianModelPackage} (P : BayesianPosteriorPackage M) : Prop :=
  P.posteriorProper ∧ P.posteriorCalibrated ∧ P.posteriorConsistent

theorem bayesian_posterior_closed_from_evidence {M : BayesianModelPackage}
    (P : BayesianPosteriorPackage M) (E : BayesianPosteriorEvidence P) :
    BayesianPosteriorClosed P :=
  And.intro E.posteriorProperClosed
    (And.intro E.posteriorCalibratedClosed E.posteriorConsistentClosed)

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse