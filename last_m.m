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

bot=SerialLink([L1,L2,L3,L4,L5,L6,L7,L8,L9,L10],'name','ºÄ×Ó');
th=[0 0 0 0 0 0 ];

axis([-1000 1000 -1000 1000 -1000 1000 ])
hold on
ni=1;%13541
th=tt2(ni,:);
bot.plot([th(1) 0 th(2) th(3) 0 th(4) 0 th(5) 0 th(6)]);

for j=1:ni
    th=tt2(j,:);
    E=double(bot.fkine([th(1) 0 th(2) th(3) 0 th(4) 0 th(5) 0 th(6)]));
    X=E(1,4)+150;
    Y=E(2,4);
    Z=E(3,4);
    x(j)=X;
    y(j)=Y;
    z(j)=Z;
    %scatter3(X,Y,Z,0.8,[1,0,0]);
    %plot3(X,Y,Z,'r.','MarkerSize',0.8)
end

plot3(x(1:ni),y(1:ni),z(1:ni),'r.','MarkerSize',0.8)
n=84532;
for i=ni:20:n
    th=tt2(i,:);
    bot.plot([th(1) 0 th(2) th(3) 0 th(4) 0 th(5) 0 th(6)]);
%     E=double(bot.fkine([th(1) 0 th(2) th(3) 0 th(4) 0 th(5) 0 th(6)]));
%     X=E(1,4)+150;
%     Y=E(2,4);
%     Z=E(3,4);
%     x(i)=X;
%     y(i)=Y;
%     z(i)=Z;
    %scatter3(X,Y,Z,0.8,[1,0,0]);
    plot3(x(i:i+19),y(i:i+19),z(i:i+19),'r.','MarkerSize',0.8);
    if i+19>=n-20
        break;
    end
end