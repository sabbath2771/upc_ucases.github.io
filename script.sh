#!/bin/bash

# Script para ejecutar GNOME Calculator
# Este script abre la calculadora de GNOME

# Verificar si gnome-calculator está instalada
if command -v gnome-calculator &> /dev/null; then
    echo "Iniciando GNOME Calculator..."
    gnome-calculator &
else
    echo "Error: gnome-calculator no está instalada"
    echo "Instalando gnome-calculator..."
    
    # Intentar instalar según el gestor de paquetes disponible
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y gnome-calculator
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y gnome-calculator
    elif command -v pacman &> /dev/null; then
        sudo pacman -S gnome-calculator
    fi
    
    # Ejecutar la calculadora
    gnome-calculator &
fi

echo "GNOME Calculator se está ejecutando..."
exit 0
