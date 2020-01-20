function F = THS(x,P)
    T01=TRAATD(0,0,x(1),0);
    T12=TRAATD(pi/2,0,x(2)+pi/2,0);
    T23=TRAATD(0,500,x(3),0);
    T34=TRAATD(pi/2,0,x(4),600);
    T45=TRAATD(pi/2,0,x(5),0);
    T56=TRAATD(-pi/2,0,x(6),400);
    
    PLL=T01*T12*T23*T34*T45*T56;
    X1=PLL(:,1);
    Y1=PLL(:,2);
    Z1=PLL(:,3);

    k=[0 0 0 1];
    r=[X1 Y1 Z1];
    R=[r k'];
    E=ones(4,4);
    
    F1=PLL-P;
    F2=E-R'*R;
    F=[F1;F2];
end