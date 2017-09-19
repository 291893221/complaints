t_ori_234g_cell
t_ori_234g_traffic
t_ori_black_dot_library_id
t_ori_net_investment_v600
t_ori_net_v600
t_ori_nps_customer
t_ori_v600_market


alter table t_ori_234g_cell add FIELD0 VARCHAR2(80);
alter table t_ori_234g_traffic add FIELD0 VARCHAR2(80);
alter table t_ori_black_dot_library_id add FIELD0 VARCHAR2(80);
alter table t_ori_net_investment_v600 add FIELD0 VARCHAR2(80);
alter table t_ori_net_v600 add FIELD0 VARCHAR2(80);
alter table t_ori_nps_customer add FIELD0 VARCHAR2(80);
alter table t_ori_v600_market add FIELD0 VARCHAR2(80);

comment on column t_ori_234g_cell.FIELD0  is 'UUID唯一标识';
comment on column t_ori_234g_traffic.FIELD0  is 'UUID唯一标识';
comment on column t_ori_black_dot_library_id.FIELD0  is 'UUID唯一标识';
comment on column t_ori_net_investment_v600.FIELD0  is 'UUID唯一标识';
comment on column t_ori_net_v600.FIELD0  is 'UUID唯一标识';
comment on column t_ori_nps_customer.FIELD0  is 'UUID唯一标识';
comment on column t_ori_v600_market.FIELD0  is 'UUID唯一标识';