#!/bin/bash

target_dir=$1  # The directory containing the encrypted files
key=$2         # The decryption key

echo "Decrypting files in $target_dir..."

for file in $target_dir/*.enc; do
  openssl enc -d -aes-256-cbc -in "$file" -out "${file%.enc}" -k "$key"
  rm "$file"  # Remove the encrypted file after decryption
done
