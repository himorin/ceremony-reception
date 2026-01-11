/*
CREATE DATABASE ceremony_reception;
*/

CREATE TABLE eventid (
  id               int UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT     ,
  eventuuid        text         NOT NULL UNIQUE                    ,
  eventname        text         NOT NULL                           ,
  memo             text             NULL                           ,
  descript         text             NULL                           ,
  regst            DATETIME         NULL                           ,
  reged            DATETIME         NULL                           ,
  eventid          text             NULL                           ,
  adminkey         text         NOT NULL                           
) DEFAULT CHARSET=utf8;

CREATE TABLE eventinput (
  id               int UNSIGNED NOT NULL UNIQUE                    ,
  order            int UNSIGNED NOT NULL                           ,
  fieldid          int UNSIGNED NOT NULL                           ,
  isshow           boolean      NOT NULL DEFAULT FALSE             
) DEFAULT CHARSET=utf8;

CREATE TABLE fieldinfo (
  id               int UNSIGNED NOT NULL                           ,
  lang             text         NOT NULL                           ,
  label            text         NOT NULL                           ,
  descript         text         NOT NULL                           
) DEFAULT CHARSET=utf8;

CREATE TABLE reginfo (
  id               text         NOT NULL UNIQUE                    ,
  qrid             text         NOT NULL                           ,
  eventid          int UNSIGNED NOT NULL                           ,
  regdate          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  email            text             NULL                           ,
  checkindate      DATETIME         NULL                           
) DEFAULT CHARSET=utf8;

CREATE TABLE regdata (
  id               text         NOT NULL                           ,
  fieldid          int UNSIGNED NOT NULL                           ,
  val              text         NOT NULL                           ,
  inputlang        text         NOT NULL                           
) DEFAULT CHARSET=utf8;

CREATE TABLE reglabel (
  regid            text         NOT NULL                           ,
  labelid          int UNSIGNED NOT NULL                           
) DEFAULT CHARSET=utf8;

CREATE TABLE labels (
  id               int UNSIGNED NOT NULL UNIQUE                    ,
  eventid          int UNSIGNED NOT NULL                           ,
  labelname        text         NOT NULL                           ,
  labeldesc        text         NOT NULL                           ,
  labelcolor       text         NOT NULL DEFAULT '#FFFFFF'        
) DEFAULT CHARSET=utf8;

CREATE TABLE adminaccess (
  id               text         NOT NULL UNIQUE                    ,
  eventid          int UNSIGNED NOT NULL                           ,
  createdate       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  lastaccess       DATETIME     NOT NULL                           ,
  uatext           text         NOT NULL                           
) DEFAULT CHARSET=utf8;

CREATE TABLE adminlog (
  id               text         NOT NULL                           ,
  eventid          int UNSIGNED NOT NULL                           ,
  ipaddr           text         NOT NULL                           ,
  changedate       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  category         text         NOT NULL                           ,
  targetid         text         NOT NULL                           ,
  fieldbefore      text         NOT NULL                           ,
  fieldafter       text         NOT NULL                           
) DEFAULT CHARSET=utf8;

