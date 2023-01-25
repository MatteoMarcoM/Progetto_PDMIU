# pdmiu_app_biblioteca

Progetto per l'esame di Programmazione per dispositivi mobili e interfacce utente (PDMIU), sessione invernale, a.a. 2022/2023. 

Creato da: Matteo Marco Montanari

Matricola: 323293

Docente: Prof. Cuno Lorenz Klopfenstein

Gennaio 2023

## Applicazione per gestione di una biblioteca
Applicazione realizzata per dispositivi mobili e interfaccia Web come Client per il servizio di bilblioteca online precedentemente sviluppato dal sottoscritto come server (nodejs + express) e hostato come servizio pubblico all'indirizzo: https://fuchsia-outstanding-plow.glitch.me.

Repository del server per il backend: https://github.com/MatteoMarcoM/pdgt-biblioteca

## Scelte implementative
L'applicazione é stata sviluppata per dispositivi mobili (debug tramite Android) e interfaccia Web (debug tramite Chromium + Javascript) tramite il framework Flutter che permette di realizzare applicazioni Cross-Platform.
I package aggiuntivi utilizzati per lo sviluppo sono:
1. http: versione 0.13.5
2. flutter_riverpod: versione 2.1.3

## Scopo dell'applicativo
L'applicazione dovrà prevedere l'interfacciamento completo con il server per la gestione di una biblioteca implementata come una lista di libri specifica per ciascun utente registrato al servizio e loggato tramite procedura di autenticazione. In particolare l'app dovrà effettuare le seguenti operazioni:
1. Accedi al servizio pubblico online.
2. Ottieni la lista degli utenti registrati al servizio.
3. Ottieni la lista dei libri dell'utente loggato.
4. Registra un utente con username e relativa password (se non gia' presente).
5. Aggiungi un libro alla raccolta dell'utente.
6. Fare login di un utente (se precedentemente registrato) e ottieni il cookie di sessione (JWT firmato) tramite Basic authentication (procedura di autenticazione).
7. Sostituisci un libro (old) con un altro (new). Procedura di ridenominazione.
8. Disiscrivi dal servizio l'utente specificato se possiedi il suo JWT firmato.
9. Rimuovi un libro di un utente registrato.
10. Fare logout.

NOTA BENE: Non è possibile effettuare le operazioni di cui ai punti nn. 3, 5, 7, 8, 9 se non si possiede il JWT valido dell'utente in questione (ottenibile tramite login). Dopo essersi loggati e aver ottenuto il JWT, esso ha una scadenza di 60 secondi dopodiché è necessario ottenerne un altro tramite apposito bottone in alto a destra.

## API HTTP di interfacciamento
L'applicazione comunica con il server tramite l'API HTTP specifica esposta dal servizio e documentata sul repository github del server (https://github.com/MatteoMarcoM/pdgt-biblioteca). I metodi HTTP implementati si riferiscono ai relativi punti che descrivono le funzionalità dell'app (punto precedente della relazione).
1. GET /
2. GET /utenti
3. GET /utenti/:name/libri
4. PUT /utenti/register/:name/:password
5. PUT /utenti/:name/libri/add/:libro
6. POST /utenti/login/jwt
7. POST /utenti/:name/libri/rename/:old/:new
8. DELETE /utenti/remove/:name
9. DELETE /utenti/:name/libri/remove/:lib

## Flusso di utilizzo
1. Verificare la messa online del servizio tramite apposito messaggio nella Home Page.
2. Navigare tramite drawer laterale nella pagina di registrazione per registrare un utente compilando un form.
3. Eventtualmente verificare la registrazione dell'utente visualizzando la lista degli utenti registrati navigando alla pagina apposita tramite drawer laterale.
4. Navigare tramite drawer laterale nella pagina di login per loggare l'utente precedentemente registrato.
5. Una volta loggati aggiornare la lista dei libri aggiungendo, rimuovendo o rinominando un libro tramite le pagine apposite navigabili tramite drawer laterale.
6. Verificare le modifiche accedendo (e aggiornando) la pagina che mostra la lista dei libri dell'utente loggato (drawer laterale).
7. Effettuare il logout o disiscriversi dal servizio tramite gli appositi pulsanti nella pagina di gestione dell'account utente (drawer laterale).

NOTA BENE: Dopo essersi loggati e aver ottenuto il JWT, esso ha una scadenza di 60 secondi dopodiché, per effettuare le varie operazioni, è necessario ottenerne un altro tramite apposito bottone in alto a destra.

## Responsività
La responsività è garantita per tutte le pagine dell'applicazione ma l'aggiornamento real time delle liste di utenti e libri vanno effettuate manualmente ricaricando le varie pagine di volta in volta (tramite navigazione con drawer laterale), nel caso di schermo ampio (applicazione Web e app con schermo orrizzontale), mentre è garantito automaticamente nel caso di schermo ridotto in larghezza (app per smartphone con schermo verticale).

