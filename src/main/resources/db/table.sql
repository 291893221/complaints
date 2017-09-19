--================== 客户属性表 ==================
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
comment on column T_ORI_CUSTOMER.FIELD0 is 'UUID唯一标识';
comment on column T_ORI_CUSTOMER.FIELD1 is '用户号码';
comment on column T_ORI_CUSTOMER.FIELD2 is '品牌';
comment on column T_ORI_CUSTOMER.FIELD3 is '品牌名称';
comment on column T_ORI_CUSTOMER.FIELD4 is '子品牌';
comment on column T_ORI_CUSTOMER.FIELD5 is '子品牌名称';
comment on column T_ORI_CUSTOMER.FIELD6 is '在用语音套餐';
comment on column T_ORI_CUSTOMER.FIELD7 is '在用语音套餐名称';



--================== 测试表 ==================
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
  is '框架测试表';
-- Add comments to the columns 
comment on column TEST_TABLE.field1
  is '测试字段';
comment on column TEST_TABLE.field2
  is '测试字段';
comment on column TEST_TABLE.field3
  is '测试字段';
comment on column TEST_TABLE.field4
  is '测试字段';
comment on column TEST_TABLE.field5
  is '测试字段';
comment on column TEST_TABLE.field6
  is '测试字段';
comment on column TEST_TABLE.field7
  is '测试字段';
comment on column TEST_TABLE.field8
  is '测试字段';
comment on column TEST_TABLE.field9
  is '测试字段';
comment on column TEST_TABLE.field10
  is '测试字段';
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

  
--================== 帐号表 ==================
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
  is '主键';
comment on column T_ACCOUNTS.account
  is '帐号';
comment on column T_ACCOUNTS.password
  is '密码';
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
 
  
  --================== 网投+V600投诉工单 ==================
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
  is '储备站点';
comment on column T_ORI_NET_INVESTMENT_V600.field2
  is '工程基站（故障）';
comment on column T_ORI_NET_INVESTMENT_V600.field3
  is '维护基站（故障）';
comment on column T_ORI_NET_INVESTMENT_V600.field4
  is '工程直放站（故障）';
comment on column T_ORI_NET_INVESTMENT_V600.field5
  is '维护直放站（故障）';
comment on column T_ORI_NET_INVESTMENT_V600.field6
  is '内部干扰';
comment on column T_ORI_NET_INVESTMENT_V600.field7
  is '外部干扰';
comment on column T_ORI_NET_INVESTMENT_V600.field8
  is '基站设备、参数调整';
comment on column T_ORI_NET_INVESTMENT_V600.field9
  is '直放站设备、参数调整';
comment on column T_ORI_NET_INVESTMENT_V600.field10
  is '基本正常';
comment on column T_ORI_NET_INVESTMENT_V600.field11
  is '工程原因（基站）';
comment on column T_ORI_NET_INVESTMENT_V600.field12
  is '工程原因（直放站）';
comment on column T_ORI_NET_INVESTMENT_V600.field13
  is '后期规划';
comment on column T_ORI_NET_INVESTMENT_V600.field14
  is '系统升级';
comment on column T_ORI_NET_INVESTMENT_V600.field15
  is '漫游';
comment on column T_ORI_NET_INVESTMENT_V600.field16
  is '核心侧故障';
comment on column T_ORI_NET_INVESTMENT_V600.field17
  is '其它';
comment on column T_ORI_NET_INVESTMENT_V600.field18
  is '工单类型';
comment on column T_ORI_NET_INVESTMENT_V600.field19
  is '投诉类型';
comment on column T_ORI_NET_INVESTMENT_V600.field20
  is '投诉原因';
comment on column T_ORI_NET_INVESTMENT_V600.field21
  is '工程或故障站名';
comment on column T_ORI_NET_INVESTMENT_V600.field22
  is '建议责任部门';
