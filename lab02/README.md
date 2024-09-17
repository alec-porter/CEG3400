[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/ywKlfxEu)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=15905841)
# CEG 3400 - Lab 2 - Password cracking

Name: Alec Porter

---

## Task 1 - `hashcat`

Use the hashcat attack from the instruction on the `sha512.hashes`.  Please include the hashcat potfile in this repository and answer the following.

* Describe what the `-a 0` flag does when used with `hashcat`.  Be verbose and explain its greatest strength and weakness.
  > The -a flag puts hashcat into Attack-mode and 0 is the type of Attack-mode which is called Straight.  This mode is equivalent to a dictionary attack or wordlist attack against a provided salt/hash list.  Hashcat reads entries line by line from a text file and uses each line as a password candidate against each line in the salt/hash list.  The strength of this attack is that you provide the dictonary which can be comprised of known common passwords or compromised passwords and hashcat automatically runs through each iteration, outputting the salt/hash and its associated password if found.  The disadvantage is that the technique is limited to checking only the password candidates in the dictionary file and could take a long time depending on the number of lines in the dictionary and the number of salt/hashes.  This attack can also be used with rules, where each rule is applied to each line in the dictionary.  This can greatly increase the number of possible passwords that can be checked against the salt/hash list but it also can greatly increases the amount of time to execute.  For example, if you use the rule "u" which generates all uppercase letters for each password in the dictionary, you have doubled the amount of passwords to check and have doubled the amount of time it takes to execute.

* How many passwords were you able to crack using `hashcat` with the `500_passwords.txt`?
  > Hashcat wouldn't run on my laptop so I used John the Ripper which cracked 24 passwords.

* Describe what would be needed to crack all hashes in the `/data/sha512.hashes` file.
  > You would need a massive dictionary (or dictionaries), run hashcat with a multitude of rules, some very powerful computers, and time.  There are plenty of dictionaries online as well as rule sets for hashcat that have been tested.  For example, the rule set "OneRuleToRuleThemAll" has over 52 thousand rules and was tested against 4.3 million unique MD5 hashes and it was able to crack 68.36% of the those hashes.  The biggest obstacle to cracking every password is time.  The tools exist and can easily be automated, it boils down to how long it will take to iterate through all the possible password combinations in the dictionary and the rule set. 

* What is the difference between our two hash files in `/data`?
  > The hashes in one file were generated using the sha512 algorith while the other file contains hashes generated using the yescrypt algorith.

* What benefit would `john` bring us when trying to crack *all* of the hashes provided (both the yescrypt and sha512 hashes)?
  > Based on my reaserch, hashcat doesn't support yescrypt which is the hasing algorithm used on Fedora Linux, Debain, Ubuntu, and Arch Linux.  That means hashcat will be limited in scope and Jon the Ripper (JTR) will be needed to crack all of the hashes on both lists.  One limitation to JTR is that it can only crack yescrypt hashes if the system supports yescrypt.  According to CyberScribbers (https://medium.com/cyberscribers-exploring-cybersecurity/hashcat-vs-john-the-ripper-jtr-f207c34c5b1c) hashcat has great GPU support while GPU support on JTR is more difficult to get working.  I was able to use hashcat in conjunction with my Nvidia RTX 3080 on my Windows 11 gaming computer to crack additional sha512 passwords using the rockyou.txt dictionary in under 2 hours so I can verify hashcat's GPU support works well and it was easy to set up.

---

## Task 2 - `john`

Use the same attack type from task 1 with John the Ripper against the `yescrypt.hashes`.  Include the John potfile in this repository and answer the following:
> Note: because I used JTR for both task 1 and task 2, the potfile (john.pot) contains passwords for both the sha512.hashes and yescrypt.hashes.

* How many passwords were you able to crack using `john` with the `500_passwords.txt`?
  > I was able to crack 14 passwords using JTR.

* What would be the maximum number of hashes `john` would compute assuming a 
  stragiht dictionary attack, `500_passwords.txt`, and the list of yescrypt hashes?
  > The maximum number of hashes would be 500 * 97 = 48500.  There are 500 passwords in the dictionary to hash with each of the 97 salts from the yescrypt.hashes file.

---

## Task 3 - Choose your own task:

Choose ***one*** of the following tasks and document your progress ***well***.

1. Crack one `sha512.hashes` or `yescrypt.hashes` hash with `500_passwords.txt` using a rule based attack (must be a password not found in task 1 or 2 above).
2. Crack one `sha512.hases` or `yescrypt.hashes` hash with `rockyou.txt` that was not found in task 1 or 2 above (this one is known to be possible within the time limit)
   * `rockyou.txt` can be downloaded with: `wget https://github.com/mkijowski/passwords/raw/master/dictionaries/rockyou.txt.gz`
   * Do ***NOT*** include `rockyou.txt` or `rockyou.txt.gz` anywhere in this repository.  I will deduct many points for doing so...

