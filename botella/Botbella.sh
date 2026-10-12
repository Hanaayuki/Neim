#!/usr/bin/env bash
# Neim - Asistente personal para une artiste non-binary 💜
# Creado por Hannayuki | https://github.com/Hanaayuki

URL_ANILIST="https://anilist.co"
URL_MAL="https://myanimelist.net"
URL_ANI_ES="https://github.com/Zhuchii/ani-es"
URL_ITCH="https://itch.io/games/tag-lesbian" # Juegos indie con temática lésbica
URL_BUTTERFLY_SOUP="https://suprayuri.itch.io/butterfly-soup" # Visual Novel recomendada

# Directorio donde se encuentra este script
DIR_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

limpiar() {
    clear 2>/dev/null || true
}

pausa() {
    printf '\nPresiona [Enter] para continuar...'
    read -r _ || true
}

confirmar() {
    local respuesta
    printf '%s [s/N]: ' "$1"
    read -r respuesta || return 1
    [[ "${respuesta,,}" == "s" || "${respuesta,,}" == "si" || "${respuesta,,}" == "sí" ]]
}

abrir_url() {
    local url="$1"
    if command -v xdg-open >/dev/null 2>&1; then
        xdg-open "$url" >/dev/null 2>&1 &
        echo "Abriendo..."
    else
        echo "Abre manualmente esta dirección: $url"
    fi
}

reproducir_emu_terror() {
    limpiar
    echo "=================================================="
    echo "                  SECRETO 666
    echo "=================================================="
    
  
   local video
    video="$(find "$DIR_SCRIPT/video" -maxdepth 1 -type f -iname "emu_terror.*" 2>/dev/null | head -n 1)"

    if [[ -n "$video" && -f "$video" ]]; then
        echo "¡encontre el video me siento como cyberwolf"
        if command -v mpv >/dev/null 2>&1; then
            mpv "$video" &>/dev/null &
        elif command -v vlc >/dev/null 2>&1; then
            vlc "$video" &>/dev/null &
        else
            xdg-open "$video" &>/dev/null &
        fi
    else
        echo "no he encontrado el archivo 666 me cago en todo en esta carpeta:"
        echo "   $DIR_SCRIPT"
        echo "Asegúrate de que el vídeo esté en la misma carpeta botella"
    fi
}

#actuliza la wa
actualizar_neim() {
    echo "=================================================="
    echo "       ACTUALIZACIÓN COMPLETA DEL SISTEMA"
    echo "=================================================="
    echo "Ejecutando actualización de DNF, Flatpak y limpieza..."
    echo
    
    echo "1/3 Actualizando repositorios y paquetes (dnf upgrade --refresh)..."
    sudo dnf upgrade --refresh
    
    echo -e "\n2/3 Actualizando aplicaciones Flatpak (flatpak upgrade)..."
    flatpak upgrade
    
    echo -e "\n3/3 Limpiando paquetes huérfanos (dnf autoremove)..."
    sudo dnf autoremove
    
    echo -e "\n ¡Sistema impecable, listo para crear y jugar!"
}

#porfavot funciona la puta madre o me amto


menu_anime() {
    local opcion busqueda
    while true; do
        limpiar
        echo "=================================================="
        echo "              🌸 ZONA ANIME DE NEIM 🌸"
        echo "=================================================="
        echo " 1) Ver AniList "
        echo " 2) Ver MyAnimeList"
        echo " 3) Ver anime desde la terminal (ani-es)"
        echo " 4) Volver al menú principal"
        echo "=================================================="
        printf "Elige una opción: "
        read -r opcion || return
        
        case "$opcion" in
            1) abrir_url "$URL_ANILIST"; pausa ;;
            2) abrir_url "$URL_MAL"; pausa ;;
            3)
                if command -v ani-es >/dev/null 2>&1; then
                    printf "Escribe el nombre del anime (vacío para cancelar): "
                    read -r busqueda || return
                    if [[ -n "$busqueda" ]]; then
                        ani-es "$busqueda"
                    fi
                else
                    echo "ani-es no está instalado en el sistema."
                    if confirmar "¿Quieres ver el repositorio de ani-es para instalarlo?"; then
                        abrir_url "$URL_ANI_ES"
                    fi
                fi
                pausa
                ;;
            4) return ;;
            *) echo "Opción no válida."; pausa ;;
        esac
    done
}

#no se que wea cree aqui por que me lo recomendo un amigo
menu_creativo() {
    local opcion
    while true; do
        limpiar
        echo "=================================================="
        echo "                  sotano de bella                 "
        echo "=================================================="
        echo " 1) Abrir Krita"
        echo " 2) Explorar juegos indie lésbicos (Itch.io)"
        echo " 3) Abrir Steam"
        echo " 4) Volver al menú principal"
        echo "=================================================="
        printf "Elige una opción: "
        read -r opcion || return
        
        case "$opcion" in
            1)
                if command -v krita >/dev/null 2>&1; then
                    echo "Abriendo Krita para crear arte..."
                    krita &>/dev/null &
                else
                    echo "Krita no está instalado o no se encuentra en el PATH."
                    if confirmar "¿Quieres instalar Krita con flatpak?"; then
                        flatpak install flathub org.kde.krita -y
                    fi
                fi
                pausa
                ;;
            2) abrir_url "$URL_ITCH"; pausa ;;
            
            3)
                if command -v steam >/dev/null 2>&1; then
                    echo "Iniciando Steam..."
                    steam &>/dev/null &
                else
                    echo "Steam no está directamente en el PATH. Puedes abrirlo desde tu menú de apps."
                fi
                pausa
                ;;
            4) return ;;
            *) echo "Opción no válida."; pausa ;;
        esac
    done
}

