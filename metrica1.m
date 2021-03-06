function [Cs,ds] = metrica1()
    inicio = 1987;
    fin = 2016;
    anios = fin - inicio +1;
    Cs = {};
    ds = {};
    for i = 1:anios
        fileID = fopen(strcat('estadisticasJugadores/equipos',int2str(inicio+i-1),'.txt'),'r');
        sizeA = [9 Inf];
        C = fscanf(fileID,'%f %f %f %f %f %f %f %f %f', sizeA);
        C = C';
        %RB^2
	C(:,2) = C(:,2).^2;
        %sqrt(TOV)
        C(:,5) = sqrt(C(:,5));
        %FTperc^2
        C(:,7) = C(:,7).^2;
        %sqrt(log(PF))
        C(:,9) = sqrt(log(C(:,9)));
        
        Cs(i) = {C};
        
        fileIDb = fopen(strcat('stats/winrate/leagues_NBA_',int2str(inicio+i-1),'_winrate.csv'),'r');
        sizeb = [1 Inf];
        d = fscanf(fileIDb,'%f', sizeb);
        d = d';
        ds(i) = {d};
        
        fclose('all');
    end
end
