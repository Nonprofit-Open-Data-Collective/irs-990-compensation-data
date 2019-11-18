---
layout: home
title: Name and Title Ontology
---


# Names

The original dataset contains a raw text field for names with no restrictions on what can be entered. As a result, it is rather chaotic, difficult to distinguish first and last names, and can contain additional text:

 _Kimberly Opsahl_, _CARLETTA HAUCK_, _LORIN SARBACHER_, _CRAIG ATKINSON_, _ALAN ZILBERT_, _JILL BECKWITH_, _MELINDA MARRIOTT_, _MARTHA BURNES_, _JAMES MOCK_, _DR EMOGENE KAISER_, _D EDWARD COLE_,  _EWA_, _ROBERT BEAUDRY - PAST_,  _MARY JO DUNCAN_, _THIEN CHAU NGUYEN_, _LLOYD JAMES SR_ and _ELIZABETH SQUILLACE_

## Standardization

Names are parsed into the following fields:

* First name 
* Middle name 
* Last name 
* Salutations and titles (MS, DR, PHD) 
* Suffixes (JR, II, III) 

Gender is added by coding the first name against the Social Security Administration's name database. 


# Titles

## Raw Text



## New Taxonomies

### Clean Titles 

Routines have been applied to clean up the raw text, standardize use of common titles, and fix spelling. 

|**Raw Text**                       |**Cleaned Text**                   |
|:----------------------------------|:----------------------------------|
|EXECUTIVE DI                       |EXECUTIVE DIRECTOR                 |
|EXEC DIREC                         |EXECUTIVE DIRECTOR                 |
|PRESIDENT                          |PRESIDENT                          |
|TREASURER                          |TREASURER                          |
|SECRETARY                          |SECRETARY                          |
|Director                           |DIRECTOR                           |
|SECRETARY-TREASURER/BUSINESS AGENT |SECRETARY TREASURER BUSINESS AGENT |
|PRESIDENT/BUSINESS AGENT           |PRESIDENT BUSINESS AGENT           |
|VICE PRESIDENT/BUSINESS AGENT      |VICE PRESIDENT BUSINESS AGENT      |
|RECORDING SECRETARY/BUSINESS AGENT |RECORDING SECRETARY BUSINESS AGENT |
|PRESIDENT                          |PRESIDENT                          |
|VICE PRESIDENT                     |VICE PRESIDENT                     |
|SECRETARY-TREASURER                |SECRETARY TREASURER                |
|RECORDING SECRETARY                |RECORDING SECRETARY                |
|TRUSTEE/ORGANIZER                  |TRUSTEE ORGANIZER                  |
|BUSINESS MGR                       |BUSINESS MANAGER                   |
|SECRETARY/TREAS                    |SECRETARY TREASURER                |
|Executive Dir.                     |EXECUTIVE DIRECTOR                 |
|EXECUTIVE VICE PRESIDENT           |EXECUTIVE VICE PRESIDENT           |
|BUS MANAGER                        |BUSINESS MANAGER                   |
|VICE PRESIDENT (RETIRED 2016)      |VICE PRESIDENT RETIRED             |
|SEC-TREAS                          |SECRETARY TREASURER                |
|VICE PRESIDENT                     |VICE PRESIDENT                     |
|PRESIDENT                          |PRESIDENT                          |
|GENERAL MANAGER                    |GENERAL MANAGER                    |

### 26 Custom Categories 

Binary, non-mutually exclusive titles people hold 

_CEO_, _CFO_, _TREASURER_, _DEP.CEO_, _SEC_, _COO_, _TRUST_, _HUM.RES_, _DEP.HEAD_, _MAN_, _DEV_, _TECH_, _COMM_, _OTHER_, _PROJECT_, _LEGAL_, _FACILITIES_, _ADMIN.SUP_, _MED.MAN_, _HEALTH.HUM_, _TRAIN_, _ACADEMIC.MAN_, _PROFESIONAL_, _OTHER.PROF_, _ACADEMIC.PROF_, _MED.PROF_



### Refined IRS Categories 

* Management (Mgmt) - hold a leadership position in the organization 
* Highly-paid professionals (HPP) - no official leadership positions, but are reported because of compensation levels 
* Other.Staff 
* Trustee - sit on the board 
* Board.Leadership - hold an officer position on the board  
* C.Level - chief level leadership positions (CEO, CFO, COO) and equivalents  
* Interim - serving only a temporary role in the position 
* Former - are listed as outgoing positions 


## Roles and Responsibilities 

Example Verticle Hierarchy (Roles)
* Executive Management 
* Vice presidents / deputy directors 
* Management 
* Programs 

Example Horizontal Domains (Responsibilities)
* Marketing 
* Accounting 
* Legal 
* Programs 




<br><br>


