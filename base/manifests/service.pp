#策略用途：启停服务
#策略说明：指定的服务确保运行状态以及设置为开机自启动
#策略风险：无
#策略验证：查看服务是否启动 service sshd status
#使用说明：参数ensure确保服务运行，enable服务开机是否自启动，hasrestart是否init脚本可以重启此服务，hasstatus是否init脚本
#         查看此服务状态
#case记录：

class base::service {
	service { ["sshd", "ntpd", "crond"]:
		ensure => "running",
		enable => "true",
		hasrestart => true, 
		hasstatus => true,  
        }
}
