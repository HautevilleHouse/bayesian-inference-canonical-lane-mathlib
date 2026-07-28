import BayesianInferenceCanonicalLaneLean.BayesianAdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.posteriorComputed

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.posteriorComputed

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse