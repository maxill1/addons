# Changelog

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