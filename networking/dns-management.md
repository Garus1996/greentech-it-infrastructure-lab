# DNS Management

## Purpose

This document describes the DNS configuration performed in the GreenTech IT Infrastructure Lab.

The objective was to demonstrate practical DNS administration by creating custom DNS records and validating name resolution from a domain-joined client.

---

## Environment

| Component | Value |
|---|---|
| Server | GT-DC01 |
| DNS Service | Microsoft DNS |
| Domain | greentech.local |
| Client | GT-CLIENT01 |

---

## Existing DNS Zone

The Active Directory integrated DNS zone:

```
greentech.local
```

was verified and contained the default records required for domain functionality.

---

## DNS Records Created

### A Record

| Record | Value |
|---|---|
| Name | fileserver |
| Address | 192.168.56.10 |

The A record allows clients to resolve the hostname:

```
fileserver.greentech.local
```

to the internal server IP address.

---

### CNAME Record

| Alias | Target |
|---|---|
| intranet | GT-DC01.greentech.local |

The alias provides an additional friendly hostname that resolves to the same server.

---

## Validation

DNS resolution was validated from GT-CLIENT01.

Commands executed:

```powershell
nslookup fileserver.greentech.local
ping fileserver.greentech.local

nslookup intranet.greentech.local
ping intranet.greentech.local
```

Both hostnames successfully resolved to:

```
192.168.56.10
```

---

## Screenshots

```text
screenshots/dns/dns-manager-overview.png
screenshots/dns/dns-zone-records.png
screenshots/dns/dns-a-record-fileserver.png
screenshots/dns/dns-cname-intranet.png
screenshots/client-tests/dns-validation-fileserver.png
screenshots/client-tests/dns-validation-intranet.png
```

---

## Result

DNS administration was successfully demonstrated by creating custom A and CNAME records and validating DNS name resolution from a domain-joined Windows client.

This demonstrates practical Windows Server DNS management in an Active Directory environment.