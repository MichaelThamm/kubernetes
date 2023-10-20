#/bin/bash -e

for i in ./*.sh; do git update-index --chmod +x $i; done
for i in ./*/*.sh; do git update-index --chmod +x $i; done
