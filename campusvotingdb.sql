drop table if exists stats;
create table stats(
    statId int primary key auto_increment not null,
    title varchar(100) collate utf8_general_ci not null,
    details varchar(1000) collate utf8_general_ci not null
) engine = innodb default charset = utf8;

drop table if exists users;
create table users(
    userId int primary key auto_increment not null,
    userName varchar(100) collate utf8_general_ci not null,
    password varchar(100) collate utf8_general_ci not null,
    lastName varchar(100) collate utf8_general_ci not null,
    fistName varchar(100) collate utf8_general_ci not null,
    middleName varchar(100) collate utf8_general_ci not null,
    userLevelId int default 0 null,
    statId int null
) engine = innodb default charset = utf8;

drop table if exists grades;
create table grades(
    gradeId int primary key auto_increment not null,
    title varchar(100) collate utf8_general_ci not null,
    details varchar(1000) collate utf8_general_ci null,
    statId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists sections;
create table sections(
    sectionId int primary key auto_increment not null,
    title varchar(100) collate utf8_general_ci not null,
    details varchar(1000) collate utf8_general_ci null,
    statId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists gradeandsections;
create table gradeandsections(
    gradeAndSectionId int primary key auto_increment not null,
    title varchar(100) collate utf8_general_ci not null,
    gradeId int not null,
    sectionId int not null,
    statId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists campaignGroups;
create table campaignGroups(
    campaignGroupId int primary key auto_increment not null,
    title varchar(100) collate utf8_general_ci not null,
    details varchar(1000) collate utf8_general_ci null,
    statId int null,
    schoolYearId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists positions;
create table positions(
    positionId int primary key auto_increment not null,
    title varchar(100) collate utf8_general_ci not null,
    details varchar(1000) collate utf8_general_ci null,
    positionType varchar(1000) collate utf8_general_ci null,
    statId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists schoolYears;
create table schoolYears(
    schoolYearId int primary key auto_increment not null,
    title varchar(100) collate utf8_general_ci not null,
    details varchar(1000) collate utf8_general_ci null,
    active boolean null,
    statId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists candidateClearances;
create table candidateClearances(
    candidateClearanceId int primary key auto_increment not null,
    positionId int,
    gradeId int
) engine = innodb default charset = utf8;

drop table if exists voterClearances;
create table voterClearances(
    voterClearanceId int primary key auto_increment not null,
    positionId int,
    gradeId int
) engine = innodb default charset = utf8;

drop table if exists students;
create table students(
    studentId int primary key auto_increment not null,
    lrn varchar(100) collate utf8_general_ci not null,
    password varchar(100) collate utf8_general_ci not null,
    lastName varchar(100) collate utf8_general_ci not null,
    fistName varchar(100) collate utf8_general_ci not null,
    middleName varchar(100) collate utf8_general_ci not null,
    gradeAndSectionId int null,
    currentSectionName varchar(100) collate utf8_general_ci not null,
    statId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists candidates;
create table candidates(
    candidateId int primary key auto_increment not null,
    pictureId int null,
    studentId int not null,
    schoolYearId int null,
    positionId int null,
    campaignGroupId int null,
    propaganda varchar(100) collate utf8_general_ci not null,
    statId int null,
    createdById int not null,
    createdOn datetime not null,
    modifiedById int null,
    modifiedOn datetime null
) engine = innodb default charset = utf8;

drop table if exists pictures;
create table pictures(
    pictureId int primary key auto_increment not null,
    pict blob null,
    statId int null
) engine = innodb default charset = utf8;

drop table if exists votingSessions;
create table votingSessions(
    votingSessionId int primary key auto_increment not null,
    schoolYearId int not null,
    Active int null,
    statId int null    
) engine = innodb default charset = utf8;

drop table if exists castedVotes;
create table castedVotes(
    castedVoteId int primary key auto_increment not null,
    votingSessionId int not null,
    studentId int not null,
    candidateId int not null,
    statId int null    
) engine = innodb default charset = utf8;

drop table if exists winners;
create table winners(
    winnerId int primary key auto_increment not null,
    votingSessionId int not null,
    schoolYearId int not null,
    candidateId int not null,
    totalVotes int not null
) engine = innodb default charset = utf8;

