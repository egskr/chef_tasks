#
# Cookbook:: jboss
# Recipe:: default
#
# Copyright:: 2017, The Author: Yegor, All Rights Reserved.

include_recipe 'java'
include_recipe "jboss::install"
include_recipe "jboss::configure"
