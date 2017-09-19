----------------------------------------------------------
-- Export file for user COMPLAINTS                      --
-- Created by Administrator on 2015-12-23 ������, 17:12:21 --
----------------------------------------------------------

set define off
spool complaints.log

prompt
prompt Creating table TEST_TABLE
prompt =========================
prompt
create table COMPLAINTS.TEST_TABLE
(
  field1  VARCHAR2(32) not null,
  field2  VARCHAR2(8),
  field3  VARCHAR2(8),
  field4  VARCHAR2(8),
  field5  VARCHAR2(8),
  field6  VARCHAR2(8),
  field7  VARCHAR2(8),
  field8  VARCHAR2(8),
  field9  VARCHAR2(8),
  field10 VARCHAR2(8)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on table COMPLAINTS.TEST_TABLE
  is '��ܲ��Ա�';
comment on column COMPLAINTS.TEST_TABLE.field1
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field2
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field3
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field4
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field5
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field6
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field7
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field8
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field9
  is '�����ֶ�';
comment on column COMPLAINTS.TEST_TABLE.field10
  is '�����ֶ�';
alter table COMPLAINTS.TEST_TABLE
  add constraint FIELD1_PRIMARY primary key (FIELD1)
  using index 
  tablespace COMPLAINTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_ACCOUNTS
prompt =========================
prompt
create table COMPLAINTS.T_ACCOUNTS
(
  id       VARCHAR2(32) not null,
  account  VARCHAR2(32),
  password VARCHAR2(32)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
comment on column COMPLAINTS.T_ACCOUNTS.id
  is '����';
comment on column COMPLAINTS.T_ACCOUNTS.account
  is '�ʺ�';
comment on column COMPLAINTS.T_ACCOUNTS.password
  is '����';
alter table COMPLAINTS.T_ACCOUNTS
  add constraint T_ACCOUNTS_PRIMARY primary key (ID)
  using index 
  tablespace COMPLAINTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_ORI_234G_CELL
prompt ==============================
prompt
create table COMPLAINTS.T_ORI_234G_CELL
(
  field1  VARCHAR2(80),
  field2  VARCHAR2(80),
  field3  VARCHAR2(80),
  field4  VARCHAR2(80),
  field5  VARCHAR2(80),
  field6  VARCHAR2(80),
  field7  VARCHAR2(80),
  field8  VARCHAR2(80),
  field9  VARCHAR2(80),
  field10 VARCHAR2(80),
  field11 VARCHAR2(80),
  field12 VARCHAR2(80),
  field13 VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table COMPLAINTS.T_ORI_234G_CELL
  is '234GС��������Ϣ��';
comment on column COMPLAINTS.T_ORI_234G_CELL.field1
  is '������ʽ';
comment on column COMPLAINTS.T_ORI_234G_CELL.field2
  is '����';
comment on column COMPLAINTS.T_ORI_234G_CELL.field3
  is '����';
comment on column COMPLAINTS.T_ORI_234G_CELL.field4
  is '����';
comment on column COMPLAINTS.T_ORI_234G_CELL.field5
  is '��վ��';
comment on column COMPLAINTS.T_ORI_234G_CELL.field6
  is 'С����';
comment on column COMPLAINTS.T_ORI_234G_CELL.field7
  is 'CI';
comment on column COMPLAINTS.T_ORI_234G_CELL.field8
  is 'BSC/RNC';
comment on column COMPLAINTS.T_ORI_234G_CELL.field9
  is '����';
comment on column COMPLAINTS.T_ORI_234G_CELL.field10
  is 'γ��';
comment on column COMPLAINTS.T_ORI_234G_CELL.field11
  is '�����';
comment on column COMPLAINTS.T_ORI_234G_CELL.field12
  is '���ǳ���';
comment on column COMPLAINTS.T_ORI_234G_CELL.field13
  is '�Ƿ�VIPС��';

prompt
prompt Creating table T_ORI_234G_TRAFFIC
prompt =================================
prompt
create table COMPLAINTS.T_ORI_234G_TRAFFIC
(
  field1 VARCHAR2(80),
  field2 VARCHAR2(80),
  field3 VARCHAR2(80),
  field4 VARCHAR2(80),
  field5 VARCHAR2(80),
  field6 VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table COMPLAINTS.T_ORI_234G_TRAFFIC
  is '234G����������ͳ�Ʊ�';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field1
  is 'С��������';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field2
  is 'BSC';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field3
  is '��������';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field4
  is '������ʽ';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field5
  is '���վ�������(������ƽ��)';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field6
  is '���վ�������(������ƽ��)';

prompt
prompt Creating table T_ORI_BLACK_DOT_LIBRARY_ID
prompt =========================================
prompt
create table COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID
(
  field1  VARCHAR2(80),
  field2  VARCHAR2(80),
  field3  VARCHAR2(80),
  field4  VARCHAR2(80),
  field5  VARCHAR2(80),
  field6  VARCHAR2(80),
  field7  VARCHAR2(80),
  field8  VARCHAR2(1000),
  field9  VARCHAR2(80),
  field10 VARCHAR2(80),
  field11 VARCHAR2(80),
  field12 VARCHAR2(80),
  field13 VARCHAR2(80),
  field14 VARCHAR2(80),
  field15 VARCHAR2(80),
  field16 VARCHAR2(80),
  field17 VARCHAR2(80),
  field18 VARCHAR2(1000),
  field19 VARCHAR2(80),
  field20 VARCHAR2(80),
  field21 VARCHAR2(80),
  field22 VARCHAR2(80),
  field23 VARCHAR2(80),
  field24 VARCHAR2(80),
  field25 VARCHAR2(80),
  field26 VARCHAR2(80),
  field27 VARCHAR2(80),
  field28 VARCHAR2(80),
  field29 VARCHAR2(80),
  field30 VARCHAR2(80),
  field31 VARCHAR2(80),
  field32 VARCHAR2(80),
  field33 VARCHAR2(80),
  field34 VARCHAR2(80),
  field35 VARCHAR2(80),
  field36 VARCHAR2(80),
  field37 VARCHAR2(80),
  field38 VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID
  is '�ڵ��ID��Ϣ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field1
  is '��������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field2
  is 'Ͷ�ߵ�ID';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field3
  is 'Ͷ�ߵ�����';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field4
  is 'Ͷ�ߵ�����';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field5
  is '��ʼʱ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field6
  is '���״̬';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field7
  is '����ԭ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field8
  is 'Ӱ�췶Χ';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field9
  is '������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field10
  is '��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field11
  is '��ַ';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field12
  is 'Ͷ����';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field13
  is 'Ͷ������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field14
  is '��ϵ�绰';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field15
  is '����';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field16
  is 'γ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field17
  is '����취';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field18
  is '��ϸ�������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field19
  is '��ǰ״̬';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field20
  is 'Ͷ�ߵ�����ID';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field21
  is 'վ������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field22
  is 'վ������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field23
  is 'Ԥ�ڽ��ʱ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field24
  is '�ܷ���';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field25
  is '������Դ';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field26
  is '����ʱ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field27
  is '����վ��ID';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field28
  is '�⽨վ������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field29
  is 'ʵ��վ������';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field30
  is 'վ�㾭��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field31
  is 'վ��γ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field32
  is '�滮���';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field33
  is '���̽���';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field34
  is '�ƻ����ʱ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field35
  is 'ʵ�����ʱ��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field36
  is 'վ�㸲�Ƿ�Χ';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field37
  is 'վ��˵��';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field38
  is '���ʱ��';

prompt
prompt Creating table T_ORI_NET_INVESTMENT_V600
prompt ========================================
prompt
create table COMPLAINTS.T_ORI_NET_INVESTMENT_V600
(
  field1  VARCHAR2(80),
  field2  VARCHAR2(80),
  field3  VARCHAR2(80),
  field4  VARCHAR2(80),
  field5  VARCHAR2(80),
  field6  VARCHAR2(80),
  field7  VARCHAR2(80),
  field8  VARCHAR2(80),
  field9  VARCHAR2(80),
  field10 VARCHAR2(80),
  field11 VARCHAR2(80),
  field12 VARCHAR2(80),
  field13 VARCHAR2(80),
  field14 VARCHAR2(80),
  field15 VARCHAR2(80),
  field16 VARCHAR2(80),
  field17 VARCHAR2(80),
  field18 VARCHAR2(80),
  field19 VARCHAR2(80),
  field20 VARCHAR2(80),
  field21 VARCHAR2(80),
  field22 VARCHAR2(80),
  field23 VARCHAR2(80),
  field24 VARCHAR2(80),
  field25 VARCHAR2(80),
  field26 VARCHAR2(80),
  field27 VARCHAR2(80),
  field28 VARCHAR2(80),
  field29 VARCHAR2(80),
  field30 VARCHAR2(80),
  field31 VARCHAR2(80),
  field32 VARCHAR2(1000),
  field33 VARCHAR2(80),
  field34 VARCHAR2(80),
  field35 VARCHAR2(80),
  field36 VARCHAR2(80),
  field37 VARCHAR2(80),
  field38 VARCHAR2(80),
  field39 VARCHAR2(80),
  field40 VARCHAR2(80),
  field41 VARCHAR2(80),
  field42 VARCHAR2(80),
  field43 VARCHAR2(1000),
  field44 VARCHAR2(80),
  field45 VARCHAR2(80),
  field46 VARCHAR2(80),
  field47 VARCHAR2(80),
  field48 VARCHAR2(80),
  field49 VARCHAR2(80),
  field50 VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table COMPLAINTS.T_ORI_NET_INVESTMENT_V600
  is 'V600�г�Ͷ����Ͷ�߹���';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field1
  is '    ����վ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field2
  is '    ���̻�վ�����ϣ�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field3
  is '    ά����վ�����ϣ�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field4
  is '    ����ֱ��վ�����ϣ�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field5
  is '    ά��ֱ��վ�����ϣ�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field6
  is '    �ڲ�����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field7
  is '    �ⲿ����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field8
  is '    ��վ�豸����������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field9
  is '    ֱ��վ�豸����������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field10
  is '    ��������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field11
  is '    ����ԭ�򣨻�վ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field12
  is '    ����ԭ��ֱ��վ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field13
  is '    ���ڹ滮    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field14
  is '    ϵͳ����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field15
  is '    ����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field16
  is '    ���Ĳ����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field17
  is '    ����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field18
  is '    ��������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field19
  is '    Ͷ������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field20
  is '    Ͷ��ԭ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field21
  is '    ���̻����վ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field22
  is '    �������β���    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field23
  is '    ʵʩ���    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field24
  is '    �����ط����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field25
  is '    ���ս�����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field26
  is '    ���ջظ��ͻ�ʱ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field27
  is '    ������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field28
  is '    Ͷ�ߺ���    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field29
  is '    �ͻ�����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field30
  is '    �ڲ�Ͷ�߾�����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field31
  is '    �ֻ�Ʒ���ͺ�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field32
  is '    Ͷ������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field33
  is '    �Ƿ�ڵ�����еǼ�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field34
  is '    �Ƿ��ظ�Ͷ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field35
  is '    Ͷ������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field36
  is '    Ͷ��ʱ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field37
  is '    �ظ�������/��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field38
  is '    һ���ؼ���    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field39
  is '    �����ؼ���    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field40
  is '    ��ϸ��ַ    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field41
  is '    ��������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field42
  is '    Ͷ������С������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field43
  is '    �����������ظ����ݣ�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field44
  is '    ������ŵ���ʱ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field45
  is '    ��������    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field46
  is '    ʵ�ʽ��ʱ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field47
  is '    ����    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field48
  is '    γ��    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field49
  is '    �Ƿ��Ѿ��ط�    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field50
  is '    ��������ʱ��    ';

prompt
prompt Creating table T_ORI_NPS_CUSTOMER
prompt =================================
prompt
create table COMPLAINTS.T_ORI_NPS_CUSTOMER
(
  field1  VARCHAR2(80),
  field2  VARCHAR2(80),
  field3  VARCHAR2(80),
  field4  VARCHAR2(80),
  field5  VARCHAR2(80),
  field6  VARCHAR2(80),
  field7  VARCHAR2(80),
  field8  VARCHAR2(1000),
  field9  VARCHAR2(80),
  field10 VARCHAR2(1000),
  field11 VARCHAR2(80),
  field12 VARCHAR2(80),
  field13 VARCHAR2(80),
  field14 VARCHAR2(80),
  field15 VARCHAR2(80),
  field16 VARCHAR2(80),
  field17 VARCHAR2(80),
  field18 VARCHAR2(80),
  field19 VARCHAR2(80),
  field20 VARCHAR2(80),
  field21 VARCHAR2(80),
  field22 VARCHAR2(80),
  field23 VARCHAR2(80),
  field24 VARCHAR2(80),
  field25 VARCHAR2(80),
  field26 VARCHAR2(80),
  field27 VARCHAR2(80),
  field28 VARCHAR2(80),
  field29 VARCHAR2(80),
  field30 VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on table COMPLAINTS.T_ORI_NPS_CUSTOMER
  is 'NPS�ͻ�����ȵ����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field1
  is '�ֻ�����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field2
  is '�û�Ͷ������';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field3
  is '�г��ṩ������';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field4
  is '�Ƿ��Ӧ';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field5
  is '�Ƽ���Ը����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field6
  is '�ط�����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field7
  is '�Ǽ�ʱ��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field8
  is '���Ƽ�ԭ��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field9
  is '����ԭ�����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field10
  is '�ط��û����ԭ��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field11
  is '�ط��û����ԭ�����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field12
  is '�Ƿ��ѻָ�';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field13
  is '�����������';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field14
  is '�Ƿ����й滮';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field15
  is '�ź������ַ';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field16
  is '����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field17
  is 'ά��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field18
  is '��ע';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field19
  is '�Ƿ��ֳ�����';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field20
  is '�������';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field21
  is '�Ƿ����ŵ���';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field22
  is '�滮վ��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field23
  is '����(KM)';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field24
  is '��������';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field25
  is '����վ��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field26
  is '����(KM)';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field27
  is 'δ�滮ԭ��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field28
  is '�Ƿ������ڵ�';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field29
  is '���ŵ����Ż�Ԥ�����ʱ��';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field30
  is '�ͻ�����';

prompt
prompt Creating table T_ORI_V600_MARKET
prompt ================================
prompt
create table COMPLAINTS.T_ORI_V600_MARKET
(
  field1  VARCHAR2(80),
  field2  VARCHAR2(80),
  field3  VARCHAR2(80),
  field4  VARCHAR2(80),
  field5  VARCHAR2(80),
  field6  VARCHAR2(1000),
  field7  VARCHAR2(80),
  field8  VARCHAR2(80),
  field9  VARCHAR2(80),
  field10 VARCHAR2(80),
  field11 VARCHAR2(80),
  field12 VARCHAR2(80),
  field13 VARCHAR2(80),
  field14 VARCHAR2(80),
  field15 VARCHAR2(80),
  field16 VARCHAR2(80),
  field17 VARCHAR2(80),
  field18 VARCHAR2(80),
  field19 VARCHAR2(80),
  field20 VARCHAR2(80),
  field21 VARCHAR2(80),
  field22 VARCHAR2(80),
  field23 VARCHAR2(80),
  field24 VARCHAR2(80),
  field25 VARCHAR2(80),
  field26 VARCHAR2(80),
  field27 VARCHAR2(80),
  field28 VARCHAR2(80),
  field29 VARCHAR2(80),
  field30 VARCHAR2(80),
  field31 VARCHAR2(80),
  field32 VARCHAR2(80),
  field33 VARCHAR2(80),
  field34 VARCHAR2(80),
  field35 VARCHAR2(80),
  field36 VARCHAR2(80),
  field37 VARCHAR2(80),
  field38 VARCHAR2(80),
  field39 VARCHAR2(80),
  field40 VARCHAR2(80),
  field41 VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
comment on column COMPLAINTS.T_ORI_V600_MARKET.field1
  is 'Ͷ������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field2
  is '��ˮ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field3
  is '�������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field4
  is '�����������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field5
  is '�������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field6
  is '����ϸ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field7
  is 'Ͷ������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field8
  is '�ͻ��ظ�����';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field9
  is '�Ƿ��·��������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field10
  is '����ʱ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field11
  is '�ͻ�������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field12
  is '�ͻ�Ʒ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field13
  is '�ͻ�����';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field14
  is '������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field15
  is '������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field16
  is 'ҵ�����';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field17
  is 'Ͷ��;��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field18
  is '����ʽ';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field19
  is '�����̶�';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field20
  is '�������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field21
  is '���ö��Ǽ���';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field22
  is '����Ԥ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field23
  is '�ͻ�����';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field24
  is '����';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field25
  is 'Ӫ����������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field26
  is '������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field27
  is '¼����ˮ';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field28
  is '¼��ʱ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field29
  is '����ʱ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field30
  is '�Ƿ����пͻ�';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field31
  is '���к���';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field32
  is '��ϵ������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field33
  is '��ϵ�绰';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field34
  is '��ϵ��ʽ';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field35
  is '��ϵ��ַ';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field36
  is '���β���';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field37
  is '����ԭ��';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field38
  is '�ɵ���������';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field39
  is '���۱�ע';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field40
  is '�ն�Ʒ���ͺ�';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field41
  is '������������';


spool off
