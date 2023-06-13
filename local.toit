import ds18b20 show Ds18b20
import gpio

GPIO_PIN_NUM ::= 32

main:
  pin := gpio.Pin GPIO_PIN_NUM
  ds18b20 := Ds18b20 pin

  (Duration --s=5).periodic:
    print "Temperature: $(%.2f ds18b20.read_temperature) C"

  ds18b20.close
  pin.close