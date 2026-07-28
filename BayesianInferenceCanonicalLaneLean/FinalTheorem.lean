import BayesianInferenceCanonicalLaneLean.BayesianModel

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

def ConstrainedBayesianClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bayesian_endgame (A : AdmissibleClass) : ConstrainedBayesianClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse