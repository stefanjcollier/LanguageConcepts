# module SS = Set.Make(String);;
module SS :
  sig
    type elt = String.t
    type t = Set.Make(String).t
    val empty : t
    val is_empty : t -> bool
    val mem : elt -> t -> bool
    val add : elt -> t -> t
    val singleton : elt -> t
    val remove : elt -> t -> t
    val union : t -> t -> t
    val inter : t -> t -> t
    val diff : t -> t -> t
    val compare : t -> t -> int
    val equal : t -> t -> bool
    val subset : t -> t -> bool
    val iter : (elt -> unit) -> t -> unit
    val fold : (elt -> 'a -> 'a) -> t -> 'a -> 'a
    val for_all : (elt -> bool) -> t -> bool
    val exists : (elt -> bool) -> t -> bool
    val filter : (elt -> bool) -> t -> t
    val partition : (elt -> bool) -> t -> t * t
    val cardinal : t -> int
    val elements : t -> elt list
    val min_elt : t -> elt
    val max_elt : t -> elt
    val choose : t -> elt
    val split : elt -> t -> t * bool * t
    val find : elt -> t -> elt
  end

type word = 
| Word of string
;;

type language =
 | Singleton of word
 | Cons of (word * language )
;;

type lang = 
| SS.empty;;
| Set.Make(String)
;;

type langFunc = 
| Union of (language * language)
| Intersection of (language * language)
| Substraction of (language * language)
;;

type wordFunc =
| Concat of (word * word)
;;

let handleWordFunc = function
| Concat (Word w1 , Word w2) -> Word(w1^w2)