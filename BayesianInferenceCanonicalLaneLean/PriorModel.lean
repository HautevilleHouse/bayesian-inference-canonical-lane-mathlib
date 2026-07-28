import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure PriorPackage where
  priorDistribution : Type u
  domain : Type v
  probabilityMeasure : Prop
  properPrior : Prop

structure PriorEvidence (P : PriorPackage) where
  properPriorClosed : P.properPrior

def PriorClosed (P : PriorPackage) : Prop :=
  P.properPrior

theorem prior_closed_from_evidence (P : PriorPackage) (E : PriorEvidence P) : PriorClosed P := by
  exact E.properPriorClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse