[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/y99HrwDT)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=16135882)
# Lab 3 : CEG 3400

### Encryption

#### Name: Alec Porter

---

### Task 1 - Symmetric Encryption

* Embed and desribe (use your words) each image
  * *CBC*:
    > Looks like random colored static.
    > 
    > ![cbc image](./data/cbc.bmp)
  * *ECB*:
    > Looks like a zoomed in lcd screen where you can see the individual pixels of an image.
    > You can make out the shapes in the image and differentiate darker/lighter colors for the shapes.
    >
    > ![ecb image](./data/ecb.bmp)
  * *OFB*:
    > Looks like random colored static.
    >
    > ![ofb image](./data/ofb.bmp)
* Are you able to infer anything about the original image?
  > You are not able to infer anything about the original image from CBC or OFB encrpyting.  You are able to infer shapes and differentiate between light and dark colors in the ECB encrypted image. 
* Why do you think this is?  Dig into the typed of each encryption algorithm and explain.
  > CBC, ECB, and OFB are all types of block cipers where the picture is encrypted in blocks of data.
  >
  > ECB is the simplest of the three.  ECB divides the data into blocks and each block is encrypted separately from the rest.  Due to the simple nature of the ECB algorithm, it lacks diffusion.  Diffusion is a property of encryption similar to the avalanche effect in hashing where changing input data should have a major effect on the output.  Because ECD lacks diffusion, changes on individual blocks of data in the picture can be reflected in the encrypted picture.  This is especially true when there are large areas of uniform colors.  The lack of diffusion means that even though the blocks of data are encrypted, large areas with uniform color create a pattern that reflect the shape of objects in the original picture.  Pictures with complex patterns should be difficult to ascertain from the encrypted file.  Below is an example of a picture of Jupiter and it's ECB encryption. With the naked eye it's difficult, if not impossible, to relate anything in the encrypted image to the original image.
  >
  > ![example image](./data/Screenshot.png)
  > I also tried encrypting the original picture with a more complex password (24 characters with 6 uppercase letters, 6 lowercase letters, 6 numbers, and 6 symbols) and that had minimal effect on the encrypted output.  I was still able to see an oval and square in the encrypted image.
  >
  > CBC and OFB are more complex and encypt plain text blocks with previously ciphered blocks using an XOR.  This makes each block look random when compared to other blocks even if those other blocks are the same color.  That is why the CBC and OFB encrypted images look like random colors.
  > 
```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task here
```

---

### Task 2 - Asymmetric Encryption

* List all of the people that should be able to decrypt `task2.enc`
* What key should be used to encrypt this file so that the instructor can guarantee that
  you encrypted it?

---

### Task 3 - Encrypted Email

* What is the benefit to you for having set this up?  Please be verbose and dicuss what additional
  protections having gpg encryption layerd into your email account provides.

---

### Task 4 - Digital Signatures

* What key would a recipient need to verify your signature?
* Why is it important that you not change the file after signing it?


