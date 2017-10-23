#!/usr/bin/sh

interpret_num()
{
  case $1 in
    ''|*[!0-9]*) echo "-1" ;;
    *) echo $1 ;;
  esac
}

interpret_bool()
{
  case $1 in
    [Nn]*) echo "0" ;;
    *) echo "1" ;;
  esac
}

echo -n "Ile zwrotek? : "
read zwrotek
zwrotek=`interpret_num $zwrotek`
if [ "$zwrotek" -le 0 ]; then
  zwrotek=8
fi

echo -n "Tryb? (0 - ABAB, 1 - ABBA, 2 - AABB) : "
read tryb
tryb=`interpret_num $tryb`
if [ "$tryb" -lt 0 -o "$tryb" -gt 2 ]; then
  tryb=0
fi

echo -n "Powtórzenia? T/n : "
read powtok
powtok=`interpret_bool $powtok`

./TurboWieszcz.py $zwrotek $tryb $powtok

echo -n "Jeszcze raz? T/n : "
read jeszcze
jeszcze=`interpret_bool $jeszcze`
if [ "$jeszcze" -ne 0 ]; then exec $0; fi

