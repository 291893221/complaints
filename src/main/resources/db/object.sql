----------------------------------------------------------
-- Export file for user COMPLAINTS                      --
-- Created by Administrator on 2015-12-23 星期三, 17:12:21 --
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
  is '框架测试表';
comment on column COMPLAINTS.TEST_TABLE.field1
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field2
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field3
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field4
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field5
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field6
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field7
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field8
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field9
  is '测试字段';
comment on column COMPLAINTS.TEST_TABLE.field10
  is '测试字段';
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
  is '主键';
comment on column COMPLAINTS.T_ACCOUNTS.account
  is '帐号';
comment on column COMPLAINTS.T_ACCOUNTS.password
  is '密码';
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
  is '234G小区基础信息表';
comment on column COMPLAINTS.T_ORI_234G_CELL.field1
  is '网络制式';
comment on column COMPLAINTS.T_ORI_234G_CELL.field2
  is '城市';
comment on column COMPLAINTS.T_ORI_234G_CELL.field3
  is '县区';
comment on column COMPLAINTS.T_ORI_234G_CELL.field4
  is '乡镇';
comment on column COMPLAINTS.T_ORI_234G_CELL.field5
  is '基站名';
comment on column COMPLAINTS.T_ORI_234G_CELL.field6
  is '小区名';
comment on column COMPLAINTS.T_ORI_234G_CELL.field7
  is 'CI';
comment on column COMPLAINTS.T_ORI_234G_CELL.field8
  is 'BSC/RNC';
comment on column COMPLAINTS.T_ORI_234G_CELL.field9
  is '经度';
comment on column COMPLAINTS.T_ORI_234G_CELL.field10
  is '纬度';
comment on column COMPLAINTS.T_ORI_234G_CELL.field11
  is '方向角';
comment on column COMPLAINTS.T_ORI_234G_CELL.field12
  is '覆盖场景';
comment on column COMPLAINTS.T_ORI_234G_CELL.field13
  is '是否VIP小区';

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
  is '234G流量话务量统计表';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field1
  is '小区中文名';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field2
  is 'BSC';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field3
  is '区域及镇区';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field4
  is '网络制式';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field5
  is '月日均话务量(求整月平均)';
comment on column COMPLAINTS.T_ORI_234G_TRAFFIC.field6
  is '月日均数据量(求整月平均)';

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
  is '黑点库ID信息表';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field1
  is '网络类型';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field2
  is '投诉点ID';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field3
  is '投诉点名称';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field4
  is '投诉点类型';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field5
  is '开始时间';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field6
  is '审核状态';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field7
  is '故障原因';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field8
  is '影响范围';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field9
  is '地市名';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field10
  is '域';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field11
  is '地址';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field12
  is '投诉量';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field13
  is '投诉类型';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field14
  is '联系电话';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field15
  is '经度';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field16
  is '纬度';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field17
  is '解决办法';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field18
  is '详细处理情况';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field19
  is '当前状态';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field20
  is '投诉点所属ID';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field21
  is '站点名称';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field22
  is '站点类型';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field23
  is '预期解决时间';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field24
  is '能否解决';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field25
  is '问题来源';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field26
  is '更新时间';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field27
  is '工程站点ID';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field28
  is '拟建站点名称';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field29
  is '实际站点名称';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field30
  is '站点经度';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field31
  is '站点纬度';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field32
  is '规划年份';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field33
  is '工程进度';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field34
  is '计划完成时间';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field35
  is '实际完成时间';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field36
  is '站点覆盖范围';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field37
  is '站点说明';
comment on column COMPLAINTS.T_ORI_BLACK_DOT_LIBRARY_ID.field38
  is '解决时间';

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
  is 'V600市场投诉类投诉工单';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field1
  is '    储备站点    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field2
  is '    工程基站（故障）    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field3
  is '    维护基站（故障）    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field4
  is '    工程直放站（故障）    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field5
  is '    维护直放站（故障）    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field6
  is '    内部干扰    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field7
  is '    外部干扰    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field8
  is '    基站设备、参数调整    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field9
  is '    直放站设备、参数调整    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field10
  is '    基本正常    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field11
  is '    工程原因（基站）    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field12
  is '    工程原因（直放站）    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field13
  is '    后期规划    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field14
  is '    系统升级    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field15
  is '    漫游    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field16
  is '    核心侧故障    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field17
  is '    其它    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field18
  is '    工单类型    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field19
  is '    投诉类型    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field20
  is '    投诉原因    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field21
  is '    工程或故障站名    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field22
  is '    建议责任部门    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field23
  is '    实施情况    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field24
  is '    解决后回访情况    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field25
  is '    最终解决情况    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field26
  is '    最终回复客户时间    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field27
  is '    工单号    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field28
  is '    投诉号码    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field29
  is '    客户级别    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field30
  is '    内部投诉经办人    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field31
  is '    手机品牌型号    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field32
  is '    投诉内容    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field33
  is '    是否黑点库已有登记    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field34
  is '    是否重复投诉    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field35
  is '    投诉属性    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field36
  is '    投诉时间    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field37
  is '    回复受理部门/人    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field38
  is '    一级关键字    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field39
  is '    二级关键字    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field40
  is '    详细地址    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field41
  is '    所属区域    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field42
  is '    投诉区域小区覆盖    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field43
  is '    受理的情况（回复内容）    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field44
  is '    工单承诺解决时间    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field45
  is '    遗留问题    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field46
  is '    实际解决时间    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field47
  is '    经度    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field48
  is '    纬度    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field49
  is '    是否已经回访    ';
comment on column COMPLAINTS.T_ORI_NET_INVESTMENT_V600.field50
  is '    工单处理时间    ';

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
  is 'NPS客户满意度调查表';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field1
  is '手机号码';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field2
  is '用户投诉区域';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field3
  is '市场提供的区域';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field4
  is '是否对应';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field5
  is '推荐意愿评分';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field6
  is '回访批次';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field7
  is '登记时间';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field8
  is '不推荐原因';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field9
  is '初步原因分类';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field10
  is '回访用户后的原因';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field11
  is '回访用户后的原因分类';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field12
  is '是否已恢复';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field13
  is '网络问题分类';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field14
  is '是否已有规划';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field15
  is '信号问题地址';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field16
  is '经度';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field17
  is '维度';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field18
  is '备注';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field19
  is '是否现场测试';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field20
  is '测试情况';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field21
  is '是否网优调整';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field22
  is '规划站点';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field23
  is '距离(KM)';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field24
  is '区域类型';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field25
  is '现网站点';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field26
  is '距离(KM)';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field27
  is '未规划原因';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field28
  is '是否现网黑点';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field29
  is '网优调整优化预计完成时间';
comment on column COMPLAINTS.T_ORI_NPS_CUSTOMER.field30
  is '客户类型';

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
  is '投诉类型';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field2
  is '流水号';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field3
  is '受理号码';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field4
  is '服务请求类别';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field5
  is '问题分类';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field6
  is '问题细项';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field7
  is '投诉内容';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field8
  is '客户回复内容';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field9
  is '是否下发调查短信';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field10
  is '受理时间';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field11
  is '客户归属地';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field12
  is '客户品牌';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field13
  is '客户级别';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field14
  is '受理工号';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field15
  is '受理部门';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field16
  is '业务地市';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field17
  is '投诉途径';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field18
  is '受理方式';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field19
  is '紧急程度';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field20
  is '受理短信';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field21
  is '信用度星级数';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field22
  is '升级预警';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field23
  is '客户分类';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field24
  is '语种';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field25
  is '营销方案名称';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field26
  is '请求编号';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field27
  is '录音流水';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field28
  is '录音时间';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field29
  is '反馈时间';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field30
  is '是否敏感客户';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field31
  is '主叫号码';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field32
  is '联系人姓名';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field33
  is '联系电话';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field34
  is '联系方式';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field35
  is '联系地址';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field36
  is '责任部门';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field37
  is '责任原因';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field38
  is '派单质量评价';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field39
  is '评价备注';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field40
  is '终端品牌型号';
comment on column COMPLAINTS.T_ORI_V600_MARKET.field41
  is '批量故障名称';


spool off
