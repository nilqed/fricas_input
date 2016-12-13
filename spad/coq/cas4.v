Module Field.

Parameter F : Set.
Parameter plus : F->F->F.
Parameter times : F->F->F.
Parameter null : F.
Parameter one : F.
Parameter neg : F->F.
Parameter inv : F->F.

Infix "+" := plus.
Infix "*" := times.
Notation "0" := null.
Notation "1" := one.
Notation "- 1":=(neg one).
Notation "- u" := (neg u).
Notation "1 / u" := (inv u) 
 (at level 75, right associativity).

Axiom F1: forall u v:F, exists w:F, w=u+v.
Axiom F2: forall u v:F, exists w:F, w=u*v.
Axiom F3: forall u v:F, u+v = v+u.
Axiom F4: forall u v:F, u*v = v*u.
Axiom F5: forall u v w:F, u+(v+w) = (u+v)+w.
Axiom F6: forall u v w:F, u*(v*w) = (u*v)*w.
Axiom F7: forall u v w:F, u*(v+w) = (u*v)+(u*w).
Axiom F8: forall u v w:F, (u+v)*w = (u*w)+(v*w).
Axiom F9: forall u:F, u+0 = u.
Axiom F10: forall u:F, u*1 = u.
Axiom F11: forall u:F, u+(-u) = 0.
Axiom F12: forall u:F, ~(u=0) -> u * (1/u) = 1.
Axiom F13: 1 <> 0.


Proposition null_unique: forall n:F, (forall u:F, u+n=u) -> n=0.
proof.
let n:F.
assume(forall u : F, u+n = u).
then (0 + n = 0).
then f1:(n+0 = 0) by F3.
then f2:(n+0 = n) by F9.
thus thesis by f1,f2.
end proof.
Qed.

Proposition one_unique: forall e:F, (forall u:F, u*e=u) -> e=1.
proof.
let e:F.
assume(forall u : F, u*e = u).
then (1*e = 1).
then f1:(e*1 = 1) by F4.
then f2:(e*1 = e) by F10.
thus thesis by f1,f2.
end proof.
Qed.

(*
Lemma neg_null: forall u:F, (u=neg u) -> u=null.
proof.
let u:F.
assume(u=neg u).
then (plus u u=plus u (neg u)).
then (plus u u=null) by F11.
end proof.
Qed.
*)

Proposition neg_unique: forall u:F, forall v:F, (u+v=0) -> v=-u.
proof.
let u:F, v:F.
assume(u+v = 0).
then ((-u)+(u+v)=(-u)+0).
then f1:((-u) + (u+v)=-u) by F9.
then ((-u) + (u+v)=((-u)+u)+v) by F5.
then ((-u) + (u+v)=(u + (-u)) + v) by F3.
then ((-u) + (u+v)=0+v) by F11.
then  f2:((-u)+(u+v)=v) by F3,F9.
thus thesis by f1,f2.
end proof.
Qed.


Proposition inv_unique: forall u:F, forall v:F, (~(u=0)/\(u*v=1)) -> v=(1/u).
proof.
let u:F, v:F.
assume a:(u<>0 /\ u * v = 1).
then ((1/u)*(u*v)=((1/u)*1)).
then f1:((1/u)*(u*v)=(1/u)) by F10.
then ((1/u)*(u*v)=((1/u)*u)*v) by F6.
then ((1/u)*(u*v)=(u*(1/u))*v) by F4.
then ((1/u)*(u*v)=1*v) by a,F12.
then f2:((1/u)*(u*v)=v) by F4,F10.
thus thesis by f1,f2.
end proof.
Qed.

Proposition times_null: forall u:F, u*0 = 0.
proof.
let u:F.
then(u * (0+0) = (u*0) + (u*0)) by F7.
then(u*0 = (u*0) + (u*0)) by F9.
then(0 = ((u*0) + (u*0)) + (- (u*0))) by F11.
then(0 = (u*0) + ((u*0) + (- (u*0)))) by F5.
then(0 = (u*0) + 0) by F11.
then(0 = u * 0) by F9.
then f1:(u * 0 = 0)  by F4.
take f1.
end proof.
Qed.

