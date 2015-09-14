:local q "Enter old password (leave blank for new Mikrotik)"; :local u "Enter new password (more than 6 symbols recommend)"; :local e "Enter Your Name"; :local s "Hello $mn , please Enter Your E-mail"; :local t "Enter Router Short Name (one word)"; :local i "Enter Router Location"; :local o "Enter NEW open WiFi network NAME if you need, leave blank if you configure it manually"; :local n "Press ENTER to finish config and await a minute for router reboot"; /put "Mikrotik clock adapting"; /system ntp client set enabled=yes primary-ntp=195.20.96.8 secondary-ntp=193.27.209.1; /system clock manual set time-zone=+02:00; /put "Hi there"; /ip hotspot disable [find]; /system scheduler disable [find]; :if ( [/ip hotspot print count-only] =0 ) do={ 	/put "Empty hotspot. Creating new"; 	/ip hotspot profile add dns-name=place.kdfly.ru hotspot-address=192.168.88.1 name=hsprof1; 	/ip hotspot add address-pool=default-dhcp disabled=yes interface=bridge-local name=hotspot1 profile=hsprof1; 	/ip hotspot user profile set [ find default=yes ] idle-timeout=none keepalive-timeout=2m mac-cookie-timeout=3d; 	/ip hotspot user add name=admin; 	/ip firewall filter add action=passthrough chain=unused-hs-chain comment="place hotspot rules here" disabled=yes place-before=0; 	/ip firewall nat disable [find]; 	/ip firewall nat add action=passthrough chain=unused-hs-chain comment="place hotspot rules here" disabled=yes; 		/ip firewall nat add action=masquerade chain=srcnat comment="default configuration" out-interface=ether1-gateway to-addresses=0.0.0.0; 		/ip firewall nat add action=masquerade chain=srcnat comment="masquerade hotspot network" src-address=192.168.88.0/24; } else={put "You already have Hotspot. Checking.";}; :if ( [/ip hotspot print count-only] =1 ) do={/put "Please confirm html clear"; /ip hotspot reset-html [find]; } else={return "STOP. ERROR. You need to have only one hotspot to config. Leave one or less hotspot to setup. Please read manual or contact admin";}; :delay 2; /put "Please set secure password for your Mikrotik User"; /put $q; :local op [/toarray value=]; /put $u; :local np [/toarray value=]; /password old-password=$op new-password=$np confirm-new-password=$np; /put "Remember it and use for next login"; /put "START. You have hotspot to config! Dont use this symbols please: \" , ; \$ "; /put $e; :local mn [/toarray value=]; /put $s; :local me [/toarray value=]; /put $t; :local msn [/toarray value=]; /put $i; :local ml [/toarray value=]; /put $o; :local mw [/toarray value=]; /snmp set contact=$mn; /tool e-mail set from=$me; /system identity set name=$msn; /snmp set location=$ml; /put "$mn , let me config WiFi at $ml"; :delay 2; /put "DHCP server lease time 30 minutes"; /ip dhcp-server set default lease-time=30m; /put "Adtena radius adapting"; /radius remove [find]; /radius add address=178.62.134.64 secret=testing123 service=ppp,hotspot;
:delay 2;
/put "Remote update adapting";
/system scheduler remove [find];
/system scheduler add disabled=yes interval=2h name=updaterules on-event=":delay 10\r\
    \n:log info \"downloading update\";\r\
    \n/tool fetch address=research.pp.ua src-path=adtena.update.sh mode=http dst-path=update.rsc host=research.pp.ua;\r\
    \n:delay 5;\r\
    \n:log info \"start update\";\r\
    \n/import update.rsc;" policy=ftp,reboot,read,write,policy,test,winbox,password,sniff,sensitive,api start-time=startup;
/system scheduler add disabled=yes interval=0 name=updaterulesreboot on-event=":delay 10;\r\
    \n:log info \"downloading update\";\r\
    \n/tool fetch address=research.pp.ua src-path=adtena.update.sh mode=http dst-path=update.rsc host=research.pp.ua;\r\
    \n:delay 5;\r\
    \n:log info \"start update\";\r\
    \n/import update.rsc;" policy=ftp,reboot,read,write,policy,test,winbox,password,sniff,sensitive,api start-time=startup;
:delay 2;
/put "Hotspot will turn off when no uplink or problem with ad server rule";
/system scheduler add disabled=yes interval=15m name=OffHotspotIfServer on-event=":if ([ping wifi.adtena.com count=3]=0) do={/ip hotspot disable [/ip hotspot find]} else={/ip hotspot enable [/ip hotspot find]};" policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive start-time=00:00:00;
:delay 2;
/put "Hotspot walled-garden adapting";
/ip hotspot walled-garden ip remove [/ip hotspot walled-garden ip find];
/ip hotspot walled-garden ip add action=accept comment=adtena.com dst-host=adtena.com;
/ip hotspot walled-garden ip add action=accept comment=wifi.adtena.com dst-host=wifi.adtena.com;
/ip hotspot walled-garden ip add action=accept comment=cloud.adtena.com dst-host=cloud.adtena.com;
/ip hotspot walled-garden ip add action=accept comment=adtena.s3.eu-central-1.amazonaws.com dst-host=adtena.s3.eu-central-1.amazonaws.com;
/ip hotspot walled-garden ip add action=accept comment=triolan.mobi dst-host=triolan.mobi;
/ip hotspot walled-garden ip add action=accept comment=delivery.clickganic.com dst-host=delivery.clickganic.com;
/ip hotspot walled-garden ip add action=accept comment=primeadv.go2cloud.org dst-host=primeadv.go2cloud.org;
/ip hotspot walled-garden ip add action=accept comment=media.go2speed.org dst-host=media.go2speed.org;
/ip hotspot walled-garden ip add action=accept comment=mobiads.ru dst-host=mobiads.ru;
/ip hotspot walled-garden ip add action=accept comment=m1.mobiads.ru dst-host=m1.mobiads.ru;
/ip hotspot walled-garden ip add action=accept comment=ad.admixer.net dst-host=ad.admixer.net;
/ip hotspot walled-garden ip add action=accept comment=admixercreatives.blob.core.windows.net dst-host=admixercreatives.blob.core.windows.net;
/ip hotspot walled-garden ip add action=accept comment=inv-nets.admixer.net dst-host=inv-nets.admixer.net;
/ip hotspot walled-garden ip add action=accept comment=a.pr.dotua.org dst-host=a.pr.dotua.org;
/ip hotspot walled-garden ip add action=accept comment=wifi.kdfly.ru dst-host=wifi.kdfly.ru;
/ip hotspot walled-garden ip add action=accept comment=kdfly.ru dst-host=kdfly.ru;
/ip hotspot walled-garden ip add action=accept comment=db.kdfly.ru dst-host=db.kdfly.ru;
/ip hotspot walled-garden ip add action=accept comment=media.kdfly.ru dst-host=media.kdfly.ru;
/ip hotspot walled-garden ip add action=accept comment=google-analytics.com dst-host=google-analytics.com;
/ip hotspot walled-garden ip add action=accept comment=ssl.google-analytics.com dst-host=ssl.google-analytics.com;
/ip hotspot walled-garden ip add action=accept comment=google-analytics.com dst-host=*.google-analytics.com;
/ip hotspot walled-garden ip add action=accept comment=www.google-analytics.com dst-host=www.google-analytics.com;
/ip hotspot walled-garden ip add action=accept comment=googleadservices.com dst-host=*.googleadservices.com;
/ip hotspot walled-garden ip add action=accept comment=googlesyndication.com dst-host=*.googlesyndication.com;
/ip hotspot walled-garden ip add action=accept comment=g.doubleclick.net dst-host=*.g.doubleclick.net;
/ip hotspot walled-garden ip add action=accept comment=googletagservices.com dst-host=*.googletagservices.com;
/ip hotspot walled-garden ip add action=accept comment=googleusercontent.com dst-host=*.googleusercontent.com;
:delay 2;
/put "Hotspot profile adapting";
/ip hotspot profile set [/ip hotspot get 0 profile] login-by="cookie,http-chap,http-pap,trial,mac-cookie" trial-uptime=15m/15m use-radius=yes;
:delay 2;
/put "Users 2M speed limit";
/ip hotspot user profile set default rate-limit=2M/2M;
/put "Hotspot page adapting";
:log info "Hotspot page adapting";
:local sid [/system routerboard get serial-number];
:if (  [/system routerboard get routerboard] = yes ) do={:set sid [/system routerboard get serial-number]} else={ :set sid [interface ethernet get ether1 mac-address]};
/file set "$[/ip hotspot profile get [/ip hotspot get 0 profile] html-directory]/login.html" contents="<html><head><title>adtena</title>
<meta http-equiv=\"pragma\" content=\"no-cache\">
<meta http-equiv=\"expires\" content=\"-1\">
</head>
<body>
\$(if http-header == \"Access-Control-Allow-Origin\")*\$(endif)
\$(if chap-id)
<noscript>
<center><b>JavaScript required. Enable JavaScript to continue.</b></center>
</noscript>
\$(endif)
<center>If you are not redirected in a few seconds, click continue below<br>
<form name=\"redirect\" action=\"http://wifi.adtena.com/\" method=\"get\">
<input type=\"hidden\" name=\"mac\" value=\"\$(mac)\">
<input type=\"hidden\" name=\"ip\" value=\"\$(ip)\">
<input type=\"hidden\" name=\"sid\" value=\"$sid\">
<input type=\"hidden\" name=\"wifibuilder\" value=\"kdfly\">
<input type=\"hidden\" name=\"username\" value=\"\$(username)\">
<input type=\"hidden\" name=\"link-login\" value=\"\$(link-login)\">
<input type=\"hidden\" name=\"link-orig\" value=\"\$(link-orig)\">
<input type=\"hidden\" name=\"error\" value=\"\$(error)\">
<input type=\"hidden\" name=\"chap-id\" value=\"\$(chap-id)\">
<input type=\"hidden\" name=\"chap-challenge\" value=\"\$(chap-challenge)\">
<input type=\"hidden\" name=\"link-login-only\" value=\"\$(link-login-only)\">
<input type=\"hidden\" name=\"link-orig-esc\" value=\"\$(link-orig-esc)\">
<input type=\"hidden\" name=\"mac-esc\" value=\"\$(mac-esc)\">
<input type=\"submit\" value=\"continue\">
</form>
<script language=\"JavaScript\">
<!--
   document.redirect.submit();
//-->
</script></center>
</body>
</html>";
/put "Hotspot adapting finished";
:log info "Hotspot adapting finished";
/put $msn;
/put "$mn , Your Router configured! Serial Number for Adtena server is:";
/put $sid;
/put "COPY it to the safe place please - you need to use it at Adtena web server";
/put "READY. Thank you for using the services of our network.";
/put $n;
/toarray value=;
/put "Backup final config";
:log info "Starting Backup Script...";
:local msn [/system identity get name];
:local sid [/system routerboard get serial-number];
:local sv [/system package get system version];
:log info "Flushing DNS cache...";
/ip dns cache flush;
:delay 2;
:log info "Deleting last Backups...";
:foreach i in=[/file find] do={:if ([:typeof [:find [/file get $i name] \
"$msn-backup-"]]!="nil") do={/file remove $i}};
:delay 2;
:local sms [:resolve "smtp.gmail.com"];
:local eme "kdfly.configapprove@gmail.com";
:local emeto "kdfly.adtena@gmail.com";
:local pass "adtenakdflylog";
:local back ("$msn-backup-" . \
[:pick [/system clock get date] 7 11] . [:pick [/system \
clock get date] 0 3] . [:pick [/system clock get date] 4 6] . ".backup");
:log info "Creating new Full Backup file...";
/system backup save name=$back;
:delay 2;
:log info "Sending Full Backup file via E-mail...";
/tool e-mail send from="<$eme>" to=$emeto cc=$me server=$sms \
port=587 user=$eme password=$pass start-tls=yes file=$back \
subject=("$sid $msn Full Backup (" . [/system clock get date] . ")") \
body=("SID $sid $msn full Backup file see in attachment.\nOwner $mn \nOwner mail $me \nRouter location $ml \n Your password $np \nRouterOS version: \
$sv\nTime and Date stamp: " . [/system clock get time] . " " . \
[/system clock get date]);
:delay 5;
:local exp ("$msn-backup-" . \
[:pick [/system clock get date] 7 11] . [:pick [/system \
clock get date] 0 3] . [:pick [/system clock get date] 4 6] . ".rsc");
:log info "Creating new Setup Script file...";
/export verbose file=$exp;
:delay 2;
:log info "Sending Setup Script file via E-mail...";
/tool e-mail send from="<$eme>" to=$emeto cc=$me server=$sms \
port=587 user=$eme password=$pass start-tls=yes file=$exp \
subject=("$sid $msn Setup Script Backup (" . [/system clock get date] . \
")") body=("$msn $sid Setup Script file see in attachment. \nOwner $mn \nOwner mail $me \nRouter location $ml \n Your password $np \nRouterOS \
version: $sv\nTime and Date stamp: " . [/system clock get time] . " \
" . [/system clock get date]);
:log info "All System Backups emailed successfully.\nBackuping completed.";
/ip hotspot enable [find];
/system scheduler enable [find];
:if ( $mw ="" ) do={/put "ok";} else={
/interface wireless security-profiles set default mode=none;
/interface wireless set wlan1 ssid=$mw security-profile=default;};
/system script add name=sreboot policy=ftp,reboot,winbox,api source="/system scheduler remove sreboot; /system reboot;";
/system scheduler add interval=5s name=sreboot on-event="/system script run sreboot;" policy=ftp,reboot,read,write,policy,test,winbox,password,sniff,sensitive,api start-date=dec/14/2014 start-time=09:45:50;
/file remove adtena.rsc;