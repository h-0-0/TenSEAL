# TenSEAL: with Enc-Enc Matrix-vector multiplication 
This is a fork of the TenSEAL repositry with additional functions for multiplying together an encrypted matrix with an encrypted vector. Use as follows:
```python 
result = enc_matrix.enc_matmul_enc(enc_vector, matrix_number_of_rows)
```
I've also exposed the rotation function which you may find usefull:
```python 
enc_vector_or_matrix.rotate_vector_inplace(int(rotation_step), context.galois_keys())
```
Enjoy!

## Instillation
You can try build this from source or using docker as described in 'TenSEAL_README.md' but it can be finnicky. I recommend just installing using one of the pre built wheels which can be found by clicking on versions in the github repo. Simply look for the wheel that matches your operating system and python version (eg. for python 3.11 look for cp311) then download it and install it with pip. 

