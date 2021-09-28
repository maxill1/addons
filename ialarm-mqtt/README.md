# ialarm-mqtt
This add-on allows you to control iAlarm (antifurtocasa365, Emooluxr, Casasicura and other Meian clones) via node-ialarm library
Some clones model example:
* ST-IVCGT

<a href="https://www.buymeacoffee.com/maxill1" target="_blank">
<img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg" alt="Buy Me A Coffee"></a>

## features:
* arm home
* arm away
* disarm
* zone info (ok/problem, open, alarm, bypass, fault, low battery, signal loss) - NOTE: in order to obtain 'open' property in real time you must enable "DoorDetect" ("Ispezione sensori porta" on italian guard ip panel) in your alarm web panel options (http://192.168.1.x/Option.htm)
* home assistant [mqtt-discovery](https://www.home-assistant.io/docs/mqtt/discovery/)


### basic configuration

Put in server the "web panel" address and login data. 

```yaml
server:
  host: 192.168.1.81 #web panel ip
  port: 80  #web panel port
  username: admin #web panel username
  password: password #web panel password
  pages: #optional custom pages for scraping
    - /RemoteCtr.htm #arm/disarm/zone status/zone bypass
    - /Zone.htm #zone info (name, etc)
    - /SystemLog.htm #event log
  zones: #number of zones to publish/handle in an array of included zones: [1,2,3,4,5,6,15,19,22]. It seems that 40 is the alarm limit
    - 1
    - 2
    - 3
    - 4
    - 5
    - 6
    #- 7 #this commented zone will not appear in Home Assistant
    #- 8 #this commented zone will not appear in Home Assistant
    #- 9 #this commented zone will not appear in Home Assistant
    #- 10 #this commented zone will not appear in Home Assistant
    - 11
    - 12
    - 13
    - 14
    - 15
    - 16
    - 17
    - 18
    - 19
    - 20
    - 21
    - 22
    - 23
    - 24
    - 25
    - 26
    - 27
    - 28
    - 29
    - 30
    - 31
    - 32
    - 33
    - 34
    - 35
    - 36
    - 37
    - 38
    - 39
    - 40  
  polling_status: 30000  #milliseconds for polling alarm status (default is 30 seconds)
  polling_events: 10000 #milliseconds for polling alarm log events (default is 10 seconds)
mqtt:
  host: 192.168.1.82 #mqtt server ip
  port: 1883 #mqtt server port
  username: admin #mqtt panel username
  password: password #mqtt panel password
  clientId: ialarm-mqtt #mqtt client id
  cache: 5m #this will sends data only if changed or every 5 minutes
  retain: true #mqtt retain
code: 1234 #HA frontend alarm code
zoneName: Zone #zone prefix name (Zone 1 Kitchen, etc )
events: #events sensor configuration
  name: iAlarm last event
  icon: mdi:message-alert
bypass: #bypass switch configuration
  name: Bypass
  icon: mdi:lock-open
zones: # specific zone config
  - number: '39' #zone number
    contactType: NC #NC=normally closed, NO=normally opened
    device_class: moisture #ha device class
    statusProperty: open #status property to monitor
```	

#### HA frontend alarm code

if a 4 digit "code" is defined, it will be used to enable or disable the alarm in the frontend, see [alarm_control_panel.mqtt/#code](https://www.home-assistant.io/integrations/alarm_control_panel.mqtt/#code)

```yaml
code: 1234

```

#### specific zone config

Most of the sensors are normally closed but some water leak works as normally open contact, so to correcly report them to home assistant the sensor can configured as "contactType" : "NO" and "statusProperty" : "open" (normally we check "problem" which is related to the status code != 0 and in this case is 16)To report the sensor as a different kind (smoke, gas, door, moisture, etc) just change "device_class" to [one of those supported by Home Assistant](https://www.home-assistant.io/integrations/binary_sensor/#device-class).

```yaml
zones:
  - number: '39' #zone number
    contactType: NC #NC=normally closed, NO=normally opened
    device_class: moisture #ha device class
    statusProperty: open #status property to monitor

```
