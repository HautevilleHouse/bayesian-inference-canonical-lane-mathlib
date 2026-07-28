import BayesianInferenceCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse