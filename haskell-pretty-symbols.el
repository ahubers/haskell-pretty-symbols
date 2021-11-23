;;; haskell-pretty-symbols.el --- Display many haskell symbols as their unicode counterparts

(require 'cl-lib)
;;; Code:
(defun substitute-pattern-with-unicode-symbol (pattern symbol)
  "Add a font lock hook to replace the matched part of PATTERN
   with the Unicode symbol SYMBOL.  Symbol can be the symbol
   directly, no lookup needed."
  (interactive)
  (font-lock-add-keywords
   nil
   `((,pattern
      (0 (progn
	   (compose-region (match-beginning 1) (match-end 1)
	   		   ,symbol
	   		   'decompose-region)
	   nil))))))


(defun substitute-patterns-with-unicode-symbol (patterns)
  "Mapping over PATTERNS, calling SUBSTITUTE-PATTERN-WITH-UNICODE for each of the patterns."
  (mapcar #'(lambda (x)
              (substitute-pattern-with-unicode-symbol (car x)
						      (cl-second x)))
          patterns))

(defun haskell-escape-regex (str)
  "creates a regex pattern to look for precisely the pattern
   you've given it matched by a non-alpha character.
   Can be useful.
  "
  (interactive "MString:")
  (concat "\\(" str "\\)[^a-z0-9A-Z]"))

;; Helpful links:
;; - http://www.fileformat.info/info/unicode/block/mathematical_operators/list.htm
;; - https://www.unicodeit.net/
;; - https://detexify.kirelabs.org/classify.html
(defun haskell-pretty-symbol-mode ()
  (interactive)
  (substitute-patterns-with-unicode-symbol
   (list
    ;; O-ops (for Datatypes a la carte)
    (list (haskell-escape-regex "\\:\\.\\:") "⊙")
    (list (haskell-escape-regex "\\:\\-\\:") "⊖")
    (list (haskell-escape-regex "\\:\\/\\:") "⊘")
    (list (haskell-escape-regex "\\:\\+\\:") "⊕")
    (list (haskell-escape-regex "\\:\\*\\:") "⊗")
    (list (haskell-escape-regex "\\:<\\:") "≺")
    (list (haskell-escape-regex "\\\\/") "▿")
    
    
    ;; Ord comparators
    (list (haskell-escape-regex ">=") "≥")
    (list (haskell-escape-regex "<=")"≤")
    (list (haskell-escape-regex "/=")"≠")
    (list (haskell-escape-regex "::")"∷")
    
    ;; logical ops
    (list (haskell-escape-regex "&&")"∧")
    (list (haskell-escape-regex "||")"∨")
    (list (haskell-escape-regex "not")"¬")

    ;; Haskell syntax
    (list (haskell-escape-regex "->")"→")
    (list (haskell-escape-regex "<-")"←")
    (list (haskell-escape-regex "=>")"⇒")
    (list (haskell-escape-regex "<=")"⇐")
    (list (haskell-escape-regex "forall")"∀")

    ;; types
    (list (haskell-escape-regex "Bool") "𝔹")
    (list (haskell-escape-regex "Int") "ℤ")
    (list (haskell-escape-regex "Nat") "ℕ")
    (list (haskell-escape-regex "Real") "ℝ")   

    ;; Me being fucking insane
    (list (haskell-escape-regex "Entails")"⊧")
    (list (haskell-escape-regex "False")"⊥")
    (list (haskell-escape-regex "True")"⊤")
    (list (haskell-escape-regex "div") "÷")
    (list (haskell-escape-regex "infty") "∞")

    ;; Greek
    (list (haskell-escape-regex "Alpha") "Α")
    (list (haskell-escape-regex "Beta") "Β")
    (list (haskell-escape-regex "Gamma")"Γ")
    (list (haskell-escape-regex "Delta")"Δ")
    (list (haskell-escape-regex "Epsilon")"Ε")
    (list (haskell-escape-regex "Zeta")"Ζ")
    (list (haskell-escape-regex "Eta")"Η")
    (list (haskell-escape-regex "Theta")"Θ")
    (list (haskell-escape-regex "Iota")"Ι")
    (list (haskell-escape-regex "Kappa")"Κ")
    (list (haskell-escape-regex "Lambda")"Λ")
    (list (haskell-escape-regex "Mu")"μ")
    (list (haskell-escape-regex "Nu")"Ν")
    (list (haskell-escape-regex "Xi")"Ξ")
    (list (haskell-escape-regex "Omicron")"Ο")
    (list (haskell-escape-regex "Pi")"Π")
    (list (haskell-escape-regex "Rho")"Ρ")
    (list (haskell-escape-regex "Sigma")"Σ")
    (list (haskell-escape-regex "Tau")"Τ")
    (list (haskell-escape-regex "Upsilon")"Υ")
    (list (haskell-escape-regex "Phi")"Φ")
    (list (haskell-escape-regex "Chi")"Χ")
    (list (haskell-escape-regex "Psi")"Ψ")
    (list (haskell-escape-regex "Omega")"Ω")
    (list (haskell-escape-regex "alpha")"α")
    (list (haskell-escape-regex "alphas")"αs")
    (list (haskell-escape-regex "beta")"β")
    (list (haskell-escape-regex "gamma")"γ")
    (list (haskell-escape-regex "delta")"δ")
    (list (haskell-escape-regex "epsilon")"ε")
    (list (haskell-escape-regex "zeta")"ζ")
    (list (haskell-escape-regex "eta")"η")
    (list (haskell-escape-regex "theta")"θ")
    (list (haskell-escape-regex "iota")"ι")
    (list (haskell-escape-regex "kappa")"κ")
    (list (haskell-escape-regex "lambda")"λ")
    (list (haskell-escape-regex "mu")"μ")
    (list (haskell-escape-regex "nu")"ν")
    (list (haskell-escape-regex "xi")"ξ")
    (list (haskell-escape-regex "omicron")"ο")
    (list (haskell-escape-regex "pi")"π")
    (list (haskell-escape-regex "rho")"ρ")
    (list (haskell-escape-regex "sigma")"σ")
    (list (haskell-escape-regex "tau")"τ")
    (list (haskell-escape-regex "upsilon")"υ")
    (list (haskell-escape-regex "phi") "ϕ")
    (list (haskell-escape-regex "chi")"χ")
    (list (haskell-escape-regex "psi")"ψ")
    (list (haskell-escape-regex "omega")"ω")
    )))

(provide 'haskell-pretty-symbols)

;;; haskell-pretty-symbols.el ends here
