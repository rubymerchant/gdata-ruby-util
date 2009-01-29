# Copyright (C) 2008 Google Inc.
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

module GData
  module Client
    
    # Client class to wrap working with the GMail Atom Feed.
    class GMail < Base
      
      DEFAULT_OPTIONS = {
        :clientlogin_service => 'mail',
        :authsub_scope => 'https://mail.google.com/mail/feed/atom/' }
      
      def initialize(options = {})
        options = DEFAULT_OPTIONS.merge(options)
        super(options)
      end
    end
  end
end