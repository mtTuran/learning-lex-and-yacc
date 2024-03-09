a = 5$
d = a$
check (5 == 5) and (5 != 6) or (1 == 1){
    b = 6 + a$
    c = a / b$
    d = a + b - c * d$
}
do (b){
    check ((a + 3) == b) or (c != d){
        do(d){
            a = d + 1$
			c = c - 2$
        }
    }
}


_1 = -34$
FINISH