comment on column T_ORI_NET_INVESTMENT_V600.field23
  is '实施情况';
comment on column T_ORI_NET_INVESTMENT_V600.field24
  is '解决后回访情况';
comment on column T_ORI_NET_INVESTMENT_V600.field25
  is '最终解决情况';
comment on column T_ORI_NET_INVESTMENT_V600.field26
  is '最终回复客户时间';
comment on column T_ORI_NET_INVESTMENT_V600.field27
  is '工单号';
comment on column T_ORI_NET_INVESTMENT_V600.field28
  is '投诉号码';
comment on column T_ORI_NET_INVESTMENT_V600.field29
  is '客户级别';
comment on column T_ORI_NET_INVESTMENT_V600.field30
  is '内部投诉经办人';
comment on column T_ORI_NET_INVESTMENT_V600.field31
  is '手机品牌型号';
comment on column T_ORI_NET_INVESTMENT_V600.field32
  is '投诉内容';
comment on column T_ORI_NET_INVESTMENT_V600.field33
  is '是否黑点库已有登记';
comment on column T_ORI_NET_INVESTMENT_V600.field34
  is '是否重复投诉';
comment on column T_ORI_NET_INVESTMENT_V600.field35
  is '投诉属性';
comment on column T_ORI_NET_INVESTMENT_V600.field36
  is '投诉时间';
comment on column T_ORI_NET_INVESTMENT_V600.field37
  is '回复受理部门/人';
comment on column T_ORI_NET_INVESTMENT_V600.field38
  is '一级关键字';
comment on column T_ORI_NET_INVESTMENT_V600.field39
  is '二级关键字';
comment on column T_ORI_NET_INVESTMENT_V600.field40
  is '详细地址';
comment on column T_ORI_NET_INVESTMENT_V600.field41
  is '所属区域';
comment on column T_ORI_NET_INVESTMENT_V600.field42
  is '投诉区域小区覆盖';
comment on column T_ORI_NET_INVESTMENT_V600.field43
  is '受理的情况（回复内容）';
comment on column T_ORI_NET_INVESTMENT_V600.field44
  is '工单承诺解决时间';
comment on column T_ORI_NET_INVESTMENT_V600.field45
  is '遗留问题';
comment on column T_ORI_NET_INVESTMENT_V600.field46
  is '实际解决时间';
comment on column T_ORI_NET_INVESTMENT_V600.field47
  is '经度';
comment on column T_ORI_NET_INVESTMENT_V600.field48
  is '纬度';
comment on column T_ORI_NET_INVESTMENT_V600.field49
  is '是否已经回访';
comment on column T_ORI_NET_INVESTMENT_V600.field50
  is '工单处理时间';

--================== 黑点库ID信息表 ==================
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
  is '黑点库ID信息表';
-- Add comments to the columns 
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field1
  is '网络类型';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field2
  is '投诉点ID';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field3
  is '投诉点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field4
  is '投诉点类型';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field5
  is '开始时间';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field6
  is '审核状态';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field7
  is '故障原因';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field8
  is '影响范围';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field9
  is '地市名';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field10
  is '域';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field11
  is '地址';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field12
  is '投诉量';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field13
  is '投诉类型';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field14
  is '联系电话';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field15
  is '经度';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field16
  is '纬度';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field17
  is '解决办法';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field18
  is '详细处理情况';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field19
  is '当前状态';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field20
  is '投诉点所属ID';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field21
  is '站点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field22
  is '站点类型';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field23
  is '预期解决时间';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field24
  is '能否解决';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field25
  is '问题来源';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field26
  is '更新时间';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field27
  is '工程站点ID';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field28
  is '拟建站点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field29
  is '实际站点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field30
  is '站点经度';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field31
  is '站点纬度';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field32
  is '规划年份';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field33
  is '工程进度';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field34
  is '计划完成时间';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field35
  is '实际完成时间';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field36
  is '站点覆盖范围';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field37
  is '站点说明';
