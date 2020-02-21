#!/bin/bash

touch Makefile

echo 'CC = gcc' > Makefile
echo 'CSAN = -Wall -Wextra' >> Makefile
echo 'CO = -o' >> Makefile
echo "MAIN = ${1}" >> Makefile
echo "OFILES = ${1/'.c'/'.o'}" >> Makefile
LINKS=""
LFLAGS=""

argv=($@)

for (( i = 1; i < $#; i++ )); do
  if [[ "${argv[$i]}" == "-l" ]]; then
    ((i+=1))
    while [[ ${argv[$i]} != -? && $i -lt $#  ]]; do
      LINKS="$LINKS ${argv[$i]}"
      ((i+=1))
    done
  fi
  if [[ "${argv[$i]}" == "-f" ]]; then
    ((i+=1))
    while [[ $i -lt $# ]]; do
      LFLAGS="$LFLAGS ${argv[$i]}"
      ((i+=1))
    done
  fi
done

echo "LINKS =$LINKS" >> Makefile
echo "LFLAGS =$LFLAGS" >> Makefile

echo "all:" >> Makefile
echo -e '\t$(CC) $(CSAN) $(CO) $(OFILES) $(MAIN) $(LINKS) $(LFLAGS)' >> Makefile
