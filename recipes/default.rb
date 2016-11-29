#
# Cookbook Name:: chef-alfresco-internal-lb
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "alfresco-internal-lb::#{node['internal_lb']['engine']}"
