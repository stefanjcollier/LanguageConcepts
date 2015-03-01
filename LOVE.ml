type word = 
 | Word of string
 | Concat of (word * word)
;;

type language =
 | EmptySet  
 | Cons of (string * language)
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


let handleFunc w : word = function
| Concat (Word w1 , Word w2) -> Word(w1^w2)
;;

let tidy inp = 
	let aux inp =
		let pos = String.index inp ':' in
	String.concat (String.sub inp 0 pos) (String.sub inp (pos+1) (String.length - pos))
in
	if String.contains inp ':'
	then 
		tidy aux inp
	else
		inp
;;