Proposition neg_is_neg_one_times: forall u:F, -u =  (- 1) * u.
proof.
let u:F.
then(u + ( - 1 * u) = (u * 1) + (u * - 1)) by F4,F10.
then(u + ( - 1 * u)= u * (1 + - 1)) by F7.
then(u + ( - 1 * u)= u * 0) by F11.
then f1:(u + ( - 1 * u)= 0) by times_null.
thus thesis by f1,neg_unique.
end proof.
Qed.

Proposition neg_null_is_null: - 0 = 0.
proof.
have f1:(0+0 = 0) by F9.
thus thesis by f1, neg_unique.
end proof.
Qed.

Proposition inv_one_is_one: (1/1) = 1.
proof.
have f1:(1 * 1 = 1) by F10.
thus thesis by f1,F13,inv_unique.
end proof.
Qed.

Lemma neg_one_neq_null: not (- (1) = 0).
proof.
assume(- (1)= 0).
then f1:(1 +  -1 = 1+0) by F11.
then f2:(1 + - 1 = 1) by F9.
then f3:(0 = 1) by f2,F11.
thus thesis by f3,F13.
end proof.
Qed.


Proposition inv_neg_one_is_neg_one : (1/ - 1 ) = - 1.
proof.
have (- 1 * (1/- 1 )= 1)  by neg_one_neq_null,F12.
then f1:((1 + - 1) * (1/ - 1)= 0) by F11,F4,times_null.
then f2:( (1 + - 1) * (1/ - 1)= (1* (1/ - 1)) + (- 1 * (1/ - 1))) by F8.
then f3:((1+ - 1) * (1/- 1)= (1/ - 1) + 1)  by F4,F10,F12, neg_one_neq_null.
then f4:(0 =  (1/- 1) +1) by f1,f3.
then f5: (1+ (1/ - 1) = 0) by f4,F3.
thus thesis by neg_unique, f5.
end proof.
Qed.
  

Lemma neg_one_times_neg_one_is_one: -1 * -1 =1.
proof.
have f1:(-1*(1+ -1)=0) by F11, times_null.
then f2:(-1*(1+ -1)=-1*1 + -1*-1) by F7.
then f3:(-1*(1+ -1)=-1 + -1*-1) by f2,F10.
then f4:( 0=-1+ -1*-1) by f3,f1.
then (1+0 = 1 + (-1+ -1*-1) ) by f4.
then (1=(1+-1)+ (-1*-1)) by F5,F9.
then (1=0+(-1*-1)) by F11.
then f8:(1=(-1*-1)+0) by F3.
thus thesis by f8,F3,F9.
end proof.
Qed.


Proposition neg_times_neg_is_plus: forall u v:F, (-u)*(-v)=u*v.
proof.
let u:F, v:F.
have f1: ( -u = -1*u) by neg_is_neg_one_times.
have f2: ( -v = -1*v) by neg_is_neg_one_times.
then (-u * -v = (-1*u)*(-1*v)) by f1,f2.
then (-u * -v = ((-1*u)*-1)*v) by F6.
then (-u * -v = (-1*(-1*u))*v) by F4.
then  (-u * -v = ((-1*-1)*u)*v) by F6.
then  (-u * -v = (1*u)*v) by neg_one_times_neg_one_is_one.
then f3:(-u * -v = u*v) by F4,F10.
thus thesis by f3.
end proof.
Qed.

Lemma not_null_then_inv_not_null: forall u:F, u<>0 -> (1/u)<>0.
proof.
let u:F.
assume f1:(u<>0).
assume f2:( (1/u)=0).
then f3:(u*(1/u)=1) by f1,F12.
then (u*(1/u)=u*0) by f1,f2.
then f4:(1=u*0) by f3.
thus thesis by f4,times_null, F13.
end proof.
Qed.

Proposition inv_inv_is_id: forall u:F, ~(u=0) -> (1 / (1 / u)) = u.
proof.
let u:F.
assume h1:(u<>0).
have(u* (1/u)=1) by h1,F12.
then f1:( (1/u)*u=1) by F4.
then f2:((1/u)*(1 / (1/u))=1) by h1,not_null_then_inv_not_null, F12.
then ( (1/u)*(1 / (1/u)) = (1/u)*u ) by f1,f2.
then (  (1 / 1/u)*( (1/u)*(1 / (1/u))) = (1 / 1/u) * ( (1/u)*u )).
then (  ((1 / 1/u)* (1/u)) * (1 / (1/u)) =  ((1 / 1/u) *  (1/u))*u ) by F6.
then (  ( (1/u)*(1 / 1/u)) * (1 / (1/u)) =  ( (1/u)*(1 / 1/u))*u ) by F4.
then f3:( 1* (1 / (1/u)) = 1*u) by f2.
thus thesis by f3,F4, F10.
end proof.
Qed.

Lemma prod_not_null: forall u v:F, ((u<>0)/\ (v<>0)) -> (u*v<>0).
proof.
let u:F, v:F.
assume h1:(u <> 0 /\ v <> 0).
then f1:(u<>0) by h1.
then f2:(v<>0) by h1.
assume h2:(u*v=0).
then (u*v=u*0) by times_null.
then ( (1/u)*(u*v) = (1/u)*(u*0)) by f1,F12.
then ( (u*(1/u))*v=(u*(1/u))*0) by F6,F4.
then f3:(v=0) by f1,F4,F12,F10.
thus thesis by f2,f3.
end proof.
Qed.


Proposition inv_prod_is_prod_inv: forall u v:F, ((u<>0)/\ (v<>0)) -> 
  ((1/(u*v)) = (1/u)*(1/v)).
proof.
let u :F, v:F.
assume h1:(u <> 0 /\ v <> 0).
then f1:(u<>0) by h1.
then f2:(v<>0) by h1.
then f3:((u*v)<>0) by f1,f2,prod_not_null.
then ( (u*v)* ((1/u)*(1/v)) = (u*v)* ((1/v)*(1/u))) by F4.
then ( (u*v)* ((1/u)*(1/v)) = ((u*v)* (1/v))*(1/u)) by F6.
then ( (u*v)* ((1/u)*(1/v)) = (u*(v* (1/v))*(1/u))) by F6.
then ( (u*v)* ((1/u)*(1/v)) = (u*1)*(1/u)) by f2,F12.
then ( (u*v)* ((1/u)*(1/v)) = (u*(1/u))) by F10.
then ((u*v)* ((1/u)*(1/v)) = 1) by f1,F12.
then f4:((1/u)*(1/v)=(1 / u * v) ) by f3,inv_unique.
thus thesis by f4.
end proof.
Qed.

Theorem no_zero_divisors: forall u v:F, (u*v=0)->((u=0) \/ (v=0)).
proof.
let u:F, v:F.
assume h1:(u*v=0).
then ( (v<>0) -> (u*v)*(1/v)=0*(1/v)) by F12.
then ( (v<>0) -> (u*v)*(1/v)=0) by F4,times_null.
then ( (v<>0) -> u*1=0) by F4,F6,F12.
then f1:( (v<>0) -> u=0) by F10.
then ( (u<>0) -> (v*u)*(1/u)=0*(1/u)) by h1,F4,F12.
then ( (u<>0) -> (v*u)*(1/u)=0) by F4,times_null.
then ( (u<>0) -> v*1=0) by F4,F6,F12.
then f2:( (u<>0) -> v=0) by F10.
then( ( (v<>0 -> u=0) /\ (u<>0 -> v=0))) by f1,f2.





End Field.

Let S:=Field.F.
Notation "x + y":=(Field.plus x y).
Notation "x * y":=(Field.times x y).
Lemma comm: forall x y:S,x+y=y+x. 
proof.
intros.
thus thesis by Field.F3.
end proof.
Qed.



 