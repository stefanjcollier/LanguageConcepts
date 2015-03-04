open Str;;

let tidy (inp:string) = 
	if String.contains inp ':'
	then 
		str.global_replace (str.regexp ":") inp ""
	else
		inp
;;

