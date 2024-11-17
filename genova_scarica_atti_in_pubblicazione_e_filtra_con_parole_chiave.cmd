REM Albo pretorio del Comune di Genova -> Scarico atti in pubblicazione da https://alboonline.comune.genova.it/albopretorio/#/albo/
"C:\Program Files\Google\Chrome\Application\chrome.exe" --headless --disable-gpu --virtual-time-budget=10000 --dump-dom --no-sandbox "https://alboonline.comune.genova.it/albopretorio/#/albo/" > albo.html

REM converto il file html degli atti in pubblicazione in formato tsv
vd -y -p comandi/atti_cmdlog.vdj --batch albo.html -o albo.tsv

REM cancella la colonna "Pubbl. N\u00b0_link0"
REM aggiorna la colonna "Atto N\u00b0_link0" con url completo dell'atto
vd -y -p comandi/atti_replace_cmdlog.vdj --batch

REM cancella il file html
del albo*.html 

REM cerca gli atti contenenti alcune parole chiave nella colonna dettaglio
REM e salva le righe selezionate nel file atti_selezionati 
vd -y albo.tsv -p comandi/cerca_parole_chiave_atti_in.vdj -b

REM converti il file atti_selezionati in formato csv
REM vd -y -b atti_in_pubblicazione_selezionati.tsv -o atti_in_pubblicazione_selezionati.csv

REM aggiungi al nome del file la data
move "atti_in_pubblicazione_selezionati.csv" "genova_atti_selezionati_%date:~6,4%%date:~3,2%%date:~0,2%.csv"

del *.tsv

vd -b "genova_atti_selezionati_%date:~6,4%%date:~3,2%%date:~0,2%.csv" -o "genova_atti_selezionati_%date:~6,4%%date:~3,2%%date:~0,2%.html"

vd "genova_atti_selezionati_%date:~6,4%%date:~3,2%%date:~0,2%.csv"
