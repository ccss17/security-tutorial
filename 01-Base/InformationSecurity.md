# Information security

[https://en.wikipedia.org/wiki/Information_security](https://en.wikipedia.org/wiki/Information_security)

the practice of protecting information by mitigating information risks.  

- Information security's primary focus is the balanced protection of the confidentiality, integrity and availability of data, all without hampering organization productivity. 

## History

Since the early days of communication, diplomats and military commanders understood that it was necessary to provide some mechanism to protect the confidentiality of correspondence and to have some means of detecting tampering. // Julius Caesar is credited with the invention of the Caesar cipher c. 50 B.C., which was created in order to prevent his secret messages from being read should a message fall into the wrong hands. 

In the mid-nineteenth century more complex classification systems were developed to allow governments to manage their information according to the degree of sensitivity. For example, by the time of the First World War, multi-tier classification systems were used to communicate information to and from various fronts, which encouraged greater use of code making and breaking sections in diplomatic and military headquarters. // Encoding became more sophisticated between the wars as machines were employed to scramble and unscramble information. 

The end of the twentieth century and the early years of the twenty-first century saw rapid advancements in telecommunications, computing hardware and software, and data encryption.  These computers quickly became interconnected through the internet.

## Definitions

1. "Preservation of confidentiality, integrity and availability of information. Note: In addition, other properties, such as authenticity, accountability, non-repudiation and reliability can also be involved." (ISO/IEC 27000:2009)

2. "Ensures that only authorized users (confidentiality) have access to accurate and complete information (integrity) when required (availability)." (ISACA, 2008)

## Basic principles

1. Confidentiality(기밀성)

    In information security, confidentiality "is the property, that information is not made available or disclosed to unauthorized individuals, entities, or processes." Examples of confidentiality of electronic data being compromised include laptop theft, password theft, or sensitive emails being sent to the incorrect individuals.

2. Integrity(무결성)

    In information security, data integrity means that data cannot be modified in an unauthorized or undetected manner. 

3. Availability(가용성)

    For any information system to serve its purpose, the information must be available when it is needed. 

## Access control

Access to protected information must be restricted to people who are authorized to access the information. The computer programs, and in many cases the computers that process the information, must also be authorized. 

### Identification

Identification is an assertion of who someone is or what something is. If a person makes the statement "Hello, my name is John Doe" they are making a claim of who they are. Typically the claim is in the form of a **username**. By entering that username you are claiming "I am the person the username belongs to".

### Authentication

Authentication is the act of verifying a claim of identity. By entering the correct password, the user is providing evidence that he/she is the person the username belongs to. 

There are three different types of information that can be used for authentication:

- Something you know: things such as a PIN, a password, or your mother's maiden name

- Something you have: a driver's license or a magnetic swipe card

- Something you are: biometrics, including palm prints, fingerprints, voice prints and retina (eye) scans

### Authorization

After a person, program or computer has successfully been identified and authenticated then it must be determined what informational resources they are permitted to access and what actions they will be allowed to perform (run, view, create, delete, or change). This is called authorization. 

- 알 필요성의 원칙(need-to-know)

  This principle gives access rights to a person to perform their job functions. Within the need-to-know principle, network administrators grant the employee the least amount of privileges to prevent employees from accessing more than what they are supposed to.

## Cryptography

Information security uses cryptography to transform usable information into a form that renders it unusable by anyone other than an authorized user; this process is called **encryption**.

Information that has been encrypted (rendered unusable) can be transformed back into its original usable form by an authorized user who possesses the cryptographic key, through the process of **decryption**.

Cryptography is used in information security to protect information from unauthorized or accidental disclosure while the information is in transit (either electronically or physically) and while information is in storage.

Cryptography provides information security with other useful applications as well, including improved authentication methods, message digests, digital signatures, non-repudiation, and encrypted network communications. Older, less secure applications such as Telnet and File Transfer Protocol (FTP) are slowly being replaced with more secure applications such as Secure Shell (SSH) that use encrypted network communications. Wireless communications can be encrypted using protocols such as WPA/WPA2 or the older (and less secure) WEP. Wired communications (such as ITU‑T G.hn) are secured using AES for encryption and X.1035 for authentication and key exchange. Software applications such as GnuPG or PGP can be used to encrypt data files and email.

## Steganography

[https://ko.wikipedia.org/wiki/스테가노그래피](https://ko.wikipedia.org/wiki/스테가노그래피)

스테가노그래피는 데이터 은폐 기술 중 하나이며, 데이터를 다른 데이터에 삽입하는 기술 혹은 그 연구를 가리킨다. 크립토그래피 (cryptography)가 메시지의 내용을 읽을 수 없게 하는 수단인 반면, 스테가노그라피는 존재 자체를 숨긴다.