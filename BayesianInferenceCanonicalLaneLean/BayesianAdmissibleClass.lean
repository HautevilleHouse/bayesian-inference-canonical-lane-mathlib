import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure BayesianAdmittedObject where
  parameterSpace : Type u
  prior : Type v
  likelihood : Type w
  posterior : Type x
  posteriorComputed : Prop

structure AdmissibleClass where
  object : BayesianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.posteriorComputed ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse