# albopretorio-genova
Scarica e filtra gli atti dell'albo pretorio del Comune di Genova in base a determinate parole chiave.
Il sito dell'albo pretorio del Comune di Genova (https://alboonline.comune.genova.it/albopretorio/) non consente la ricerca degli atti nè lo scarico in formato tabellare (es: csv). 
La ricerca avanzata non funziona (al 17/11/2024) e restituisce "Nessun atto trovato" per qualsiasi parola inserita.
Lo script esegue le seguenti operazioni
- Scarica la pagina con gli atti in pubblicazione dell'albo pretorio in formato html (Chrome)
- Converte il file con gli atti in pubblicazione in formato csv (VisiData/Python)
- Filtra gli atti che contengono determinate parole chiave e salva il file in formato csv (VisiData/Python)
- Salva gli atti selezionati in formato html e csv
- Visualizza gli atti selezionati (VisiData/Python)
Per eseguire lo script occorre installare Chrome, Python e VisiData.
