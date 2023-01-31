CREATE KEYSPACE stocks_keyspace WITH replication = {'class': 'NetworkTopologyStrategy','DC1': 1};
CREATE TABLE stocks_keyspace.stocks (
   symbol text, 
   ts timestamp, 
   close double, 
   high double, 
   interest double, 
   low double,
   open double,
   volume double, 
   PRIMARY KEY (symbol, ts));

CREATE TABLE stocks_keyspace.ema (
   symbol text, 
   ts timestamp,
   ema_10 double,
   ema_100 double,
   advise text,
   PRIMARY KEY (symbol, ts));

# {'Close': 35.25, 'High': 35.25, 'Interest': 0, 'Low': 35.25, 'Open': 35.25, 'Time': '2023-02-07T13:55:00.000000Z', 'Volume': 25}
#{"userid":1, "username":"test", "firstname":"test", "lastname":"test"}
#'Close': 964.4, 'High': 964.6, 'Interest': 0, 'Low': 964.4, 'Open': 964.5, 'Time': '2023-02-07T15:03:00.000000Z', 'Volume': 259, 'Symbol': 'NOVOb'}