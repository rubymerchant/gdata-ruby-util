# Copyright (C) 2010 Ying Tsen Hong.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$:.unshift(File.dirname(__FILE__))
require 'test_helper'

class TC_GData_Maps_Map < Test::Unit::TestCase
  include TestHelper
  extend  TestHelper::ClassMethods
  
  def self.startup
    @@client = GData::Client::Maps.new
    @@client.clientlogin(self.get_username, self.get_password)
    @@test_map = GData::Maps::Map.create("GData::Maps::Map#create TestCaseMap", "Test Case Map.")
  end
  
  def self.shutdown
    @@test_map.delete(@@test_map.at_css("link[rel='edit']")['href'])
    @@test_map = nil
    @@client = nil
  end
  
  def setup
  end
  
  def teardown
  end
  
  def test_create
    map = GData::Maps::Map.create("GData::Maps::Map::Map#create Test", "Test Map.")
    assert_equal "GData::Maps::Map::Map#create Test", map.at_css('title').content
    
    # clean up
    response = @@client.delete(map.at_css("link[rel='edit']")['href'])
    assert_equal 200, response.status_code
  end
  
  def test_create_feature
    feature = @@test_map.create_feature('title_str', 'name_str', 'description_str', 
      coordinates_hash = {:longitude => '-105.27', :latitude => '40.015', :elevation => '0.0'})
    assert_not_nil feature
    puts "\n\n!!!!!debug=#{feature.at_css('atom|content')}"
    assert_equal 'name_str', feature.at_css('atom|content Placemark name').content
  end
  

  
end