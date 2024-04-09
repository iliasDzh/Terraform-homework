#!/bin/bash
sudo apt update 
sudo apt install apache -y
sudo systemctl start apache
sudo systemctl enable apache