# Changelog

## 2.0.4
- updated node-ialarm@0.4.4 and ialarm-mqtt@0.9.0
- name is now configurable in yaml
- QoS configurable in yaml
- polling_status reduced to 5 seconds
- devices are now splitted (alarm and zones)
- every zone has now 4 sensors: alarm, fault, lowbat and wirelessLoss and 1 bypass switch
- 3 new switches: 
    - clear cache
    - clear discovery
    - alarm triggered cancel (resets sensors "alarm" property on alarm panel)

## 2.0.3
- fixed zone message with node-ialarm@0.4.2
- logging node-ialarm version on init

## 2.0.2
changed dockerfile ensure we are using latest verion of ialarm-mqtt

## 2.0
switched to tcp implementation. Please update port from 80 to 18034

```yaml
server:
  port: 18034 
```
also remove deprecated 'pages':

```yaml
  pages:
    - /RemoteCtr.htm 
    - /Zone.htm
    - /SystemLog.htm 
```

## 1.2
custom pages support for web scraper. 
Example:

```yaml
server:
  pages:
    - /status.html
    - /Zone.html
    - /SystemLog.html
```

## 1.1

- Zones handled as an array of int (was a single int before with max zone value). 

example: if you have 17 zones, change 1.0 config from:

```yaml
server:
  zones: 17
```

to 1.1 version:

```yaml
server:
  zones: 
   - 1
   - 2
   - 3
   - 4
   - 5
   - 6
   - 7
   - 8
   - 9
   - 10
   - 11
   - 12
   - 13
   - 14
   - 15
   - 16
   - 17
```

you can exclude zones by removing it from the array:

```yaml
server:
  zones: 
   - 1
   - 2
   - 3
   - 4
   - 5
   #- 6
   #- 7
   #- 8
   - 9
   - 10
   #- 11
   - 12
   #- 13
   - 14
   #- 15
   - 16
   - 17
```

## 1.0

- First release