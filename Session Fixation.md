# Session Fixation

Session Fixation attack, which exploits an application's failure to generate a new session ID every time a user authenticates.

## Exploitation example

Bob goes to the web and takes the ck session id and sends it to Alice "phishing", Alice logs in and Bob updates with the same parameter and takes control of Alice's account

```url
https://www.domain.com/login?ck_session_id=pO8STiZ2cihKtrQ6o74oEPILEqijnEabVYP7NWN7
```

### Reference

https://application.security/free-application-security-training/owasp-top-10-session-fixation
