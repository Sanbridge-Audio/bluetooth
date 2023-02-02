import os
import sys
import struct
import bluetooth

nearby_devices = bluetooth.discover_devices()

for bdaddr in nearby_devices:
    print("Found device with address: ", bdaddr)
    name = bluetooth.lookup_name(bdaddr)
    print("\tName: ", name)
    services = bluetooth.find_service(address=bdaddr)
    for service in services:
        print("\tService Name: %s" % (service["name"]))
        print("\tService Description: %s" % (service["description"]))
        print("\tService Provider: %s" % (service["provider"]))
        print("\tService Protocol: %s" % (service["protocol"]))
        print("\tService Port: %s" % (service["port"]))
        print("\tService ID: %s" % (service["service-id"]))
        print("\n")