# cyno le dice a mitya en igles hey nice to mi-tya
contar_chiste() {
    echo "¡Aquí viene un chiste para alegrarte el día, artiste!"
    chiste=$(($RANDOM % 10 + 1))
    sleep 1
    case $chiste in
        1) echo "¿Qué hace una abeja en el gimnasio? ¡Zum-ba!" ;;
        2) echo "¿Cómo se despiden los químicos? ¡Ácido un placer!" ;;
        3) echo "¿Cuál es el último animal que subió al arca de Noé? ¡El del-fin!" ;;
        4) echo "¿Por qué el libro de matemáticas estaba triste? ¡Porque tenía demasiados problemas!" ;;
        5) echo "¿Qué le dijo el tomate a la cebolla? ¡Eres tan llorona!" ;;
        6) echo "María, ¿Cuánto es 4x4? ¡Empate!" ;;
        7) echo "¿Por qué el elefante no usa computadora? ¡Porque le da miedo el ratón!" ;;
        8) echo "¿Qué le dice una impresora a otra? ¿Esa hoja es tuya o es impresión mía?" ;;
        9) echo "¿Qué le dice una iguana a su hermana gemela? ¡Somos iguanitas!" ;;
        10) echo "¿Cómo maldice un pollo a otro? ¡Caldito seas!" ;;
    esac
}

#ineffacalculator
calculadora_neim() {
    echo "--- Calculadora de Neim ---"
    echo "1) Sumar"
    echo "2) Restar"
    echo "3) Multiplicar"
    echo "4) Dividir"
    printf "Elige una opción [1-4]: "
    read -r op
    
    case $op in
        1)
            printf "Dime el primer número: "; read -r n1
            printf "Dime el segundo número: "; read -r n2
            echo "Resultado: $((n1 + n2))"
            ;;
        2)
            printf "Dime el primer número: "; read -r n1
            printf "Dime el segundo número: "; read -r n2
            echo "Resultado: $((n1 - n2))"
            ;;
        3)
            printf "Dime el primer número: "; read -r n1
            printf "Dime el segundo número: "; read -r n2
            echo "Resultado: $((n1 * n2))"
            ;;
        4)
            printf "Dime el primer número: "; read -r n1
            printf "Dime el segundo número: "; read -r n2
            if [ "$n2" -eq 0 ]; then
                echo "Error: No se puede dividir entre cero."
            else
                echo "Resultado: $((n1 / n2))"
            fi
            ;;
        *) echo "Opción no válida." ;;
    esac
}

#Este es el inicio del script uwu
echo "=================================================="
echo " 🧸Hola, bienvenide. Soy  Neim tu asistente."
echo "=================================================="
printf "¿Cómo te encuentras hoy? (Pulsa Enter para continuar)"
read -r _

while true; do
    limpiar
    echo "=================================================="
    echo " ¿QUÉ HACEMOS HOY? 💜"
    echo "=================================================="
    echo " 1) Ver tu memoria RAM"
    echo " 2) Ver tu Dirección IP"
    echo " 3) Ver espacio en tus discos"
    echo " 4) Ver la hora, mes y año"
    echo " 5) Actualizar sistema (DNF + Flatpak + Autoremove)"
    echo " 6) Zona Anime (AniList, MAL y terminal)"
    echo " 7) Espacio de Arte y Videojuegos"
    echo " 8) Abrir calculadora"
    echo " 9) Cuéntame un chiste"
    echo "10) Enlace musical sorpresa (YouTube)"
    echo "11) Apagar el ordenador"
    echo "12) Salir"
    echo "=================================================="
    printf "Elige una opción [1-12]: "
    read -r numero || break

    case "$numero" in
        1) free -h; pausa ;;
        2) ip a | grep inet; pausa ;;
        3) df -h | grep /dev/; pausa ;;
        4) echo "Fecha y hora actual:"; date; pausa ;;
        5) actualizar_neim; pausa ;;
        6) menu_anime ;;
        7) menu_creativo ;;
        8) calculadora_neim; pausa ;;
        9) contar_chiste; pausa ;;
        10) 
            url="https://www.youtube.com/watch?v=V7HdWeYbV3Q&list=RDV7HdWeYbV3Q&start_radio=1"
            abrir_url "$url"
            pausa 
            ;;
        11) 
            if confirmar "¿Seguro que quieres apagar el ordenador?"; then
                poweroff
            fi
            ;;
        12) 
            echo "¡Hasta luego! Que pases un día genial creando y jugando 💜"
            exit 0
            ;;
        666)
            reproducir_emu_terror
            pausa
            ;;
        *) 
            echo "El número no es válido. Elige una opción del 1 al 12."
            sleep 1 
            ;;
    esac
done