--
-- (C) 2020 - ntop.org
--

local alert_keys = require "alert_keys"
local alert_creators = require "alert_creators"
local status_keys = require "flow_keys"
local alert_consts = require "alert_consts"

-- #######################################################

local function zeroTcpWindow(ifid, alert, zero_tcp_window_checks)
  if(zero_tcp_window_checks == nil) then
    return(i18n("zero_tcp_window.status_zero_tcp_window_description"))
  else
    if(zero_tcp_window_checks.is_client) then
      return(i18n("zero_tcp_window.status_zero_tcp_window_description_c2s"))
    else
      return(i18n("zero_tcp_window.status_zero_tcp_window_description_s2c"))
    end
  end
end

-- ##############################################

local function createZeroTcpWindow(alert_severity, alert_granularity, is_server, is_client)
  local zero_tcp_window_type = {
     alert_granularity = alert_granularity,
     alert_severity = alert_severity,
     alert_type_params = {
      is_server = is_server,
      is_client = is_client
     }
  }

  return zero_tcp_window_type
end

-- #######################################################

return {
  status_key = status_keys.ntopng.status_zero_tcp_window,
  alert_severity = alert_consts.alert_severities.warning,
  alert_type = alert_consts.alert_types.alert_connection_issues,
  i18n_title = "zero_tcp_window.stats_zero_tcp_window_title",
  i18n_description = zeroTcpWindow,
  icon = "fas fa-arrow-circle-up",
  creator = createZeroTcpWindow,
}
