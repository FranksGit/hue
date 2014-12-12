## Licensed to Cloudera, Inc. under one
## or more contributor license agreements.  See the NOTICE file
## distributed with this work for additional information
## regarding copyright ownership.  Cloudera, Inc. licenses this file
## to you under the Apache License, Version 2.0 (the
## "License"); you may not use this file except in compliance
## with the License.  You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.

<%!
  from desktop.views import commonheader, commonfooter
  from django.utils.translation import ugettext as _
%>
<%namespace name="actionbar" file="../actionbar.mako" />
<%namespace name="layout" file="../navigation-bar.mako" />
<%namespace name="utils" file="../utils.inc.mako" />

${ commonheader(_("Coordinators"), "oozie", user) | n,unicode }
${ layout.menubar(section='Coordinators') }


<div class="container-fluid">
  <div class="card card-small">
  <h1 class="card-heading simple">${ _('Coordinator Editor') }</h1>

  % for coordinator in coordinators:
    <div>
      <a href="${ url('oozie:edit_coordinator') }?coordinator=${ coordinator.id }">
        ${ coordinator.name }
      </a>
    </div>
  % endfor

  </div>
</div>

${commonfooter(messages) | n,unicode}
