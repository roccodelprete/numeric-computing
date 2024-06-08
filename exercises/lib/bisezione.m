% il primo argomento è l'handle (puntatore) alla function Matlab che
% implementa la funzione, il secondo e il terzo sono gli estremi
% dell'intervallo iniziale in cui calcolare f(x) = 0 con il metodo di
% bisezione, mentre l'ultimo argomento è l'accuratezza che si vuole
% sul risultato da calcolare (restituito in "radice"),
% ovvero |r - radice| < delta_ass
% metodo globale
function radice = bisezione(funzione,a,b,delta_ass)
ak = a; bk = b; % estremi dell'intervallo
% valori della funzione nei due estremi
fak = funzione(ak);
fbk = funzione(bk);
% il blocco seguente viene iterato fino a quando il valore assoluto della
% semiampiezza dell'intervallo rimane maggiore dell'accuratezza che
% richiesta sul risultato da calcolare (delta_ass), più l'ampiezza del più piccolo
% intervallo fp con estremo sinistro ak (eps(abs(ak)); criterio di arresto basato
% sull'errore assoluto; se delta_ass = 0, allora l'iterazione si arresta
% quando ak e bk sono, all'incirca, due numeri fp consecutivi (massima
% accuratezza)
while abs(bk-ak) > delta_ass + eps(abs(ak))
    % calcolo il punto medio della funzione di estremi ak,bk
    pmediok = (ak+bk)/2;
    % calcolo il valore della funzione nel punto medio
    fpmediok = funzione(pmediok);
    % se il segno della funzione calcolata nell'estremo ak è diverso
    % dal segno della funzione calcolata nel punto medio
    if sign(fak) ~= sign(fpmediok)
        % allora si aggiornano i valori dell'estremo bk al valore del punto
        % medio, e della funzione nel punto bk al valore della funzione nel
        % punto medio
        bk = pmediok;
        fbk = fpmediok;
    else % se invece il segno della funzione nel punto ak è uguale al
        % segno della funzione calcolata nel punto medio
        % allora si aggiornano i valori dell'estremo ak al valore del punto
        % medio, e della funzione nel punto ak al valore della funzione nel
        % punto medio
        ak = pmediok;
        fak = fpmediok;
    end
    % visualizza a schermo i valori degli estremi ad ogni iterazione del
    % ciclo while ed il valore assoluto della distanza tra i due estremi
    % disp( [ak,bk,abs(ak-bk)] )
end
% la radice sarà uguale al punto medio una volta usciti dal ciclo while
radice = (ak+bk)/2;