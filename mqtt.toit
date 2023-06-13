import ds18b20 show Ds18b20
import gpio

import mqtt
import net
import monitor

GPIO_PIN_NUM ::= 32

HOST ::= "192.168.100.110"

CLIENT_ID ::= "studiothermometer"
TOPIC ::= "okaki/studiothermometer/temperature"

main:
  pin := gpio.Pin GPIO_PIN_NUM
  ds18b20 := Ds18b20 pin
  transport := mqtt.TcpTransport net.open --host=HOST
  client := mqtt.Client --transport=transport
  client.start --client_id=CLIENT_ID
      --on_error=:: print "Client error: $it"

  print "Connected to broker"
  (Duration --s=60).periodic:
    temperature := ds18b20.read_temperature
    temperature_str := "$(%.2f temperature)"
    print "Temperature: $(%.2f temperature) C"    
    client.publish TOPIC temperature_str.to_byte_array
    

  ds18b20.close
  pin.close
  client.close
