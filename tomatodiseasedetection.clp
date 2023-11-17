         CLIPS (6.30 3/17/15)
CLIPS> (defrule fusarium-wilt
(or(symptom wilting-during-day)
(symptom yellow-leaves))=>
(printout t"Possible Fusarium wilt infection." crlf))
CLIPS> (defrule powdery-mildew
(or(symptom yellow-spots)
(symptom dusty-white-leaves))=>
(printout t"Possible Powdery Mildew infection."crlf))
CLIPS> (defrule anthracnose
(or(symptom water-soaked-spots)
(symptom sunken-fruit))=>
(printout t"Possible Anthracnose infection."crlf))
CLIPS> (defrule septorial-leaf-spot
(or(symptom brown-spots)
(symptom gray-leaf-margin))=>
(printout t"Possible Septorial leaf infection."crlf))
CLIPS> (defrule botrytis
(or(symptom brown-mold)
(symptom grayish-leaves))=>
(printout t"Possible Botrytis infection."crlf))
CLIPS> (defrule bacterial-speck
(or(symptom black-spots)
(symptom brown-spots-on-leaf-margin))=>
(printout t"Possible Bacterial speck infection."crlf))
CLIPS> (defrule southern-blight
(or(symptom stem-lesions)
(symptom white-mycelia))=>
(printout t"Possible Southern blight infection."crlf))
CLIPS> (defrule no-match
  =>
  (printout t "No matching disease found." crlf))
CLIPS> (defglobal ?*symptom* = "")
CLIPS> (defrule get-symptom
  (declare (salience -10))
  =>
  (printout t "Enter a symptom (e.g., yellow-spots, brown-spots, dark-spots, wilting): ")
  (bind ?*symptom* (read))
  (assert (symptom ?*symptom*)))
CLIPS> (defrule exit-program
  (or (eq ?*symptom* "exit")
      (eq ?*symptom* "quit"))
  =>
  (printout t "Exiting the program." crlf)
  (exit))

[PRNTUTIL2] Syntax Error:  Check appropriate syntax for defrule.

ERROR:
(defrule MAIN::exit-program
   (or  (eq ?*symptom*
CLIPS> (defrule reset-symptom
  (symptom ?sym)
  =>
  (retract (symptom ?sym))
  (bind ?*symptom* ""))

[EXPRNPSR3] Missing function declaration for symptom.

ERROR:
(defrule MAIN::reset-symptom
   (symptom ?sym)
   =>
   (retract (symptom
CLIPS> (defrule match-symptom
  (symptom ?sym)
  =>
  (if (and (not (eq ?sym "exit")) (not (eq ?sym "quit")))
      then
      (printout t "Matching symptom: " ?sym crlf)
      (run))

