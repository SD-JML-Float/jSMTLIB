; Using ALL logic with bit-vectors and integers
(set-option :produce-models true)
(set-logic ALL)
(declare-fun b () (_ BitVec 32))
(define-fun bb () (_ BitVec 32) (bvneg (bvand (bvneg b) #xfffffff0)))
(declare-fun n () Int )
(assert (= n  ((_ bv2int 32) b)))
(declare-fun nn () Int  )
(assert (= nn ((_ bv2int 32) bb)))
(assert (not (and (>= nn n) (>= (+ n 15) nn) (= (mod nn 16) 0) )))
(check-sat)
(get-value (n nn b bb))