type word = 
 | Word of string
 | Concat of (word * word)
;;

type language =
 | EmptySet  
 | Cons of (word * language)
;;

type langFunc = 
| Union of (language * language)
| Intersection of (language * language)
| Substraction of (language * language)
| First of (int * language) 
| Last of  (int * language)
;;

type func = 
| Output of language
;;


let handleWordFunc = function
| Concat (Word w1 , Word w2) -> Word(w1^w2)
;;


