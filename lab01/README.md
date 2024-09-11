[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/hNsVG0zF)
[![Open in Codespaces](https://classroom.github.com/assets/launch-codespace-2972f46106e565e64193e422d61a12cf1da4916b45550586e14ef0a7c637dd04.svg)](https://classroom.github.com/open-in-codespaces?assignment_repo_id=15734258)
# Lab 1 : CEG 3400 Intro to Cyber Security

## Name:  Alec Porter

### Task 1: Hashing

**Reminder Deliverable:** Is your `salted-data.csv` in this repository?
> salted-data.csv and salted data script (lab1hash.sh) uploaded.\
> nonce-data.csv and nonce data script (lab1hashextra.sh) uploaded.

Answer the following in this file:

* How many unique users are in the data?
  > There are 33 unique users.
* How many salts did you create?
  > I created 33 random five character salts.
* How many possible combinations will I need to try to figure out the secret ID
  of all students (assume I know all potential secret IDs)
  > You will need 33^2 or 1089 combinations.  You need to use each salt I generated (33) with each secret ID (33).
* Instead of salts, if you were to use a nonce (unique number for each hashed
  field) how many possible combinations would I need to try?
  > There are 1023 lines in the file which will be 1023 unique salts and 33 unique IDs so you need to run 1023*33 or 33759 combinations.
* Given the above, if this quiz data were *actual* class data, say for example
  your final exam, how would you store this dataset?  Why?
  > Given there isn't any PII in the data I would use a nonce like in the above question and throw in a couple of key stretches.  That should dissuade the vast majority of attackers given the value of the underlying data.

```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 1 here

# generate random number, hash it, and keep first 5 characters to create salt (nice & quick way to generate a random salt)
salt=$(echo $RANDOM | md5sum | head -c 5)

# generates hash based on salt and username while removing spaces and - at the end of the hash
hashed=$(cut -c 1-64 <<< $(printf $salt$userName | sha256sum))

```

---

### Task 2: Crypto Mining

**Reminder Deliverable:** Is your "mining" code in this repository (`mining/`)?
**Reminder Deliverable:** Is your nonce + word combos in `coins.txt`?
> Added mining script (KFCminer.sh) and dictionary (wordlist) to miner directory.
> Updated coin.txt files.

Answer the following:

* Paste your ***nonce+word(s) and hash(s)*** below ( either 3x `000` hashes or 1x `0000`
hash)

```
12091canal = 0003bd2ef77609ea8d770e2bac82e096e7679ba14c56997afb31a19748b24f2a
28741use = 000f3abe57a0cce5e1557fdef7c1f57445b797d34ca1e1b2e08e6e0d102ab3c0
26847viking = 000766396515823ce351e67a72ebcac3298a466abb98d5271a7ebd3f9847f54a
92layout = 00002130f2395d820963277594014654167489f2e24b083ff1d8ef1317e331c0
```
* Bonus (5) Point Hash
```
30205logistics = 00000c6fe57321c845a228e306a463bddcb449a9192e8fd9ae2e25768444fda8
```

* How many words were in your dictionary?
  > I used a 10,000 long wordlist from MIT.
* How many nonces did your code iterate over?
  > I used $RANDOM to generate nonces which gave me a total of 32,768 potential nonces to iterate over.
* What was the maximum number of hashes your code *could* compute given the above?
  > Maximum number of hashes could be 10,000*32,768 for a total of 327,680,000 hashes.
* What did you think about Task 2?
  > I doubt bash is the fastest way to do this type of calculation but finding 3 hashes that started with 000 did not take very long (98 seconds for the three hashes listed above).
  > It took 298 seconds to find a single hash starting with 0000 and it took 821 seconds to find a single hash starting with 00000.
  > I found it interesting that crypo is basically calulating hashes with specific values and now I know why speical hardware like ASICs were built for mining.
* Is there a better way than brute force to attempt to get higher valued coins?
  > I don't see how based on how a hash works and seaching around the interent also supports that brute force is the only way.
* Why or why not?
  > The hasing algorithm was designed to avoid this type of situation because it is irreversible and it employs the avalanche effect.
  > There shouldn't be any type of pattern you can develop that would guarantee a hash starts with a string of zeros or any other specific sequence of characters. 


```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 2 here
```

