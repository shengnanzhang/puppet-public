#策略用途：统一管理文件/etc/sysctl.conf
#策略说明：同步文件/etc/sysctl.conf，如果文件被同步了，需要执行sysctl -p, 从文件/etc/sysctl.conf中加载
#	修改参数1、默认fs.inotify.max_user_watches参数值太小，导致inotifywait无法启动成功
#	修改参数2、降低磁盘写缓存的阈值
#	修改参数3、降低flush到磁盘时的延迟
#策略风险:
#策略验证:
#使用说明:
#case记录:

class base::sysctl {
	file { "/etc/sysctl.conf":
		ensure => "file",
		mode   => "0644",
		owner  => "root",
		group  => "root",
		source => "puppet:///modules/base/sysctl.conf",
		notify => "Exec[sysctl -p]",
		backup => main,
	}
	exec {"sysctl -p":
		cwd       => "/tmp",
	    	path      => "/usr/bin:/usr/sbin:/sbin:/bin",
	    	provider  => "shell",
	    	timeout   => "60",
	    	refreshonly => "true"
	}
}
