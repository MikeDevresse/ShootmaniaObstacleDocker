# Shootmania obstacle server
This repo host everything needed to host your shootmania obstacle server with maniacontrol installed.

If you encounter any issue during the install process, feel free to create an issue or contact `upmwqn` on discord.

## Prerequisite
You will need the following components to host your server:
- [Docker & Docker Compose](https://docs.docker.com/engine/install/)

## Install
First you will need to either download or clone this repository to where you want to run your server.

### Configure your server
#### mariadb.env
If you want to use database from the docker-compose (recomanded), create a `mariadb.env` file containing the following content:
```
MARIADB_ROOT_PASSWORD=mypassword
```
Replace mypassword with a new password that you generated.

#### initdb.env
Create a `initdb.env` file and add the following content:
```
DATABASE_NAME="maniacontrol"
USER_NAME="maniacontrol"
USER_PASSWORD="anotherpassword"
```
You can use the same username and database name but you must edit the `USER_PASSWORD` variable. It is recommanded to set it differently than your `MARIADB_ROOT_PASSWORD` variable.

#### dedicated_cfg.txt
You will find an exemple named `dedicated_cfg.example.txt`, in this file you will need to edit the following:
- `line7`: SuperAdmin's password, optionnaly you can also edit the username.
- `line11`: Admin's password, optionnaly you can also edit the username.
- `line15`: User's password, optionnaly you can also edit the username.
- `line20`: masterserver login, you can create your dedicated server account [here](https://maniaplanet.com/account/dedicated-servers).
- `line21`: masterserver password with previously created credentials.
- `line26`: Initial server name, you will be able to edit it later with ManiaControl.

#### server.xml
You will find an exemple named `server.example.xml`, in this file you will need to edit the following:
- `line12`: SuperAdmin's username that you configured earlier in the `dedicated_cfg.txt` file.
- `line13`: SuperAdmin's password.
- `line21`: If you use another database than the one from the docker-compose, specify your host.
- `line25`: The mysql user defined in the  `initdb.env` file (`maniacontrol` by default).
- `line26`: The mysql password definied in the `initdb.env` file.
- `line29`: The databasename used by ManiaControl, defined in the `initb.env` file (`maniacontrol` by default).
- `line35`: Your ManiaPlanet login, used to set you as master admin. You will later be able to add admins directly with ManiaControl.

### Run your server
Simply run the following command:
`docker compose up -d`