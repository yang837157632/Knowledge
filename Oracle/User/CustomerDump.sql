--Dump database
--Connect to the Oracle DB Server and then connect to sqlplus / as sysdba and run the following commands:
CREATE USER CMSWIN28_DEMO_SH4 IDENTIFIED BY Admin_1234 default tablespace <TABLESPACE> ACCOUNT UNLOCK;
ALTER USER CMSWIN28_DEMO_SH4 QUOTA UNLIMITED ON <TABLESPACE>;
grant connect, create session, imp_full_database to CMSWIN28_DEMO_SH4;
 
--From the oracle account run the following command:
impdp username/password directory=<DUMP_DIR> dumpfile= <DUMP_FILE> remap_tablespace= <OLD_TABLESPACE>:<NEW_TABLESPACE> remap_schema=<NEW_SCHEMA>:<OLD_SCHEMA> logfile=<DUMP_LOG>
impdp system/mercurypw directory=ENIDUMP dumpfile=CMDB.dmp remap_tablespace=CMDB:CUSTOMER_DUMP remap_schema=CMDB:CMDB_DUMP logfile=CMDB_DUMP.log create directory ENIDUMP as '/opt/oracle/app/oracle/admin/cmsdb01/dpdump';
impdp system/mercurypw dumpfile=ENI1031.DMP remap_tablespace=ENI_TEMP:CUSTOMER_DUMP remap_schema=ENI_FIXED:CMDB_DUMP logfile=CMDB_DUMP.log PARALLEL=10 ;
 

--Connect to the Oracle DB Server and then connect to sqlplus / as sysdba and run the following commands:
create directory ORA_DMP as '/opt/oracle/app/oracle/admin/cmsdb01/dpdump/CMDB10P_DATAPUMP_20180130';  
grant all  on directory ORA_DMP to public;

--From the oracle account run the following command:
impdp USERID='CMSPCOE02_112_96_E2E/Admin_1234' schemas=CMSPCOE02_112_96_E2E directory=ora_dmp PARALLEL=8 dumpfile=CMSPCOE02_112_96_E2E_20180820_2319.dmp.%U logfile=CMSPCOE02_112_96_E2E_exp.log table_exists_action=replace TRANSFORM=DISABLE_ARCHIVE_LOGGING:Y
expdp USERID='CMSPCOE02_112_96_E2E/Admin_1234' schemas=CMSPCOE02_112_96_E2E directory=ORA_DMP PARALLEL=8 dumpfile=CMSPCOE02_112_96_E2E_`date +%Y%m%d_%k%M`.dmp.%U    logfile=CMSPCOE02_112_96_E2E_exp.log.`date +%Y%m%d_%k%M`


--https://oracle-base.com/articles/10g/oracle-data-pump-10g
expdp scott/tiger@db10g schemas=SCOTT directory=TEST_DIR parallel=4 dumpfile=SCOTT_%U.dmp logfile=expdpSCOTT.log
impdp scott/tiger@db10g schemas=SCOTT directory=TEST_DIR parallel=4 dumpfile=SCOTT_%U.dmp logfile=impdpSCOTT.log
