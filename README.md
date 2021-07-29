# MWAY Challenge 'Flutter Case'

## Task 1: Login-Funktionalität

- Gestalte die Login-Seite aus, füge ein Formular mit E-Mail und Password hinzu
- Baue in einen Logout-Button in das Side-Menu ein
- Nutze `./services/auth_service.dart`, um die Zugangsdaten abzusenden
- Weiter unten findest du die Server-Spezifikationen 

## Task 2 : Objekterkennung YOLO (optional)

- Integriere auf einer Unterseite eine Objekterkennung mit Hilfe des bereits vorhanden YOLO-Models
- Nutze dazu die [tflite Dokumentation](https://github.com/shaqian/flutter_tflite#tiny-yolov2)

## Teilnahme T-Shirt Verlosung

Sende bis zum 05.08.21 eine Mail mit dem Link zu deiner GitHub-Repository an hr@mway.io. 

Alle Einsender qualifizieren sich für die T-Shirt Verlosung.

## Rückfragen

Kontakt für technische Rückfragen: alexander.belokon@mway.io

<br>

# Server Spezifikationen

Server-Adresse: http://3.67.135.138:3000/

Die Zugangsdaten für den vorregistrierten Shortcut-User lauten wie folgt:

```json
{
  "email": "shortcut-test@mway.io",
  "password": "password123"
}
```

### API Routes ###
|   Action            | Required |  Method  | URL
|   ------------------|----------|----------|--------------
|   AUTHENTICATE USER |          | `POST`   | /api/v1/auth
|   GET USER          |   Auth   | `GET`    | /api/v1/users

#### AUTHENTICATE USER ####
* REQUEST
```
POST /api/v1/auth
```
```json
{
  "email": "user@gmail.com",
  "password": "user123"
}
```
* RESPONSE
```json
{
  "token": "eyJhbGciOiJI..."
}
```

#### GET USER BY TOKEN ####
* REQUEST
```
GET /api/v1/users
```
```javascript
const token = 'eyJhbGciOiJI...';
req.setRequestHeader('Authorization', token);
```
* RESPONSE
```json
{
  "id": 46643,
  "name": "user",
  "email": "user@gmail.com",
  "password": "user123",
  "imageUrl": "https://almsaeedstudio.com/themes/AdminLTE/dist/img/user2-160x160.jpg"
}
```