For whichever you chose write a report below documenting the following:

* Which task you chose.
* Your research (relevant links) and an overview of your testing.
* Your final successful attempt (or why you think your attempt failed).
* An estimate of the total number of hashes computed to complete this task.
* Each of the tasks above crack a hash that was not previously found.  Give a detailed description of how and why it was not found 
  previously and what your attack did differently. 
* Analasys of all passwords cracked (and uncracked), counts, trends, etc.

---

## Task 3 report can go here
1. Crack one `sha512.hashes` or `yescrypt.hashes` hash with `500_passwords.txt` using a rule based attack (must be a password not found in task 1 or 2 above)
  > I chose the rules based approach on sha512.hashes using JTR.  JTR has built in rules and rulesets which can be executed buy adding the following flag `--rules`.  You can secific which built in rulesets to use or define your own ruleset by editing the `john.conf` file.  I decided to run a set of my own custom rules that add a string of numbers to the end of the words in the word list.  Many people change up thier password by simply adding a set of numbers to the end of an existing password such as a date or a string of numbers (password12345, bob1998, etc.).
  > I created a set of rules that added the following strings to the end of each work in the wordlist:  1, 12, 123, 1234.  For example, in addition to using the wordlist word "dragon", JTR would also use "dragon1", "dragon12", "dragon123", and "dragon1234".  The following code was added to `john.conf`:
```
# my custom rules
[List.Rules:Myrules]
Az"1"
Az"12"
Az"123"
Az"1234"
Az"12345"
```
  > `[List.Rules:Myrules]` identifies a ruleset and gives it the name "Myrules".  `Az` instructs JTR to append at the end of the word the characters in quotes.  I ran the following command to run my ruleset:
```
john --wordlist=/<dictionary_path>/500_passwords.txt --format=crypt /<hashes_path>/sha512.hashes --rules:Myrules
```
  > This simple ruleset found five additional passwords:
```
$6$5XwZ4vpUvd4O0oLs$KCAv3HKoBZdfqRr8A8mVtTzDJ4rAhvanqxz.Vph52.rcqkBcvS/VPIS7BLmwYXOKIl2Qhz4/q8IACQ/1qYw3V/:pass123
$6$qPF3ouHZzhgnyGVv$lHySCg8i.QogRoPCPJ6P35wn2IuxdbxBAy2w/K1BbrP2feflx4M9NgEHv0Tx4uV1mCXfkQMrj07FE3LLGrry0/:password123
$6$z0wBQnceUvBQVYYP$0/PqclBbJzyzkRNj1dJ.wfOOIaxDinlaGeyHAJz.hag16LkHmh/XM6bfX6PCqREdRGPcre2qxQRhFldbed1Sy0:hello123
$6$Ab8BMeXizJMvJ9EJ$.JDfKf0Sdx3.a2l307dnTTUr676epCVMDRH6rhArW3KeGWroDnKUJtbx6AsTJEqgzTeOtt.GV2xn/JKf7yr7P1:password1234
$6$nHTb39JbVXtduO1L$BQ7kt/KUG/eBUzbGO4Hok2flpqkrI89F7OQXPR0BaUGR8A2.pZc0TNU9.ekaUIV9eyCZ0S9YzKTWo2Ku7IQgg.:password1234
```
  > This ruleset required an additional 2500 iterations of the dictionary (500 words * 5 rules).
  > The reason these passwords weren't found initially is because they are derivations on an existing word.  While the dictionary contains "password", it doesn't not include any derivations on that word so JTR will only use the word "password" when calculating hashes.  The ruleset instructs JTR to also run derivations on the words in the dictionary based on the rules outlined in the ruleset.  The rules can be simple (like my approach) or can be more complex.
  > One of the big trends based on the cracked passwords is the use of "password" either by itself or with a series of numbers.  Thirteen of the 29 found passwords were some derivation of "password".  Another trend was the use of a series of numbers as the password.  The strings "1234", "12345", etc. accounted for nine additional passwords.  The use of "password" and its derivations, and the use of a stirng of numbers accounted for 22 of the 29 found passwords.  Additionally, I was able to run hashcat on the sha512.hashes file using the rockyou.txt dictionary.  That found another 40 passwords with food items seeming to be a popular choice and at least a couple of students were flexing their Raider pride.
> 

  > Resources:<br>
  > https://countuponsecurity.com/wp-content/uploads/2016/09/jtr-cheat-sheet.pdf<br>
  > https://www.openwall.com/john/doc/RULES.shtml

   
---

## Bonus points (20 lab points)

My BONUS.md file: https://github.com/WSU-mkijowski/lab-2-passwords-alec-porter/blob/main/BONUS.md

