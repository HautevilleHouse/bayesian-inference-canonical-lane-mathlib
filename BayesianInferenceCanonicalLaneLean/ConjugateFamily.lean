import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceCanonicalLaneLean

structure ConjugateFamily {P : PriorPackage} {L : LikelihoodPackage P} (Q : PosteriorPackage P L) where
  priorFamilyClosed : PriorClosed P
  likelihoodFamilyClosed : LikelihoodClosed L
  posteriorFamilyClosed : PosteriorClosed Q
  explicitUpdateFormula : Prop

structure ConjugateFamilyEvidence {P : PriorPackage} {L : LikelihoodPackage P} {Q : PosteriorPackage P L} (C : ConjugateFamily Q) where
  explicitUpdateFormulaClosed : C.explicitUpdateFormula

def ConjugateFamilyClosed {P : PriorPackage} {L : LikelihoodPackage P} {Q : PosteriorPackage P L} (C : ConjugateFamily Q) : Prop :=
  C.priorFamilyClosed ∧ C.likelihoodFamilyClosed ∧ C.posteriorFamilyClosed ∧ C.explicitUpdateFormula

theorem conjugate_family_closed_from_evidence {P : PriorPackage} {L : LikelihoodPackage P} {Q : PosteriorPackage P L} (C : ConjugateFamily Q) (E : ConjugateFamilyEvidence C) : ConjugateFamilyClosed C :=
  And.intro C.priorFamilyClosed (And.intro C.likelihoodFamilyClosed (And.intro C.posteriorFamilyClosed E.explicitUpdateFormulaClosed))

end BayesianInferenceCanonicalLaneLean
end HautevilleHouse
