# digitale-dinge-59-poolthermometer

Toit Source Code für Episode 59: https://www.youtube.com/watch?v=UoxJYDQheCM

Please set the `GPIO_PIN_NUM` constant to the gpio pin that connects your DS18b20 sensor.
# local.toit

This example was taken from the official toit-ds18b20 github repo. It reads the temperature of a DS18b20 sensor every 5 seconds and prints it to the serial console.

# mqtt.toit

This example connects to MQTT broker `HOST`and publishes the temperature reading every 60 seconds to `TOPIC`