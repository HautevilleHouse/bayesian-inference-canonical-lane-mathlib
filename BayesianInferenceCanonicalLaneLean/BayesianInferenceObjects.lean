import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure BayesianSpace where
  sampleSpace : Type
  sigmaAlgebra : Set (Set sampleSpace)
  probabilityMeasure : Prop

structure BayesianAdmittedObject where
  space : BayesianSpace
  priorSpecified : Prop
  likelihoodSpecified : Prop
  posteriorComputed : Prop
  conclusion : priorSpecified ∧ likelihoodSpecified ∧ posteriorComputed

def BayesianWitnessClosed (O : BayesianAdmittedObject) : Prop :=
  O.conclusion

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse