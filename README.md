# JK_Jobs MySQL Edition
## Created by: DevKoRinGa | Modified by: AlienFuture

![alt text](https://github.com/AlienFuture/jk_jobs/blob/master/readme.png?raw=true "JK_Jobs in action")

This is a modified Fivem ESX script of DevKoRinGa's JK_jobs. I almost remade whole script from scratch except NUI layout.

## Features

- This script uses mysql-async package for MySQL Sync
- This script is SQL optimized. It queries SQL datas once and save it in memory.
- This script automatically detects and adds the jobs to NUI view. You don't have to add them in source code anymore. 

## Files
- __resource.lua to initalize script files
- config.lua for blip config
- client.lua for client side scripting
- server.lua for server side scripting
- NUI elements (.HTML, .CSS, .JS) 
- Image files (optional)

## Dependencies
- [es_extended]
- [mysql-async]

## Installation
1. Download latest [release] from Github repo
2. Move downloaded files to your script folder of your server `(fivem/server-data/resources/...)`.
3. Import .sql file to your SQL database.
4. a) If you would to start on running server open your console (F8) and type `refresh` and then ensure `<script_foldername>`.
b) If you would to start your script with your server open your `server.cfg` and type `ensure <script_foldername>`.

## Credits
Original script by: [DevKoRinGa]
Used icons on banner: [Freepik]

[//]: #
[es_extended]: <https://github.com/esx-framework/es_extended>
[mysql-async]: <https://github.com/brouznouf/fivem-mysql-async>
[DevKoRinGa]: <https://github.com/DevKoRinGa/jk_jobs>
[Freepik]: <https://www.freepik.com/>
[release]: <https://github.com/AlienFuture/jk_jobs/releases>
  
