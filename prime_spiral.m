clc;
clear all; 

posx = 1;
posy = 0;

xlenmax = 1;
ylenmax = 1;
xlenmin = -1;
ylenmin = 0;

state = 1;

N = 10000;

for i=2:N
    k = 2;
    j = i;
    prime  = 0;
    while (k <= j)
        if (rem(i,k) == 0)
            prime = -1;
            break;
        end
        j = i/k;
        k = k+1;   
    end
    k = k-1;
    if prime == 0 || i == 2
        plot(posx,posy,'*');
        hold on
    end 
    if posx < xlenmax && posx > xlenmin
        if state == 1
            posx = posx + 1;
        end
        if state == -1
            posx = posx - 1;
        end
    elseif posy < ylenmax && posy > ylenmin
        if state == 1
            posy = posy + 1;
        end
        if state == -1
            posy = posy - 1;
        end
    elseif posx == xlenmax && posy == ylenmin
        posy = posy + 1;
        ylenmin = ylenmin - 1;
    elseif posy == ylenmax && posx == xlenmax
        posx = posx - 1;
        xlenmax = xlenmax + 1;
        state = -1;
    elseif posx == xlenmin && posy == ylenmax
        posy = posy - 1;
        ylenmax = ylenmax + 1;
    elseif posy == ylenmin && posx == xlenmin
        posx = posx + 1;
        xlenmin = xlenmin - 1;
        state = 1;
    end
end