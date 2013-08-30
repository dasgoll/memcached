#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# All rights reserved - Do Not Redistribute
#
if node["platform"] =="centos" && node["platform_version"][0] == "5"
  include_recipe "yum::remi"
end

case node[:platform]
when "centos", "redhat", "amazon", "scientific", "fedora"

  package "memcached" do
    action :install
  end

  template "/etc/sysconfig/memcached" do
    source "memcached.erb"
    owner "root"
    group "root"
    mode "0644"
    notifies :restart, "service[memcached]"
  end

  service "memcached" do
    action [:enable, :start]
  end
end
