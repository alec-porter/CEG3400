[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/1uqnBW-y)
## Lab 5 : CEG 3400

### NIST Vulnerability Taxonomies

#### Name: Alec Porter

---

### Task 1 - CPE

* Your properly formatted CPE:  
`cpe:2.3:a:alec_porter_llc:word_game:1.0:*:*:en-us:cs1180_project_3:openjdk_17.0.12:x64:*`

```
<cpe_version>: I used CPE 2.3: https://nvlpubs.nist.gov/nistpubs/Legacy/IR/nistir7695.pdf
<part>: this is an application
<vendor>: me
<product>: I used my CS1180 Project 3 program which was titled “Word Game”
<version>: I used 1.0 because it was the completed version I tested and submitted for grading
<update>: no updates
<edition>: none because I don't need to reference back to CPE 2.2
<language>: it’s a word game entirely in english so I updated this field as the input/output
            is all in english
<sw_edition>: this application is tailored for my cs1180 class and is our third project so I
              completed this field
<target_sw>: this application was developed in a specific java environment so I included that
             as the targeted software to run the application
<target_hw>: this application was developed on, and for, x64 hardware
<other>: none
```  


---

### Task 2 - CWE

* Link to your top 25 CWE:
> **CWE-20: Improper Input Validation (https://cwe.mitre.org/data/definitions/20.html)**
> 
> CWE-20: Improper Input Validation is when the software receives data or input that is not validated correctly according to the syntax, expressions, or statements outlined in the software.  This could lead to the software executing code in unintended ways resulting in crashes, unexpected consumption of resources,  modification of data, or arbitrary execution command execution.  
>
> CWE-20 is ranked #6 on the 2023 CWE Top 25 Most Dangerous Software Weaknesses and #4 on the  		
2023 CWE Top 10 KEV Weaknesses.  While not specifically on the OWASP Top 10, Improper Input Validation is part of Injection which is #3 on that list.
>
> Input validation is used to ensure only properly formatted data or input is provided to the system.  It verifies the input provided by a user matches the expectations of the programmer prior to the program executing code.  This ensures the integrity and accuracy of the data not only being input, but the integrity and accuracy of data already in the system.  It also ensures the system is secure and reliable.  Input validation protects against malicious and non-malicious actors.  Malicious actors could be trying to gain unauthorized access or modify existing data using exploits in data input while non-malicious actors could inadvertently create erroneous data or modify existing data without even knowing it.  
>
> There are a multitude of considerations when developing an input validation scheme.  You must understand all the potential areas where inputs can enter your software.  Where the data is coming from whether it be from human interaction or input provided form other software sources such as API calls.  How the data is going to be handled in the program, the expected syntax (that data is in the correct format), and the expected semantics (does the data follow the correct business rules) used.  A large program could be processing inputs from a variety of sources and in a variety of formats making input validation complex.
>
> There are a large variety of input validation techniques.  You can implement a denylist/blacklist or allowlist/whitelist to check input syntax.  A denylist checks that input does not contain know exploits or syntax that would cause undesirable effects.  An allowlist checks that input contains only approved syntax.  You can use regular expressions to check if the input matches a specific pattern or you can convert the data format to something that can’t be executed in the program.

> **CWE Example**  
> Improper Input Validation vulnerability exists in PowerLogic EGX100 (Versions 3.0.0 and newer) and PowerLogic EGX300 (All Versions) that could cause denial of service or remote code execution via a specially crafted HTTP packet.
> 
> The EGX100 and EGX300 are Ethernet gateways used in electrical and power system monitoring.  These are legacy devices no longer supported by Schneider Electric.
> 
>https://download.schneider-electric.com/doc/SEVD-2021-159-03/SEVD-2021-159-03_PowerLogic_EGX100_and_EGX300_Security_Notification.pdf
> 
> `cpe:2.3:o:schneider-electric:powerlogic_egx100_firmware:3.0.0:*:*:*:*:*:*:*`
> 
> `cpe:2.3:o:schneider-electric:powerlogic_egx300_firmware:*:*:*:*:*:*:*:*`
> 
> `cpe:2.3:h:schneider-electric:powerlogic_egx300:-:*:*:*:*:*:*:*`
> 
> The mitigation for these vulnerabilities is to block HTTP access to the device and replace it with a currently supported product.  

> **CWE Example on Personally Created Code** 
> Input validation is a broad category and because of this it is discouraged form being used to map real-world vulnerabilities.  The current recommendation is to user lower-level children that are more specific to real-world vulnerabilities.  Because of this I’ll be using CWE-1286: Improper Validation of Syntactic Correctness of Input on code I’ve created for CS1180.
>
> Project 3 for CS1180 was to create a word game.  The program randomly picks a word with seven unique letters from a word list, scrambles the letters, and displays the scrambled letters.  The user then inputs words built from the scrambled letters and gets scored based on the number of valid words input and their complexity.  My program does not implement any strict input validation.  The user can input any combination of letters, numbers, symbols, etc. and my program only checks if all of the characters input by the user match one of the seven unique letters of scrambled word and then if the input is a valid word on a word list.
>
> The weakness in my implementation is that my program does not take into account the syntax of the input.  The program will take any user input and process that input.  Because this is a word game, there is an expected input from the user that would conform to a given syntax.  There is no need for special characters such as <, >, @, etc. to be in the user’s input.  I could update my code to reject any input with a special character or any non-alphabetic character.  The simplest strategy would be to implement a whitelist of approved characters.  I could reject the user’s input if any of the characters is not an alphabetic character as outlined in the whitelist.  
>
> CWE-1286 recommends a mitigation strategy using an “accept known good” input validation.  The whitelist of alphabetic characters would be the “known good” to validate user input against.  CWE-1286 also recommends not relying exclusively on looking for malicious inputs but denylists could be useful for detecting malformed inputs.  I could also build a blacklist of java keywords that won’t be accepted as input.  The whitelist of characters and the blacklist of java keywords would create a more secure and reliable program.  The impact of improper validation could run from minimal (improper date format in a record that has been archived and thus more difficult to find in searches) to major (the ability to inject arbitrary code based on the input provided to the system).


---

### Task 3 - CVE

* List your properly formatted CVE here: `AV:L/AC:L/PR:N/UI:N/S:U/C:N/I:L/A:L`
* Assign a CVSS score and defend it (why did you select what you selected in the caluclator) 
> CVSS Base Score: 5.1  
> Impact Subscore: 2.5  
> Exploitability Subscore: 2.5  
> CVSS Temporal Score: NA  
> CVSS Environmental Score: NA  
> Modified Impact Subscore: NA  
> Overall CVSS Score: 5.1  
> 
> Exploitability Metrics Attack Vector (AV) Local - this vulnerability requires local access to the computer the code will running on.  
> Attack Complexity (AC) Low - the code is very simple and if a vulnerability is found it is easy to repeat.  
> Privileges Required (PR) None - the attacker does not need any privileges to run the code.  
> User Interaction (UI) None - the attacker does not require any user interaction.  
> Scope (S) Unchanged - the vulnerable component and the impacted component are the same, the computer running the code.  
> Confidentiality Impact (C) None - the program does not contain confidential/restricted information and does not write any data to the operating system.  
> Integrity Impact (I) Low - the attacker may be able to modify data but it wouldn't have a direct or serious impact on users.  
> Availability Impact (A) Low - the attacker doesn't have the ability to completely deny service to users. Restarting the program or in a worst case scenario, restart the computer, would allow users to access the program.  

CVE writeup:
> CVE-2024-52000  
>  
> CNA: Matt Kijowski  
> Published:  2024-11-07  
>
> Description  
> 
> Improper Validation of Syntactic Correctness of Input vulnerability exists in Word Game 1.0 and earlier.  Word Game 1.0 and earlier does not employ sufficient validation of user input syntax which potentially allows attackers the ability to impact program performance and stability or result in unanticipated program actions and output.  
> 
> 
> References 
> 
> https://github.com/WSU-mkijowski/lab-5-nist-vulnerability-taxonomies-alec-porter/blob/main/README.md
> 
> Weakness Enumeration
> | CWE-ID | CWE Name | Source |
> | -------|----------|--------|
> | CWE-1286 | Improper Validation of Syntactic Correctness of Input | Alec Porter LLC |
>
> Known Affected Software Configurations  
> cpe:2.3:a:alec_porter_llc:word_game:1.0:*:*:en-us:cs1180_project_3:openjdk_17.0.12:x64:*
> 

