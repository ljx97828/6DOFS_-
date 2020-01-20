
syms TH1 TH2 TH3 TH4 TH5 TH6

L1=Link('d',0,'a',0,'alpha',0);%1 d¸ß¶È 
L2=Link('theta',0,'a',0,'alpha',pi/2);
L3=Link('d',0,'a',500,'alpha',0,'offset',pi/2);%2 dÆ«Öá
L4=Link('d',0,'a',0,'alpha',0,'offset',0);%3
L5=Link('theta',0,'a',0,'alpha',pi/2);
L6=Link('d',600,'a',0,'alpha',0);%4
L7=Link('d',0,'a',0,'alpha',pi/2);
L8=Link('d',0,'a',0,'alpha',0,'offset',0);%5
L9=Link('theta',0,'a',0,'alpha',-pi/2,'offset',0);
L10=Link('d',400,'a',0,'alpha',0);
L2.qlim=[0 200];
L5.qlim=[0 200];
L9.qlim=[0 200];



% T01=TRAATD(0,0,TH1,0);
% T12=TRAATD(pi/2,0,TH2+pi/2,0);
% T23=TRAATD(0,200,TH3,0);
% T34=TRAATD(pi/2,0,TH4,400);
% T45=TRAATD(pi/2,0,TH5,0);
% T56=TRAATD(-pi/2,0,TH6,400);
%bot.plot([0 0 pi/6 pi/6 0 -pi/3 -pi/6 0 0]);
bot=SerialLink([L1,L2,L3,L4,L5,L6,L7,L8,L9,L10],'name','my robot');




% axis([-1000 1000 -1000 1000 -200 1000]);
% hold on
%bot.plot([TH1 0 TH2 TH3 0 TH4 0 TH5 0 TH6]);
%E=double(bot.fkine([TH1 0 TH2 TH3 0 TH4 0 TH5 0 TH6]))
% PLL=T01*T12*T23*T34*T45*T56;
th=[0 0 0 0 0 0 ];
%bot.plot([th(1) 0 th(2) th(3) 0 th(4) 0 th(5) 0 th(6)]);
hold on

n=0;
last_x=-1;
last_y=-1;
for i=1:2:706    
    for j=1:5291       
        if num(i,j)~=2000
            xc=num(i,j);
            yc=num(i+1,j);
            if last_x~=xc || last_y~=yc
                n=n+1;
                P=transl(800, (xc-500), (yc-500)) * troty(pi/2)*trotz(pi);
                [xz,resnorm] = lsqnonlin(@(x) THS(x,P),th) ;
                th=xz;
                tt3(n,:)=xz;
                %bot.plot([th(1) 0 th(2) th(3) 0 th(4) 0 th(5) 0 th(6)]);
                %E=double(bot.fkine([th(1) 0 th(2) th(3) 0 th(4) 0 th(5) 0 th(6)]));
                %X=E(1,4);
                %Y=E(2,4);
                %Z=E(3,4);
                %scatter3(X,Y,Z,0.8,[1,0,0]);                
            end
                last_x=xc;
                last_y=yc;
        else
            break;
        end
    end
    i
end


%teach(bot);
% while(1)
%     for i=0:0.05:2*pi
%         TH6=0;
%         %bot1.plot(TH1);
%         %bot2.plot([TH1 0 TH2]);
%         %bot3.plot([TH1 0 TH2 TH3]);
%         %bot4.plot([TH1 0 TH2 TH3 100 TH4]);
%         %bot5.plot([TH1 0 TH2 TH3 0 TH4 0 TH5]);
%         bot.plot([TH1 0 TH2 TH3 0 TH4 0 TH5 0 TH6]);
%         pause(0.01)
%     end
% end