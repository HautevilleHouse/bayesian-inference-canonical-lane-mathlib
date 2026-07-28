import BayesianInferenceCanonicalLaneLean.BayesianModel

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PriorDistributionPackage (M : BayesianModelPackage) where
  priorFamily : Type
  hyperparameters : Type
  conjugacyWithLikelihood : Prop
  supportCondition : Prop

structure PriorDistributionEvidence {M : BayesianModelPackage}
    (P : PriorDistributionPackage M) where
  conjugacyWithLikelihoodClosed : P.conjugacyWithLikelihood
  supportConditionClosed : P.supportCondition

def PriorDistributionClosed {M : BayesianModelPackage}
    (P : PriorDistributionPackage M) : Prop :=
  P.conjugacyWithLikelihood ∧ P.supportCondition

theorem prior_distribution_closed_from_evidence
    {M : BayesianModelPackage} (P : PriorDistributionPackage M)
    (E : PriorDistributionEvidence P) : PriorDistributionClosed P := by
  exact And.intro E.conjugacyWithLikelihoodClosed E.supportConditionClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse