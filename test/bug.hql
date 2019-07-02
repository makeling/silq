/+
def main(){
	n:=100; // TODO: make running time scale linearly in n!
	a:=vector(n,1:𝔹);
	r:=0:int[32];
	def index(a: 𝔹^n,i:!ℕ)lifted{
		return a[i];
	}
	for i in [0..n){
		r+=a[i];
		r+=index(a,i);
	}
	return r;
}
+/
/+
def main(){
	x:=H(0:𝔹);
	k:=H(0:𝔹);
	f:=()=>x; // TODO: this shouldn't get a reference to k
	g:=dup(f); // then this doesn't duplicate k
	(x,y):=(f(),g());
	forget(y=x);
	forget(H(x)=0);
	k:=H(k);
	return k; // should be 0
}
+/
/+
def bar(const x:𝔹):!ℕ{
	if x { return 0; } // TODO: error
	else { return 1; }
}
+/
/+def main(){
	x:=0:𝔹;
	y:=0:𝔹;
	while(measure(H(0:𝔹))){
		x=H(dup(y)); // TODO: error
	}
	return x;
}+/
/+def main(){
	x:=H(0:𝔹);
	y:=dup(x);
	while(measure(H(0:𝔹))){
		forget(y);
		y:=dup(x); // TODO
	}
	return H(x);
}+/
/+
def main(){
	x:=0:int[32];
	for i in [0..4){ x[i]=H(x[i]); } // TODO: error
	return x;
}
+/
/+

def arcsin(q:!ℝ) lifted :!ℝ;
def sqrt(q:!ℝ) lifted :!ℝ;

def WState[n:!N](q0:𝔹,q1s:𝔹^n) {
    if n+1==1{
        q0 := X(q0);
    } else {
        theta := arcsin(1.0 / sqrt(n));
        q0 := rotY(2*theta, q0);

        if !q0{
            (q1s[0], q1s[1..n]) := WState[n-1](q1s[0], q1s[1..n]); // TODO
        }
    }
    return (q0, q1s)
}
+/

/+
def main(){
	x := 0;
	forget(x); // TODO: remove x, even if classical
	return x;  // TODO: error
}
+/
/+
def main(){
	x := 0:𝔹;
	for i in [0..10){
		forget(x); // TODO: error!
		x := H(0:𝔹);
	}
	return x;
}
+/
