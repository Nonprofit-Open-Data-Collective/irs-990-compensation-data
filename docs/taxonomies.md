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

_cfo_, _executive director - no longer director_, _president local # 18_, _foundation mana_, _director of park planning & development_, _director_, _scout execut_, _controller_, _dir & president_, _senior vp_, _operations manager_, _manager/ceo_, _chief executive officer_, _director_, _business man_, _executive di_, _executive director_, _executive di_, _executive director as of 10/25/2016 3_, _program director_, _executive di_, _business agent_, _executive director_, _field representative - new_ and _golf course superintendent_


## Clean Titles 

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

<br>



## 26 Custom Categories 

Binary, non-mutually exclusive titles people hold 

|**TITLE**     |**description** |
|:-------------|:-----------|
|CEO           |description |
|CFO           |description |
|TREASURER     |description |
|DEP.CEO       |description |
|SEC           |description |
|COO           |description |
|TRUST         |description |
|HUM.RES       |description |
|DEP.HEAD      |description |
|MAN           |description |
|DEV           |description |
|TECH          |description |
|COMM          |description |
|OTHER         |description |
|PROJECT       |description |
|LEGAL         |description |
|FACILITIES    |description |
|ADMIN.SUP     |description |
|MED.MAN       |description |
|HEALTH.HUM    |description |
|TRAIN         |description |
|ACADEMIC.MAN  |description |
|PROFESIONAL   |description |
|OTHER.PROF    |description |
|ACADEMIC.PROF |description |
|MED.PROF      |description |
|CEO.PROB      |description |
|CFO.PROB      |description | 


<br>

## Refined IRS Categories 

* Management (Mgmt) - hold a leadership position in the organization 
* Highly-paid professionals (HPP) - no official leadership positions, but are reported because of compensation levels 
* Other.Staff 
* Trustee - sit on the board 
* Board.Leadership - hold an officer position on the board  
* C.Level - chief level leadership positions (CEO, CFO, COO) and equivalents  
* Interim - serving only a temporary role in the position 
* Former - are listed as outgoing positions 

<br>



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


