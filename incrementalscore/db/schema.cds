namespace sap.capire.incrementalscore;

// We reuse Products, which are Books in our domain
using { cuid, managed } from '@sap/cds/common';

entity IncrementScores : cuid, managed {
  key ID : Integer;
  Name   : String(111);
  subjectOrigin  : String(111);
  subjectType  : String(111);
  subjectKey  : String(111);
//  outputType  : String(10);
  isActive : Boolean;
  rules  : Composition of many Rules on rules.score = $self;
  persistence  : Composition of One Persistences on persistence.score = $self;
}

entity Rules : cuid, managed {
  score: Association to IncrementScores;
  eventID : String(30) not null;
  scoreChangedBy  : Integer;
}

entity Persistences: cuid, managed {
   score: Association to IncrementScores;
   PersistenceFrequency: Integer enum { Daily=1; Weekly=2; Monthly=3; } not null;
   ExecutionStartDate: Integer;
   ExecutionStartWeekday: Integer enum { Sunday=0; Monday=1; Tuesday=2; Wednesday=3; Thursday=4; Friday=5; Saturday=6; None=99; };
   ExecutionStartHour: Integer not null;
   // enum { h00=0;h01=1;h02=2;h03=3;h04=4;h05=5;h06=6;h07=7;h08=8;h09=9;h10=10;h11=11;
   //                                   h12=12;h13=13;h14=14;h15=15;h16=16;h17=17;h18=18;h19=19;h20=20;h21=21;h22=22;h23=23 };
   NumKeptVersions: Integer not null;
}

