function [s]=TRAATD(alpth,a,theta,d)
    s=transl(0, 0, 0) * trotx(alpth)*transl(a, 0, 0) * trotx(0)*transl(0, 0, 0) * trotz(theta)*transl(0, 0, d) * trotz(0);
end