comment on column T_ORI_BLACK_DOT_LIBRARY_ID.field38
  is '解决时间';


--================== T_ORI_BLACK_DOT_LIBRARY表 ==================
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
  is '黑点库ID信息表';
-- Add comments to the columns 
comment on column T_ORI_BLACK_DOT_LIBRARY.FIELD0
  is 'UUID唯一标识';
comment on column T_ORI_BLACK_DOT_LIBRARY.field1
  is '网络类型';
comment on column T_ORI_BLACK_DOT_LIBRARY.field2
  is '投诉点ID';
comment on column T_ORI_BLACK_DOT_LIBRARY.field3
  is '投诉点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY.field4
  is '投诉点类型';
comment on column T_ORI_BLACK_DOT_LIBRARY.field5
  is '开始时间';
comment on column T_ORI_BLACK_DOT_LIBRARY.field6
  is '审核状态';
comment on column T_ORI_BLACK_DOT_LIBRARY.field7
  is '故障原因';
comment on column T_ORI_BLACK_DOT_LIBRARY.field8
  is '影响范围';
comment on column T_ORI_BLACK_DOT_LIBRARY.field9
  is '地市名';
comment on column T_ORI_BLACK_DOT_LIBRARY.field10
  is '域';
comment on column T_ORI_BLACK_DOT_LIBRARY.field11
  is '地址';
comment on column T_ORI_BLACK_DOT_LIBRARY.field12
  is '投诉量';
comment on column T_ORI_BLACK_DOT_LIBRARY.field13
  is '投诉类型';
comment on column T_ORI_BLACK_DOT_LIBRARY.field14
  is '联系电话';
comment on column T_ORI_BLACK_DOT_LIBRARY.field15
  is '经度';
comment on column T_ORI_BLACK_DOT_LIBRARY.field16
  is '纬度';
comment on column T_ORI_BLACK_DOT_LIBRARY.field17
  is '解决办法';
comment on column T_ORI_BLACK_DOT_LIBRARY.field18
  is '详细处理情况';
comment on column T_ORI_BLACK_DOT_LIBRARY.field19
  is '当前状态';
comment on column T_ORI_BLACK_DOT_LIBRARY.field20
  is '投诉点所属ID';
comment on column T_ORI_BLACK_DOT_LIBRARY.field21
  is '站点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY.field22
  is '站点类型';
comment on column T_ORI_BLACK_DOT_LIBRARY.field23
  is '预期解决时间';
comment on column T_ORI_BLACK_DOT_LIBRARY.field24
  is '能否解决';
comment on column T_ORI_BLACK_DOT_LIBRARY.field25
  is '问题来源';
comment on column T_ORI_BLACK_DOT_LIBRARY.field26
  is '更新时间';
comment on column T_ORI_BLACK_DOT_LIBRARY.field27
  is '工程站点ID';
comment on column T_ORI_BLACK_DOT_LIBRARY.field28
  is '拟建站点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY.field29
  is '实际站点名称';
comment on column T_ORI_BLACK_DOT_LIBRARY.field30
  is '站点经度';
comment on column T_ORI_BLACK_DOT_LIBRARY.field31
  is '站点纬度';
comment on column T_ORI_BLACK_DOT_LIBRARY.field32
  is '规划年份';
comment on column T_ORI_BLACK_DOT_LIBRARY.field33
  is '工程进度';
comment on column T_ORI_BLACK_DOT_LIBRARY.field34
  is '计划完成时间';
comment on column T_ORI_BLACK_DOT_LIBRARY.field35
  is '实际完成时间';
comment on column T_ORI_BLACK_DOT_LIBRARY.field36
  is '站点覆盖范围';
comment on column T_ORI_BLACK_DOT_LIBRARY.field37
  is '站点说明';
comment on column T_ORI_BLACK_DOT_LIBRARY.field38
  is '解决时间';
