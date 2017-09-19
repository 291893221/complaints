--================== �ͻ����Ա� ==================
-- Create table
create table T_ORI_CUSTOMER 
(
  FIELD0  VARCHAR2(80),
  FIELD1  VARCHAR2(80),
  FIELD2  VARCHAR2(80),
  FIELD3  VARCHAR2(80),
  FIELD4  VARCHAR2(80),
  FIELD5  VARCHAR2(80),
  FIELD6  VARCHAR2(80),
  FIELD7  VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 4M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column T_ORI_CUSTOMER.FIELD0 is 'UUIDΨһ��ʶ';
comment on column T_ORI_CUSTOMER.FIELD1 is '�û�����';
comment on column T_ORI_CUSTOMER.FIELD2 is 'Ʒ��';
comment on column T_ORI_CUSTOMER.FIELD3 is 'Ʒ������';
comment on column T_ORI_CUSTOMER.FIELD4 is '��Ʒ��';
comment on column T_ORI_CUSTOMER.FIELD5 is '��Ʒ������';
comment on column T_ORI_CUSTOMER.FIELD6 is '���������ײ�';
comment on column T_ORI_CUSTOMER.FIELD7 is '���������ײ�����';



--================== ���Ա� ==================
-- Create table
create table TEST_TABLE
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
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TEST_TABLE
  is '��ܲ��Ա�';
-- Add comments to the columns 
comment on column TEST_TABLE.field1
  is '�����ֶ�';
comment on column TEST_TABLE.field2
  is '�����ֶ�';
comment on column TEST_TABLE.field3
  is '�����ֶ�';
comment on column TEST_TABLE.field4
  is '�����ֶ�';
comment on column TEST_TABLE.field5
  is '�����ֶ�';
comment on column TEST_TABLE.field6
  is '�����ֶ�';
comment on column TEST_TABLE.field7
  is '�����ֶ�';
comment on column TEST_TABLE.field8
  is '�����ֶ�';
comment on column TEST_TABLE.field9
  is '�����ֶ�';
comment on column TEST_TABLE.field10
  is '�����ֶ�';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TEST_TABLE
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

  
--================== �ʺű� ==================
-- Create table
create table T_ACCOUNTS
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
    initial 64
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column T_ACCOUNTS.id
  is '����';
comment on column T_ACCOUNTS.account
  is '�ʺ�';
comment on column T_ACCOUNTS.password
  is '����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_ACCOUNTS
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
 
  
  --================== ��Ͷ+V600Ͷ�߹��� ==================
  -- Create table
create table T_ORI_NET_INVESTMENT_V600
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
    initial 16
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column T_ORI_NET_INVESTMENT_V600.field1
  is '����վ��';
comment on column T_ORI_NET_INVESTMENT_V600.field2
  is '���̻�վ�����ϣ�';
comment on column T_ORI_NET_INVESTMENT_V600.field3
  is 'ά����վ�����ϣ�';
comment on column T_ORI_NET_INVESTMENT_V600.field4
  is '����ֱ��վ�����ϣ�';
comment on column T_ORI_NET_INVESTMENT_V600.field5
  is 'ά��ֱ��վ�����ϣ�';
comment on column T_ORI_NET_INVESTMENT_V600.field6
  is '�ڲ�����';
comment on column T_ORI_NET_INVESTMENT_V600.field7
  is '�ⲿ����';
comment on column T_ORI_NET_INVESTMENT_V600.field8
  is '��վ�豸����������';
comment on column T_ORI_NET_INVESTMENT_V600.field9
  is 'ֱ��վ�豸����������';
comment on column T_ORI_NET_INVESTMENT_V600.field10
  is '��������';
comment on column T_ORI_NET_INVESTMENT_V600.field11
  is '����ԭ�򣨻�վ��';
comment on column T_ORI_NET_INVESTMENT_V600.field12
  is '����ԭ��ֱ��վ��';
comment on column T_ORI_NET_INVESTMENT_V600.field13
  is '���ڹ滮';
comment on column T_ORI_NET_INVESTMENT_V600.field14
  is 'ϵͳ����';
comment on column T_ORI_NET_INVESTMENT_V600.field15
  is '����';
comment on column T_ORI_NET_INVESTMENT_V600.field16
  is '���Ĳ����';
comment on column T_ORI_NET_INVESTMENT_V600.field17
  is '����';
comment on column T_ORI_NET_INVESTMENT_V600.field18
  is '��������';
comment on column T_ORI_NET_INVESTMENT_V600.field19
  is 'Ͷ������';
comment on column T_ORI_NET_INVESTMENT_V600.field20
  is 'Ͷ��ԭ��';
comment on column T_ORI_NET_INVESTMENT_V600.field21
  is '���̻����վ��';
comment on column T_ORI_NET_INVESTMENT_V600.field22
  is '�������β���';
comment on column T_ORI_NET_INVESTMENT_V600.field23
  is 'ʵʩ���';
comment on column T_ORI_NET_INVESTMENT_V600.field24
  is '�����ط����';
comment on column T_ORI_NET_INVESTMENT_V600.field25
  is '���ս�����';
comment on column T_ORI_NET_INVESTMENT_V600.field26
  is '���ջظ��ͻ�ʱ��';
comment on column T_ORI_NET_INVESTMENT_V600.field27
  is '������';
comment on column T_ORI_NET_INVESTMENT_V600.field28
  is 'Ͷ�ߺ���';
comment on column T_ORI_NET_INVESTMENT_V600.field29
  is '�ͻ�����';
comment on column T_ORI_NET_INVESTMENT_V600.field30
  is '�ڲ�Ͷ�߾�����';
comment on column T_ORI_NET_INVESTMENT_V600.field31
  is '�ֻ�Ʒ���ͺ�';
comment on column T_ORI_NET_INVESTMENT_V600.field32
  is 'Ͷ������';
comment on column T_ORI_NET_INVESTMENT_V600.field33
  is '�Ƿ�ڵ�����еǼ�';
comment on column T_ORI_NET_INVESTMENT_V600.field34
  is '�Ƿ��ظ�Ͷ��';
comment on column T_ORI_NET_INVESTMENT_V600.field35
  is 'Ͷ������';
comment on column T_ORI_NET_INVESTMENT_V600.field36
  is 'Ͷ��ʱ��';
comment on column T_ORI_NET_INVESTMENT_V600.field37
  is '�ظ�������/��';
comment on column T_ORI_NET_INVESTMENT_V600.field38
  is 'һ���ؼ���';
comment on column T_ORI_NET_INVESTMENT_V600.field39
  is '�����ؼ���';
comment on column T_ORI_NET_INVESTMENT_V600.field40
  is '��ϸ��ַ';
comment on column T_ORI_NET_INVESTMENT_V600.field41
  is '��������';
comment on column T_ORI_NET_INVESTMENT_V600.field42
  is 'Ͷ������С������';
comment on column T_ORI_NET_INVESTMENT_V600.field43
  is '�����������ظ����ݣ�';
comment on column T_ORI_NET_INVESTMENT_V600.field44
  is '������ŵ���ʱ��';
comment on column T_ORI_NET_INVESTMENT_V600.field45
  is '��������';
comment on column T_ORI_NET_INVESTMENT_V600.field46
  is 'ʵ�ʽ��ʱ��';
comment on column T_ORI_NET_INVESTMENT_V600.field47
  is '����';
comment on column T_ORI_NET_INVESTMENT_V600.field48
  is 'γ��';
comment on column T_ORI_NET_INVESTMENT_V600.field49
  is '�Ƿ��Ѿ��ط�';
comment on column T_ORI_NET_INVESTMENT_V600.field50
  is '��������ʱ��';

--================== �ڵ��ID��Ϣ�� ==================
-- Create table
create table T_ORI_BLACK_DOT_LIBRARY_ID
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
    initial 16
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_ORI_BLACK_DOT_LIBRARY_ID
  is '�ڵ��ID��Ϣ��';
-- Add comments to the columns 
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field1
  is '��������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field2
  is 'Ͷ�ߵ�ID';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field3
  is 'Ͷ�ߵ�����';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field4
  is 'Ͷ�ߵ�����';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field5
  is '��ʼʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field6
  is '���״̬';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field7
  is '����ԭ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field8
  is 'Ӱ�췶Χ';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field9
  is '������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field10
  is '��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field11
  is '��ַ';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field12
  is 'Ͷ����';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field13
  is 'Ͷ������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field14
  is '��ϵ�绰';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field15
  is '����';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field16
  is 'γ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field17
  is '����취';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field18
  is '��ϸ�������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field19
  is '��ǰ״̬';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field20
  is 'Ͷ�ߵ�����ID';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field21
  is 'վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field22
  is 'վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field23
  is 'Ԥ�ڽ��ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field24
  is '�ܷ���';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field25
  is '������Դ';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field26
  is '����ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field27
  is '����վ��ID';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field28
  is '�⽨վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field29
  is 'ʵ��վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field30
  is 'վ�㾭��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field31
  is 'վ��γ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field32
  is '�滮���';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field33
  is '���̽���';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field34
  is '�ƻ����ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field35
  is 'ʵ�����ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field36
  is 'վ�㸲�Ƿ�Χ';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field37
  is 'վ��˵��';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field38
  is '���ʱ��';


--================== T_ORI_BLACK_DOT_LIBRARY�� ==================
-- Create table
create table T_ORI_BLACK_DOT_LIBRARY
(
  field0  VARCHAR2(80),
  field1  VARCHAR2(80),
  field2  VARCHAR2(80),
  field3  VARCHAR2(1000),
  field4  VARCHAR2(80),
  field5  VARCHAR2(80),
  field6  VARCHAR2(80),
  field7  VARCHAR2(80),
  field8  VARCHAR2(1000),
  field9  VARCHAR2(80),
  field10 VARCHAR2(80),
  field11 VARCHAR2(1000),
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
  field37 VARCHAR2(1000),
  field38 VARCHAR2(80)
)
tablespace COMPLAINTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_ORI_BLACK_DOT_LIBRARY
  is '�ڵ��ID��Ϣ��';
-- Add comments to the columns 
comment on column T_ORI_BLACK_DOT_LIBRARY.FIELD0
  is 'UUIDΨһ��ʶ';
comment on column T_ORI_BLACK_DOT_LIBRARY.field1
  is '��������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field2
  is 'Ͷ�ߵ�ID';
comment on column T_ORI_BLACK_DOT_LIBRARY.field3
  is 'Ͷ�ߵ�����';
comment on column T_ORI_BLACK_DOT_LIBRARY.field4
  is 'Ͷ�ߵ�����';
comment on column T_ORI_BLACK_DOT_LIBRARY.field5
  is '��ʼʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field6
  is '���״̬';
comment on column T_ORI_BLACK_DOT_LIBRARY.field7
  is '����ԭ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field8
  is 'Ӱ�췶Χ';
comment on column T_ORI_BLACK_DOT_LIBRARY.field9
  is '������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field10
  is '��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field11
  is '��ַ';
comment on column T_ORI_BLACK_DOT_LIBRARY.field12
  is 'Ͷ����';
comment on column T_ORI_BLACK_DOT_LIBRARY.field13
  is 'Ͷ������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field14
  is '��ϵ�绰';
comment on column T_ORI_BLACK_DOT_LIBRARY.field15
  is '����';
comment on column T_ORI_BLACK_DOT_LIBRARY.field16
  is 'γ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field17
  is '����취';
comment on column T_ORI_BLACK_DOT_LIBRARY.field18
  is '��ϸ�������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field19
  is '��ǰ״̬';
comment on column T_ORI_BLACK_DOT_LIBRARY.field20
  is 'Ͷ�ߵ�����ID';
comment on column T_ORI_BLACK_DOT_LIBRARY.field21
  is 'վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field22
  is 'վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field23
  is 'Ԥ�ڽ��ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field24
  is '�ܷ���';
comment on column T_ORI_BLACK_DOT_LIBRARY.field25
  is '������Դ';
comment on column T_ORI_BLACK_DOT_LIBRARY.field26
  is '����ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field27
  is '����վ��ID';
comment on column T_ORI_BLACK_DOT_LIBRARY.field28
  is '�⽨վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field29
  is 'ʵ��վ������';
comment on column T_ORI_BLACK_DOT_LIBRARY.field30
  is 'վ�㾭��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field31
  is 'վ��γ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field32
  is '�滮���';
comment on column T_ORI_BLACK_DOT_LIBRARY.field33
  is '���̽���';
comment on column T_ORI_BLACK_DOT_LIBRARY.field34
  is '�ƻ����ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field35
  is 'ʵ�����ʱ��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field36
  is 'վ�㸲�Ƿ�Χ';
comment on column T_ORI_BLACK_DOT_LIBRARY.field37
  is 'վ��˵��';
comment on column T_ORI_BLACK_DOT_LIBRARY.field38
  is '���ʱ��';
