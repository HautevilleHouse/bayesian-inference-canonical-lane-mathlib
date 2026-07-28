import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure LikelihoodPackage where
  observations : Type u
  parameterSpace : Type v
  likelihoodFunction : Type w
  wellDefined : Prop
  dominatedMeasure : Prop

structure LikelihoodEvidence (L : LikelihoodPackage) where
  wellDefinedClosed : L.wellDefined
  dominatedMeasureClosed : L.dominatedMeasure

def LikelihoodClosed (L : LikelihoodPackage) : Prop :=
  L.wellDefined ∧ L.dominatedMeasure

theorem likelihood_closed_from_evidence (L : LikelihoodPackage) (E : LikelihoodEvidence L) : LikelihoodClosed L := by
  exact And.intro E.wellDefinedClosed E.dominatedMeasureClosed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse