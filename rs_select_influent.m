% toggle the manuel switch to Avedore
switch_path = [sys '/influent_switch'];
if strcmpi(influent,'bsm2'),    set_param(switch_path,'sw','1'); end
if strcmpi(influent,'avedore'), set_param(switch_path,'sw','0'); end