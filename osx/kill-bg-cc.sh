#!/bin/bash
# kill all background CC service to save resource

pkill -9 "Core Sync"
pkill -9 "Creative Cloud"
pkill -9 "Adobe Desktop Service"
pkill -9 AdobeCRDaemon
pkill -f AdobeIPCBroker
pkill -f CCXProcess
pkill -f CCLibrary
