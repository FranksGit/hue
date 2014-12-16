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

<%namespace name="dashboard" file="/common_dashboard.mako" />
<%namespace name="utils" file="../utils.inc.mako" />

${ commonheader(_("Workflow Editor"), "Oozie", user, "40px") | n,unicode }

<script type="text/javascript">
  if (window.location.hash != "") {
    if (window.location.hash.indexOf("workflow") > -1) {
      location.href = "/oozie/editor/workflow/edit/?" + window.location.hash.substr(1);
    }
  }
</script>


<%dashboard:layout_toolbar>
  <%def name="skipLayout()"></%def>
  <%def name="widgetSectionName()">${ _('ACTIONS') }</%def>
  <%def name="widgets()">
    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableHiveAction(), isEnabled: true,
                    options: {'refreshPositions': true, 'start': function(event, ui){$root.currentlyDraggedWidget(draggableHiveAction());}}}"
         title="${_('Hive Script')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><img src="/oozie/static/art/icon_beeswax_48.png" class="app-icon"></a>
    </div>

    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableHive2Action(), isEnabled: true,
                    options: {'refreshPositions': true, 'start': function(event, ui){$root.currentlyDraggedWidget(draggableHive2Action());}}}"
         title="${_('HiveServer2 Script')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><img src="/oozie/static/art/icon_beeswax_48.png" class="app-icon"><sup style="color: #338bb8; margin-left: -4px; top: -14px; font-size: 12px">2</sup></a>
    </div>

    <div data-bind="css: { 'draggable-widget': true},
                    draggable: {data: draggablePigAction(), isEnabled: true,
                    options: {'refreshPositions': true, 'start': function(event, ui){$root.currentlyDraggedWidget(draggablePigAction());}}}"
         title="${_('Pig Script')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><img src="/oozie/static/art/icon_pig_48.png" class="app-icon"></a>
    </div>

    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableJavaAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableJavaAction());}}}"
         title="${_('Java program')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-file-code-o"></i></a>
    </div>

    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableSqoopAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableSqoopAction());}}}"
         title="${_('Sqoop 1')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><img src="/oozie/static/art/icon_sqoop_48.png" class="app-icon"></a>
    </div>

    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableMapReduceAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableMapReduceAction());}}}"
         title="${_('MapReduce job')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-file-archive-o"></i></a>
    </div>

    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableSubworkflowAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableSubworkflowAction());}}}"
         title="${_('Sub workflow')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-code-fork"></i></a>
    </div>
    
    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableShellAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableShellAction());}}}"
         title="${_('Shell')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-terminal"></i></a>
    </div>
    
    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableSshAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableSshAction());}}}"
         title="${_('Ssh')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-tty"></i></a>
    </div>
        
    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableFsAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableFsAction());}}}"
         title="${_('HDFS Fs')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-file-o"></i></a>
    </div>    
    
    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableEmailAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableEmailAction());}}}"
         title="${_('Email')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-envelope-o"></i></a>
    </div>    
    
    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableStreamingAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableStreamingAction());}}}"
         title="${_('Streaming')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-exchange"></i></a>
    </div>    

    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableDistCpAction(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableDistCpAction());}}}"
         title="${_('Distcp')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-files-o"></i></a>
    </div>    

    <div data-bind="css: { 'draggable-widget': true },
                    draggable: {data: draggableKillNode(), isEnabled: true,
                    options: {'start': function(event, ui){$root.currentlyDraggedWidget(draggableKillNode());}}}"
         title="${_('Kill')}" rel="tooltip" data-placement="top">
         <a class="draggable-icon"><i class="fa fa-stop"></i></a>
    </div>
</%def>
</%dashboard:layout_toolbar>


<div class="search-bar">
  <div class="pull-right" style="padding-right:50px">
    <a title="${ _('Gen XML') }" rel="tooltip" data-placement="bottom" data-bind="click: gen_xml, css: {'btn': true}">
      <i class="fa fa-file-code-o"></i>
    </a>
    <a title="${ _('Import workflows') }" rel="tooltip" data-placement="bottom" data-bind="click: import_workflows, css: {'btn': true}">
      <i class="fa fa fa-download"></i>
    </a>
    &nbsp;&nbsp;&nbsp;
    <a title="${ _('Submit') }" rel="tooltip" data-placement="bottom" data-bind="click: showSubmitPopup, css: {'btn': true}">
      <i class="fa fa-play"></i>
    </a>
    <a title="${ _('Edit') }" rel="tooltip" data-placement="bottom" data-bind="click: toggleEditing, css: {'btn': true, 'btn-inverse': isEditing}">
      <i class="fa fa-pencil"></i>
    </a>
    &nbsp;&nbsp;&nbsp;
    % if user.is_superuser:
      <button type="button" title="${ _('Settings') }" rel="tooltip" data-placement="bottom" data-toggle="modal" data-target="#settingsModal" data-bind="css: {'btn': true}">
        <i class="fa fa-cog"></i>
      </button>
      <a title="${ _('Workspace') }" target="_blank" rel="tooltip" data-placement="right"
          data-original-title="${ _('Go upload additional files and libraries to the deployment directory on HDFS') }"
          data-bind="css: {'btn': true}, attr: {href: '/filebrowser/view' + $root.workflow.properties.deployment_dir() }">
        <i class="fa fa-folder-open"></i>
      </a>      
      &nbsp;&nbsp;&nbsp;
      <button type="button" title="${ _('Save') }" rel="tooltip" data-placement="bottom" data-loading-text="${ _("Saving...") }" data-bind="click: $root.save, css: {'btn': true}">
        <i class="fa fa-save"></i>
      </button>
      &nbsp;&nbsp;&nbsp;
      <a class="btn" href="${ url('oozie:new_workflow') }" title="${ _('New') }" rel="tooltip" data-placement="bottom" data-bind="css: {'btn': true}">
        <i class="fa fa-file-o"></i>
      </a>
      <a class="btn" href="${ url('oozie:list_editor_workflows') }" title="${ _('Workflows') }" rel="tooltip" data-placement="bottom" data-bind="css: {'btn': true}">
        <i class="fa fa-tags"></i>
      </a>
    % endif
  </div>

  <form class="form-search" style="margin: 0">
    <strong>${_("Name")}</strong>
    <input data-bind="value: $root.workflow.name"/>
  </form>
</div>



 <div id="emptyDashboard" data-bind="fadeVisible: !isEditing() && columns().length == 0">
  <div style="float:left; padding-top: 90px; margin-right: 20px; text-align: center; width: 260px">${ _('Click on the pencil to get started with your dashboard!') }</div>
    <img src="/static/art/hint_arrow.png" />
  </div>

  <div id="emptyDashboardEditing" data-bind="fadeVisible: isEditing() && columns().length == 0 && previewColumns() == ''">
    <div style="float:right; padding-top: 90px; margin-left: 20px; text-align: center; width: 260px">${ _('Pick an index and Click on a layout to start your dashboard!') }</div>
    <img src="/static/art/hint_arrow_horiz_flipped.png" />
  </div>


  <div data-bind="visible: isEditing() && previewColumns() != '' && columns().length == 0, css:{'with-top-margin': isEditing()}">
  <div class="container-fluid">
    <div class="row-fluid" data-bind="visible: previewColumns() == 'oneSixthLeft'">
      <div class="span2 preview-row"></div>
      <div class="span10 preview-row"></div>
    </div>
    <div class="row-fluid" data-bind="visible: previewColumns() == 'full'">
      <div class="span12 preview-row">
      </div>
    </div>
    <div class="row-fluid" data-bind="visible: previewColumns() == 'magic'">
      <div class="span12 preview-row">
        <div style="text-align: center; color:#EEE; font-size: 180px; margin-top: 80px">
          <i class="fa fa-magic"></i>
        </div>
      </div>
    </div>
  </div>
</div>

<div data-bind="css: {'dashboard': true, 'readonly': ! isEditing()}">
  <div class="container-fluid">
    <div class="row-fluid" data-bind="template: { name: 'column-template', foreach: columns}">
    </div>
    <div class="clearfix"></div>
  </div>
</div>


<script type="text/html" id="column-template">
  <div data-bind="css: klass()" style="min-height: 50px !important;">
    <div data-bind="template: { name: 'row-template', data: oozieStartRow }" style="margin-top: 50px"></div>

    <div class="container-fluid" data-bind="visible: $root.isEditing() && oozieRows().length > 0">
      <div class="row-fluid">
        <div data-bind="visible: enableOozieDropOnBefore, css: {'span4 offset4': true, 'drop-target': true, 'is-editing': $root.isEditing}, droppable: {enabled: $root.isEditing, onDrop: function(x, y){ var _w = $root.addDraggedWidget($data, true); widgetDraggedAdditionalHandler(_w); } }"></div>
        <div data-bind="visible: ! enableOozieDropOnBefore(), css: {'drop-target drop-target-disabled': true, 'is-editing': $root.isEditing}"></div>
      </div>
    </div>
    <div data-bind="template: { name: 'internal-row-template', foreach: oozieRows}">
    </div>
    <div class="container-fluid" data-bind="visible: $root.isEditing() && rows().length > 0">
      <div class="row-fluid">
        <div data-bind="visible: enableOozieDropOnAfter, css: {'span4 offset4': true, 'drop-target': true, 'is-editing': $root.isEditing}, droppable: {enabled: $root.isEditing, onDrop: function(){ var _w = $root.addDraggedWidget($data, false); widgetDraggedAdditionalHandler(_w); } }">
          <span data-bind="visible: oozieRows().length == 0">${ _('Drop your action here.') }</span>
        </div>
        <div data-bind="visible: ! enableOozieDropOnAfter(), css: {'drop-target drop-target-disabled': true, 'is-editing': $root.isEditing}"></div>
      </div>
    </div>

    <div data-bind="template: { name: 'row-template', data: oozieEndRow }"></div>

    <div data-bind="template: { name: 'row-template', data: oozieKillRow }" style="margin-top: 60px"></div>
  </div>
</script>


<script type="text/html" id="internal-column-template">
  <div data-bind="css: klass()" style="min-height: 50px !important;">
    <div class="container-fluid" data-bind="visible: $root.isEditing()">
      <div data-bind="visible: ! enableOozieDropOnBefore(), css: {'drop-target drop-target-disabled': true, 'is-editing': $root.isEditing}"></div>
      <div data-bind="visible: enableOozieDropOnBefore, css: {'drop-target': true, 'is-editing': $root.isEditing}, droppable: {enabled: $root.isEditing, onDrop: function(){ var _w = $root.addDraggedWidget($data, true); widgetDraggedAdditionalHandler(_w); } }"></div>
    </div>
    <div data-bind="template: { name: 'internal-row-template', foreach: rows}">
    </div>
    <div class="container-fluid" data-bind="visible: $root.isEditing()">
      <div data-bind="visible: ! enableOozieDropOnAfter(), css: {'drop-target drop-target-disabled': true, 'is-editing': $root.isEditing}"></div>
      <div data-bind="visible: enableOozieDropOnAfter, css: {'drop-target': true, 'is-editing': $root.isEditing}, droppable: {enabled: $root.isEditing, onDrop: function(){ var _w = $root.addDraggedWidget($data, false); widgetDraggedAdditionalHandler(_w); } }"></div>
    </div>
  </div>
</script>


<script type="text/html" id="row-template">
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span4 offset4">
        <div data-bind="css: {'row-fluid': true, 'row-container':true, 'is-editing': $root.isEditing},
          sortable: { template: 'widget-template', data: widgets, allowDrop: $root.isEditing() && widgets().length < 1, isEnabled: $root.isEditing() && widgets().length < 1,
          options: {'opacity': 0.7, 'placeholder': 'row-highlight', 'greedy': true,
              'stop': function(event, ui){},
              'helper': function(event){lastWindowScrollPosition = $(window).scrollTop(); var _par = $('<div>');_par.addClass('card card-widget');var _title = $('<h2>');_title.addClass('card-heading simple');_title.text($(event.toElement).text());_title.appendTo(_par);_par.height(80);_par.width(180);return _par;}},
              dragged: function(widget){widgetDraggedAdditionalHandler(widget)}}">
        </div>
      </div>
    </div>
  </div>
</script>

<script type="text/html" id="internal-row-template">
  <div class="container-fluid">
    <div class="row-fluid" data-bind="visible: $index() > 0 && $root.isEditing() && ! $root.isRowBeforeJoin($data) && ! $root.isRowAfterFork($data)" style="margin-bottom: 10px">
      <div data-bind="css: {'span1': true, 'offset3andhalf': ($root.isEditing() && $parents.length <= 2 && columns().length == 0), 'offset4': (!$root.isEditing() && $parents.length <= 2 && columns().length == 0), 'readonly': ! $root.isEditing()}"></div>
      <div data-bind="css: {'span10': ($parents.length > 2 || columns().length > 0), 'span4': ($parents.length <= 2 && columns().length == 0), 'offset3andhalf': (!$root.isEditing() && $parents.length <= 2 && columns().length == 0), 'readonly': ! $root.isEditing()}">
        <div data-bind="visible: $root.isEditing() && ! enableOozieDropOnBefore(), css: {'drop-target drop-target-disabled': true, 'is-editing': $root.isEditing}"></div>
        <div style="text-align: left" data-bind="visible: $root.isEditing() && enableOozieDropOnBefore(), css: {'drop-target': true, 'is-editing': $root.isEditing}, droppable: {enabled: $root.isEditing, onDrop: function(){ var _w = $root.addDraggedWidget($data); widgetDraggedAdditionalHandler(_w); } }"></div>
      </div>
      <div data-bind="css: {'span1': true, 'readonly': ! $root.isEditing()}"></div>
    </div>
    <div class="row-fluid">
      <div data-bind="css: {'span1': true, 'offset3andhalf': ($root.isEditing() && $parents.length <= 2 && columns().length == 0), 'offset4': (!$root.isEditing() && $parents.length <= 2 && columns().length == 0), 'readonly': ! $root.isEditing()}">
        <div data-bind="visible: $root.isEditing() && enableOozieDropOnSide() && !($data.widgets().length > 0 && ['join-widget', 'decision-widget'].indexOf($data.widgets()[0].widgetType()) > -1), css: {'drop-target drop-target-side': true, 'is-editing': $root.isEditing}, droppable: {enabled: $root.isEditing, onDrop: function(){ var _w = $root.addSideDraggedWidget($data, true); widgetDraggedAdditionalHandler(_w); } }"></div>
      </div>
      <div  data-bind="css: {'span10': ($parents.length > 2 || columns().length > 0), 'span4': ($parents.length <= 2 && columns().length == 0), 'offset3andhalf': (!$root.isEditing() && $parents.length <= 2 && columns().length == 0), 'readonly': ! $root.isEditing()}">
        <div data-bind="visible: columns().length == 0, css: {'row-fluid': true, 'row-container':true, 'is-editing': $root.isEditing},
          sortable: { template: 'widget-template', data: widgets, allowDrop: enableOozieDrop, isEnabled: enableOozieDrop,
          options: {'opacity': 0.7, 'placeholder': 'row-highlight', 'greedy': true,
              'stop': function(event, ui){},
              'helper': function(event){lastWindowScrollPosition = $(window).scrollTop();  var _par = $('<div>');_par.addClass('card card-widget');var _title = $('<h2>');_title.addClass('card-heading simple');_title.text($(event.toElement).text());_title.appendTo(_par);_par.height(80);_par.width(180);return _par;}},
              dragged: function(widget){widgetDraggedAdditionalHandler(widget)}}">
        </div>
        <div class="container-fluid" data-bind="visible: columns().length > 0">
          <div data-bind="css: {'row-fluid': true, 'row-container':true, 'is-editing': $root.isEditing}">
            <div data-bind="template: { name: 'internal-column-template', foreach: columns}">
            </div>
          </div>
        </div>
      </div>
      <div  data-bind="css: {'span1': true, 'readonly': ! $root.isEditing()}">
        <div data-bind="visible: $root.isEditing() && enableOozieDropOnSide() && !($data.widgets().length > 0 && ['join-widget', 'decision-widget'].indexOf($data.widgets()[0].widgetType()) > -1), css: {'drop-target drop-target-side': true, 'is-editing': $root.isEditing}, droppable: {enabled: $root.isEditing, onDrop: function(){ var _w = $root.addSideDraggedWidget($data, false); widgetDraggedAdditionalHandler(_w); } }"></div>
      </div>
    </div>
  </div>

</script>

<script type="text/html" id="widget-template">
  <div data-bind="attr: {'id': 'wdg_'+ id(),}, css: klass() + (oozieExpanded()?' expanded-widget':''), draggable: {data: $data, isEnabled: true, options: {'handle': '.move-widget', 'opacity': 0.7, 'refreshPositions': true, 'start': function(event, ui){ $root.setCurrentlyDraggedWidget($data, event.toElement); }, 'stop': function(event, ui){ $root.enableSideDrop($data); }, 'helper': function(event){lastWindowScrollPosition = $(window).scrollTop();  var _par = $('<div>');_par.addClass('card card-widget');var _title = $('<h2>');_title.addClass('card-heading simple');_title.text($(event.currentTarget).find('h2').text());_title.appendTo(_par);_par.css('minHeight', '10px');_par.width(120);return _par;}}}">
    <h2 class="card-heading simple" data-bind="visible: widgetType() != 'start-widget' && widgetType() != 'end-widget'  && id() != '17c9c895-5a16-7443-bb81-f34b30b21548'">
      <span data-bind="visible: $root.isEditing() && oozieMovable() && ! oozieExpanded()">
        <a href="javascript:void(0)" class="move-widget"><i class="fa fa-arrows"></i></a>
        &nbsp;
        <a href="javascript:void(0)" class="move-widget clone-widget"><i class="fa fa-copy"></i></a>
        &nbsp;
      </span>


      <!-- ko if: widgetType() == 'hive-widget' -->
      <img src="/oozie/static/art/icon_beeswax_48.png" class="widget-icon">
      <!-- /ko -->

      <!-- ko if: widgetType() == 'hive2-widget' -->
      <img src="/oozie/static/art/icon_beeswax_48.png" class="widget-icon"><sup style="color: #338bb8; margin-left: -4px">2</sup>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'pig-widget' -->
      <img src="/oozie/static/art/icon_pig_48.png" class="widget-icon">
      <!-- /ko -->

      <!-- ko if: widgetType() == 'java-widget' -->
      <a class="widget-icon"><i class="fa fa-file-code-o"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'sqoop-widget' -->
      <img src="/oozie/static/art/icon_sqoop_48.png" class="widget-icon">
      <!-- /ko -->

      <!-- ko if: widgetType() == 'mapreduce-widget' -->
      <a class="widget-icon"><i class="fa fa-file-archive-o"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'subworkflow-widget' -->
      <a class="widget-icon"><i class="fa fa-code-fork"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'shell-widget' -->
      <a class="widget-icon"><i class="fa fa-terminal"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'ssh-widget' -->
      <a class="widget-icon"><i class="fa fa-tty"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'fs-widget' -->
      <a class="widget-icon"><i class="fa fa-file-o"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'email-widget' -->
      <a class="widget-icon"><i class="fa fa-envelope-o"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'streaming-widget' -->
      <a class="widget-icon"><i class="fa fa-exchange"></i></a>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'distcp-widget' -->
      <a class="widget-icon"><i class="fa fa-files-o"></i></a>
      <!-- /ko -->


      <!-- ko if: $root.collection && $root.collection.getFacetById(id()) -->
      <span data-bind="with: $root.collection.getFacetById(id())">
        <span data-bind="editable: label, editableOptions: {enabled: $root.isEditing(), placement: 'right'}"></span>
      </span>
      <!-- /ko -->
      <!-- ko if: typeof $root.collection == 'undefined' || $root.collection.getFacetById(id()) == null -->
        <span data-bind="editable: name, editableOptions: {enabled: $root.isEditing(), placement: 'right'}"></span>
      <!-- /ko -->

      <!-- ko if: widgetType() == 'decision-widget' -->
        <div class="inline pull-right" data-bind="visible: $root.isEditing() && $root.workflow.getNodeById(id()) && $root.workflow.getNodeById(id()).children().length <= 1 && ! oozieExpanded()">
          <a href="javascript:void(0)" data-bind="click: $root.removeWidget"><i class="fa fa-times"></i></a>
        </div>
      <!-- /ko -->
      <!-- ko if: widgetType() != 'decision-widget' -->
        <div class="inline pull-right" data-bind="visible: $root.isEditing() && (['start-widget', 'end-widget', 'fork-widget', 'join-widget'].indexOf(widgetType()) == -1) && ! oozieExpanded()">
          <a href="javascript:void(0)" data-bind="click: $root.removeWidget"><i class="fa fa-times"></i></a>
        </div>
      <!-- /ko -->
      <!-- ko if: oozieExpanded() -->
        <div class="inline pull-right">
          <a href="javascript:void(0)" data-bind="click: toggleProperties"><i class="fa fa-times"></i></a>
        </div>
      <!-- /ko -->
    </h2>
    <div class="card-body" style="padding: 0;">
      <div class="pull-right" data-bind="visible: $root.isEditing() && ! oozieExpanded() && oozieMovable(), click: toggleProperties">
        <div class="advanced-triangle">
          <a href="javascript:void(0)"><i class="fa fa-cogs"></i></a>
        </div>
      </div>
      <div data-bind="template: { name: function() { return widgetType(); }}" class="widget-main-section"></div>
    </div>
  </div>
</script>


<script type="text/html" id="fork-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="min-height: 80px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
    </div>

    <div>
      To:
      <span data-bind="foreach: children">
        <span data-bind="text: $data['to']" /></span>
      </span>
    </div>
    <a class="pointer" data-bind="click: function() { $root.convertToDecision($parent, $data) }">Convert to Decision</a>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="join-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="min-height: 80px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
    </div>

    <div>
      <!-- ko if: children().length == 1 -->
      Then --> <span data-bind="text: children()[0]['to']"></span>
      <!-- /ko -->
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="decision-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="min-height: 80px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
    </div>
    
    <div data-bind="visible: $root.isEditing">
      To:
      <span data-bind="foreach: children">
        <select data-bind="options: $root.workflow.nodeIds,
                     optionsText: function(item) {return $root.workflow.nodeNamesMapping()[item]; },
                     value: $data['to']
                     ">
        </select>      
        if <input data-bind="value: $data['condition']" />
      </span>
      <a>${ _('Jump to another node') } <i class="fa fa-plus"></i></a>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="kill-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="min-height: 40px">
    <div class="big-icon" data-bind="visible: id() == '17c9c895-5a16-7443-bb81-f34b30b21548'"><i class="fa fa-stop"></i></div>

    <div data-bind="visible: $root.isEditing" style="padding: 10px">
      <h6 class="field-title">${ _('Message') }</h6>
      <textarea class="span12" data-bind="value: properties.message" />
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="start-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="min-height: 40px;">
    <div class="big-icon"><i class="fa fa-caret-square-o-down"></i></div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="end-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="min-height: 40px">
    <div class="big-icon"><i class="fa fa-check-square"></i></div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="common-action-properties">
  <div class="properties">
    <h6>${ _('Prepare') }</h6>
    <ul data-bind="visible: properties.prepares().length > 0, foreach: properties.prepares" class="unstyled">
      <li>
        <div style="display: inline-block; width: 60px" data-bind="text: type"></div>
        <input type="text" data-bind="value: value"/>
        <a href="#" data-bind="click: function(){ $parent.properties.prepares.remove(this);$(document).trigger('drawArrows') }">
          <i class="fa fa-minus"></i>
        </a>
      </li>
    </ul>
    <a class="pointer" data-bind="click: function(){ properties.prepares.push({'type': 'mkdir', 'value': ''});$(document).trigger('drawArrows') }">${ _('Directory') } <i class="fa fa-plus"></i></a>
    <a class="pointer" data-bind="click: function(){ properties.prepares.push({'type': 'delete', 'value': ''});$(document).trigger('drawArrows') }">${ _('Delete') } <i class="fa fa-plus"></i></a>

    <h6>${ _('Job XML') }</h6>
    <input type="text" class="input-xlarge filechooser-input" data-bind="filechooser: properties.job_xml"/>

    <h6><a class="pointer" data-bind="click: function(){ properties.job_properties.push({'name': '', 'value': ''});$(document).trigger('drawArrows') }">${ _('Properties') } <i class="fa fa-plus"></i></a></h6>
    <ul data-bind="visible: properties.job_properties().length > 0, foreach: properties.job_properties" class="unstyled">
      <li>
        <input data-bind="value: name"/>
        <input data-bind="value: value"/>
        <a href="#" data-bind="click: function(){ $parent.properties.job_properties.remove(this);$(document).trigger('drawArrows') }">
          <i class="fa fa-minus"></i>
        </a>
      </li>
    </ul>
    <em data-bind="visible: properties.job_properties().length == 0">${ _('No properties defined.') }</em>

    <h6><a class="pointer" data-bind="click: function(){ properties.archives.push({'name': ''});$(document).trigger('drawArrows') }">${ _('Archives') } <i class="fa fa-plus"></i></a></h6>
    <ul data-bind="visible: properties.archives().length > 0, foreach: properties.archives" class="unstyled">
      <li>
        <input data-bind="value: name"/>
        <a href="#" data-bind="click: function(){ $parent.properties.archives.remove(this);$(document).trigger('drawArrows') }">
          <i class="fa fa-minus"></i>
        </a>
      </li>
    </ul>
    <em data-bind="visible: properties.archives().length == 0">${ _('No archives defined.') }</em>
  </div>
</script>


<script type="text/html" id="common-properties-arguments">
  <h6><a class="pointer" data-bind="click: function(){ properties.arguments.push({'value': ''});$(document).trigger('drawArrows') }">${ _('Arguments') } <i class="fa fa-plus"></i></a></h6>
  <ul class="unstyled" data-bind="visible: properties.arguments().length > 0, foreach: properties.arguments">
    <li>
      <input type="text" class="span11" data-bind="value: value"/>
      <a href="#" data-bind="click: function(){ $parent.properties.arguments.remove(this);$(document).trigger('drawArrows') }">
        <i class="fa fa-minus"></i>
      </a>
    </li>
  </ul>
  <em data-bind="visible: properties.arguments().length == 0">${ _('No arguments defined.') }</em>
</script>


<script type="text/html" id="common-properties-files">
  <h6><a class="pointer" data-bind="click: function(){ properties.files.push({'value': ''});$(document).trigger('drawArrows') }">${ _('Files') } <i class="fa fa-plus"></i></a></h6>
  <ul class="unstyled" data-bind="foreach: properties.files">
    <li style="margin-bottom: 3px">
      <input type="text" class="span9 filechooser-input" data-bind="filechooser: value"/>
      <a href="#" data-bind="click: function(){ $parent.properties.files.remove(this);$(document).trigger('drawArrows') }">
        <i class="fa fa-minus"></i>
      </a>
    </li>
  </ul>
</script>


<script type="text/html" id="common-properties-parameters">
  <h6><a class="pointer" data-bind="click: function(){ properties.parameters.push({'value': ''}); $(document).trigger('drawArrows')}">${ _('Parameters') } <i class="fa fa-plus"></i></a></h6>
  <ul class="unstyled" data-bind="foreach: properties.parameters">
    <li style="margin-bottom: 3px">
      <input type="text" class="span11" data-bind="value: value"/>
      <a href="#" data-bind="click: function(){ $parent.properties.parameters.remove(this);$(document).trigger('drawArrows') }">
        <i class="fa fa-minus"></i>
      </a>
    </li>
  </ul>
</script>


<script type="text/html" id="common-action-transition">
  <!-- ko if: children().length == 2 -->
  OK -->
  <select data-bind="options: $root.workflow.nodeIds,
                     optionsText: function(item) {return $root.workflow.nodeNamesMapping()[item]; },
                     value: children()[0]['to']
                     ">
  </select>
  <br/>
  KO -->
  <select data-bind="options: $root.workflow.nodeIds,
                     optionsText: function(item) {return $root.workflow.nodeNamesMapping()[item]; },
                     value: children()[1]['error']
                     ">
  </select>
  <!-- /ko -->
</script>


<script type="text/html" id="common-action-credentials">
  <em data-bind="visible: $root.credentials() == null || $root.credentials().length == 0">${ _('No available credentials.') }</em>
  <select data-bind="visible: $root.credentials() != null && $root.credentials().length > 0, options: $root.credentials, value: properties.credentials" size="5" multiple="true"></select>
</script>


<script type="text/html" id="common-action-sla">
    <div data-bind="with: properties">
      ${ utils.slaForm() }
    </div>
  </div>
</script>



<script type="text/html" id="hive-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.script_path.label"></span>
        <input type="text" data-bind="value: properties.script_path" />
        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-parameters' }"></div>
        </div>
      </div>
    </div>


    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="template: { name: 'common-action-properties' }"></span>
          <br/>
          <br/>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="hive2-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.script_path.label"></span>
        <input type="text" data-bind="value: properties.script_path" />
        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-parameters' }"></div>
        </div>
      </div>
    </div>


    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="text: $root.workflow_properties.jdbc_url.label"></span>
          <input type="text" data-bind="value: properties.jdbc_url" />                    
          <br/>
          <span data-bind="text: $root.workflow_properties.password.label"></span>
          <input type="text" data-bind="value: properties.password" />                    
          <br/>        
          <span data-bind="template: { name: 'common-action-properties' }"></span>
          <br/>
          <br/>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="pig-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">

    <div data-bind="visible: ! $root.isEditing()">
      <span data-bind="text: $root.workflow_properties.script_path.label"></span>
      <strong data-bind="text: properties.script_path"></strong>
    </div>

    <div data-bind="visible: $root.isEditing">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.script_path.label"></span>
        <input type="text" data-bind="value: properties.script_path" />

        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-parameters' }"></div>
          <div class="span6" data-bind="template: { name: 'common-properties-files' }"></div>
        </div>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="template: { name: 'common-properties-arguments' }"></span>
          <br/>        
          <span data-bind="template: { name: 'common-action-properties' }"></span>          
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="java-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.jar_path.label"></span>          
        <input type="text" data-bind="value: properties.jar_path" />
        <br/>
        <span data-bind="text: $root.workflow_properties.main_class.label"></span>
        <input type="text" data-bind="value: properties.main_class" />

        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-parameters' }"></div>
          <div class="span6" data-bind="template: { name: 'common-properties-files' }"></div>
        </div>

      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="text: $root.workflow_properties.java_opts.label"></span>
          <ul data-bind="foreach: properties.java_opts">
            <li>
              <input data-bind="value: value"/>
              <a href="#" data-bind="click: function(){ $parent.properties.java_opts.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.java_opts.push({'value': ''}); }">
            <i class="fa fa-plus"></i>
          </button>        
          <br/>
          <span data-bind="text: $root.workflow_properties.capture_output.label"></span>
          <input type="text" data-bind="value: properties.capture_output" />
          <br/>

          <span data-bind="template: { name: 'common-action-properties' }"></span>
          <br/>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="sqoop-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.command.label"></span>
        <input type="text" data-bind="value: properties.command" />
        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-parameters' }"></div>
        </div>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="template: { name: 'common-action-properties' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="mapreduce-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.jar_path.label"></span>
        <input type="text" data-bind="value: properties.jar_path" />
        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-parameters' }"></div>
        </div>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="template: { name: 'common-action-properties' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="subworkflow-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <select data-bind="options: $root.addActionWorkflows, optionsText: 'name', value: properties.selectedSubWorkflow"></select>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="template: { name: 'common-action-properties' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="mapreduce-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.jar_path.label"></span>
        <input type="text" data-bind="value: properties.jar_path" />
        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-parameters' }"></div>
        </div>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="template: { name: 'common-action-properties' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="shell-widget">22
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.shell_command.label"></span>
        <input type="text" data-bind="value: properties.shell_command" />
        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-arguments' }"></div>
        </div>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="text: $root.workflow_properties.capture_output.label"></span>
          <input type="checkbox" data-bind="checked: properties.capture_output" />
          <br/>
          <span data-bind="text: $root.workflow_properties.env_var.label"></span>
          <ul data-bind="foreach: properties.env_var">
            <li>
              <input data-bind="value: value"/>
              <a href="#" data-bind="click: function(){ $parent.properties.env_var.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.env_var.push({'value': ''}); }">
            <i class="fa fa-plus"></i>
          </button>           
          <br/>
          <span data-bind="template: { name: 'common-action-properties' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="ssh-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <input type="text" data-bind="value: id" />
      <input type="text" data-bind="value: name" />
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.host.label"></span>
        <input type="text" data-bind="value: properties.host" />
        <br/>
        <span data-bind="text: $root.workflow_properties.ssh_command.label"></span>
        <input type="text" data-bind="value: properties.ssh_command" />
        <div class="row-fluid">
          <div class="span6" data-bind="template: { name: 'common-properties-arguments' }"></div>
        </div>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="text: $root.workflow_properties.capture_output.label"></span>
          <input type="checkbox" data-bind="checked: properties.capture_output" />
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="fs-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.deletes.label"></span>
          <ul data-bind="foreach: properties.deletes">
            <li>
              <input data-bind="value: value"/>
              <a href="#" data-bind="click: function(){ $parent.properties.deletes.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.deletes.push({'value': ''}); }">
            <i class="fa fa-plus"></i>
          </button>

          <br/>

          <span data-bind="text: $root.workflow_properties.mkdirs.label"></span>
          <ul data-bind="foreach: properties.mkdirs">
            <li>
              <input data-bind="value: value"/>
              <a href="#" data-bind="click: function(){ $parent.properties.mkdirs.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.mkdirs.push({'value': ''}); }">
            <i class="fa fa-plus"></i>
          </button>

          <br/>

          <span data-bind="text: $root.workflow_properties.touchzs.label"></span>
          <ul data-bind="foreach: properties.touchzs">
            <li>
              <input data-bind="value: value"/>
              <a href="#" data-bind="click: function(){ $parent.properties.touchzs.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.touchzs.push({'value': ''}); }">
            <i class="fa fa-plus"></i>
          </button>

          <br/>

          <span data-bind="text: $root.workflow_properties.moves.label"></span>
          <ul data-bind="foreach: properties.moves">
            <li>
              <input data-bind="value: source"/>
              <input data-bind="value: target"/>
              <a href="#" data-bind="click: function(){ $parent.properties.moves.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.moves.push({'source': '', 'target': ''}); }">
            <i class="fa fa-plus"></i>
          </button>

          <br/>

          <span data-bind="text: $root.workflow_properties.chmods.label"></span>
          <span data-bind="text: $root.workflow_properties.chmods.label"></span>
          <ul data-bind="foreach: properties.chmods">
            <li>
              ${ _('Path') }
              <input data-bind="value: value"/>
              ${ _('Permissions') }
              <input data-bind="value: permissions"/>
              ${ _('Also apply to files') }
              <input type="checkbox" data-bind="value: dir_files"/>
              ${ _('Recursive') }
              <input type="checkbox" data-bind="value: recursive"/>
              <a href="#" data-bind="click: function(){ $parent.properties.chmods.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.chmods.push({'value': '', 'permissions': '600', 'dir_files': true, 'recursive': false}); }">
            <i class="fa fa-plus"></i>
          </button>

          <br/>

          <span data-bind="text: $root.workflow_properties.chgrps.label"></span>
          <ul data-bind="foreach: properties.chgrps">
            <li>
              ${ _('Path') }
              <input data-bind="value: value"/>
              ${ _('Group') }
              <input data-bind="value: group"/>
              ${ _('Also apply to files') }
              <input type="checkbox" data-bind="value: dir_files"/>
              ${ _('Recursive') }
              <input type="checkbox" data-bind="value: recursive"/>
              <a href="#" data-bind="click: function(){ $parent.properties.chgrps.remove(this); }">
                <i class="fa fa-minus"></i>
              </a>
            </li>
          </ul>
          <button data-bind="click: function(){ properties.chmods.push({'value': '', 'group': 'mygroup', 'dir_files': false, 'recursive': false}); }">
            <i class="fa fa-plus"></i>
          </button>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="email-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.to.label"></span>
        <input type="text" data-bind="value: properties.to" />
        <br/>
        <span data-bind="text: $root.workflow_properties.subject.label"></span>
        <input type="text" data-bind="value: properties.subject" />
        <br/>
        <span data-bind="text: $root.workflow_properties.body.label"></span>
        <input type="text" data-bind="value: properties.body" />
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="text: $root.workflow_properties.cc.label"></span>
          <input type="text" data-bind="value: properties.cc" />        
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="streaming-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.mapper.label"></span>
        <input type="text" data-bind="value: properties.mapper" />
        <br/>
        <span data-bind="text: $root.workflow_properties.reducer.label"></span>
        <input type="text" data-bind="value: properties.reducer" />
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
          <span data-bind="template: { name: 'common-action-properties' }"></span>       
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<script type="text/html" id="distcp-widget">
  <!-- ko if: $root.workflow.getNodeById(id()) -->
  <div class="row-fluid" data-bind="with: $root.workflow.getNodeById(id())" style="padding: 10px">
    <div data-bind="visible: $root.isEditing" style="margin-bottom: 20px">
      <div data-bind="visible: ! $parent.oozieExpanded()">
        <span data-bind="text: $root.workflow_properties.distcp_parameters.label"></span>
        <ul data-bind="foreach: properties.distcp_parameters">
          <li>
            <input data-bind="value: value"/>
            <a href="#" data-bind="click: function(){ $parent.properties.distcp_parameters.remove(this); }">
              <i class="fa fa-minus"></i>
            </a>
          </li>
        </ul>
        <button data-bind="click: function(){ properties.distcp_parameters.push({'value': ''}); }">
          <i class="fa fa-plus"></i>
        </button>
      </div>
    </div>

    <div data-bind="visible: $parent.oozieExpanded">
      <ul class="nav nav-tabs">
        <li class="active"><a data-bind="attr: { href: '#properties-' + id()}" data-toggle="tab">${ _('Properties') }</a></li>
        <li><a data-bind="attr: { href: '#sla-' + id()}" href="#sla" data-toggle="tab">${ _('SLA') }</a></li>
        <li><a data-bind="attr: { href: '#credentials-' + id()}" data-toggle="tab">${ _('Credentials') }</a></li>
        <li><a data-bind="attr: { href: '#transitions-' + id()}" data-toggle="tab">${ _('Transitions') }</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" data-bind="attr: { id: 'properties-' + id() }">
		  ${ _('Prepare') }
		  <ul data-bind="foreach: properties.prepares">
		    <li>
		      <span data-bind="text: type"></span>
		      <input data-bind="value: value"/>
		      <a href="#" data-bind="click: function(){ $parent.properties.prepares.remove(this); }">
		        <i class="fa fa-minus"></i>
		      </a>
		    </li>
		  </ul>
		  <button data-bind="click: function(){ properties.prepares.push({'type': 'mkdir', 'value': ''}); }">
		    ${ _('Directory') } <i class="fa fa-plus"></i>
		  </button>
		  <button data-bind="click: function(){ properties.prepares.push({'type': 'delete', 'value': ''}); }">
		    ${ _('Delete') } <i class="fa fa-plus"></i>
		  </button>
		  <br/>
		  ${ _('Properties') }
		  <ul data-bind="foreach: properties.job_properties">
		    <li>
		      <input data-bind="value: name"/>
		      <input data-bind="value: value"/>
		      <a href="#" data-bind="click: function(){ $parent.properties.job_properties.remove(this); }">
		        <i class="fa fa-minus"></i>
		      </a>
		    </li>
		  </ul>
		  <button data-bind="click: function(){ properties.job_properties.push({'name': '', 'value': ''}); }">
		    <i class="fa fa-plus"></i>
		  </button>
		  <br/>
          <span data-bind="text: $root.workflow_properties.java_opts.label"></span>
          <input type="text" data-bind="value: properties.java_opts" />
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'sla-' + id() }">
          <span data-bind="template: { name: 'common-action-sla' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'credentials-' + id() }">
          <span data-bind="template: { name: 'common-action-credentials' }"></span>
        </div>

        <div class="tab-pane" data-bind="attr: { id: 'transitions-' + id() }">
          <span data-bind="template: { name: 'common-action-transition' }"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- /ko -->
</script>


<div id="addActionDemiModal" class="demi-modal demi-modal-half hide fade" data-backdrop="false">
  <div class="modal-body">
    <a href="javascript: void(0)" data-dismiss="modal" data-bind="click: addActionDemiModalFieldCancel" class="pull-right"><i class="fa fa-times"></i></a>

    <table data-bind="foreach: addActionProperties">
      <tr>
        <td data-bind="text: label" style="width: 1%; padding-right: 10px" class="no-wrap"></td>
        <td><input data-bind="value: value"/></td>
      </tr>
    </table>

    <!-- ko if: addActionWorkflows().length > 0 -->
      <select data-bind="options: addActionWorkflows, optionsText: 'name', value: selectedSubWorkflow"></select>
    <!-- /ko -->

    <br/>
    <a class="btn btn-primary disable-feedback" data-bind="click: addActionDemiModalFieldPreview">
      ${ _('Add') }
    </a>
  </div>
</div>

<div id="settingsModal" class="modal fade hide" data-backdrop="false">
  <div class="modal-header" style="padding-bottom: 2px">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">${ _('Workflow Settings') }</h3>
  </div>
  <div class="modal-body">
      <h4>${ _('Oozie Parameters') }</h4>
      <ul data-bind="foreach: $root.workflow.properties.parameters" class="unstyled">
        <li>
          <input data-bind="value: name"/>
          <input data-bind="value: value"/>
          <a href="#" data-bind="click: function(){ $root.workflow.properties.parameters.remove(this); }">
            <i class="fa fa-minus"></i>
          </a>
        </li>
      </ul>
      <a class="pointer" data-bind="click: function(){ $root.workflow.properties.parameters.push({'name': '', 'value': ''}); }">
        <i class="fa fa-plus"></i> ${ _('Add parameter') }
      </a>

      <h4>${_("Workspace")}</h4>
      <input type="text" class="input-xlarge filechooser-input" data-bind="filechooser: $root.workflow.properties.deployment_dir"/>

	    <h4>${ _('Hadoop Properties') }</h4>
      <ul data-bind="foreach: $root.workflow.properties.properties" class="unstyled">
        <li>
          <input data-bind="value: name"/>
          <input data-bind="value: value"/>
          <a href="#" data-bind="click: function(){ $root.workflow.properties.properties.remove(this); }">
            <i class="fa fa-minus"></i>
          </a>
        </li>
      </ul>
      <a class="pointer"  data-bind="click: function(){ $root.workflow.properties.properties.push({'name': '', 'value': ''}); }">
        <i class="fa fa-plus"></i> ${ _('Add property') }
      </a>

      <h4>${ _("Job XML") }</h4>
      <input type="text" class="input-xlarge filechooser-input" data-bind="filechooser: $root.workflow.properties.job_xml"/>

      <h4>${ _('SLA Configuration') }</h4>
      <div class="sla-form" data-bind="with: $root.workflow.properties">
        ${ utils.slaForm() }
      </div>
  </div>
</div>


<div id="submit-wf-modal" class="modal hide"></div>

<div id="chooseFile" class="modal hide fade">
  <div class="modal-header">
      <a href="#" class="close" data-dismiss="modal">&times;</a>
      <h3>${_('Choose a file')}</h3>
  </div>
  <div class="modal-body">
      <div id="filechooser">
      </div>
  </div>
  <div class="modal-footer">
  </div>
</div>



<div id="exposeOverlay"></div>

<link rel="stylesheet" href="/static/ext/css/hue-filetypes.css">
<link rel="stylesheet" href="/static/ext/css/hue-charts.css">
<link rel="stylesheet" href="/static/ext/chosen/chosen.min.css">
<link rel="stylesheet" href="/oozie/static/css/workflow-editor.css">


${ dashboard.import_layout() }


<script src="/static/ext/js/bootstrap-editable.min.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/js/hue.utils.js"></script>
<script src="/static/js/ko.editable.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/ext/chosen/chosen.jquery.min.js" type="text/javascript" charset="utf-8"></script>

${ dashboard.import_bindings() }

<script src="/oozie/static/js/workflow-editor.ko.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/ext/js/jquery/plugins/jquery.curvedarrow.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript">
  ${ utils.slaGlobal() }

  var viewModel = new WorkflowEditorViewModel(${ layout_json | n,unicode }, ${ workflow_json | n,unicode }, ${ credentials_json | n,unicode }, ${ workflow_properties_json | n,unicode });
  ko.applyBindings(viewModel);

  viewModel.init();
  fullLayout(viewModel);

  function columnDropAdditionalHandler(widget) {
    widgetDraggedAdditionalHandler(widget);
  }

  function widgetDraggedAdditionalHandler(widget) {
    $("canvas").remove();
    if (viewModel.currentlyDraggedWidget() && viewModel.currentlyDraggedWidget().id() == ""){
      viewModel.workflow.newNode(widget);
      showAddActionDemiModal(widget);
    }
    else {
      if (viewModel.currentlyDraggedOp() == "move"){
        viewModel.workflow.moveNode(widget);
      }
      else {
        viewModel.workflow.newNode(widget, viewModel.workflow.addNode);
      }
      $(document).trigger("drawArrows");
    }
  }


  $(document).on("showSubmitPopup", function(event, data){
    $('#submit-wf-modal').html(data);
    $('#submit-wf-modal').modal('show');
  });


  var newAction = null;

  function showAddActionDemiModal(widget) {
    newAction = widget;
    $("#exposeOverlay").fadeIn(300);
    $("#wdg_" + widget.id()).css("zIndex", "1032");
    $("#addActionDemiModal").modal("show");
  }

  function addActionDemiModalFieldPreview(field) {
    if (newAction != null) {
      viewModel.workflow.addNode(newAction);
      $("#addActionDemiModal").modal("hide");
      $("#wdg_" + newAction.id()).css("zIndex", "0");
      $("#exposeOverlay").fadeOut(300);
    }
  }

  function addActionDemiModalFieldCancel() {
    $("#exposeOverlay").fadeOut(300);
    viewModel.removeWidgetById(newAction.id());
  }

  function linkWidgets(fromId, toId) {
    var _from = $("#wdg_" + (typeof fromId == "function" ? fromId() : fromId));
    var _to = $("#wdg_" + (typeof toId == "function" ? toId() : toId));

    var _fromCenter = {
      x: _from.position().left + _from.outerWidth() / 2,
      y: _from.position().top + _from.outerHeight() + 3
    }

    var _toCenter = {
      x: _to.position().left + _to.outerWidth() / 2,
      y: _to.position().top - 5
    }

    var _curveCoords = {};

    if (_fromCenter.x == _toCenter.x) {
      _curveCoords.x = _fromCenter.x;
      _curveCoords.y = _fromCenter.y + (_toCenter.y - _fromCenter.y) / 2;
    }
    else {
      if (_fromCenter.x > _toCenter.x) {
        _fromCenter.x = _fromCenter.x - 5;
        _toCenter.x = _toCenter.x + 5;
      }
      else {
        _fromCenter.x = _fromCenter.x + 5;
        _toCenter.x = _toCenter.x - 5;
      }
      _curveCoords.x = _fromCenter.x - (_fromCenter.x - _toCenter.x) / 4;
      _curveCoords.y = _fromCenter.y + (_toCenter.y - _fromCenter.y) / 2;
    }

    $(document.body).curvedArrow({
      p0x: _fromCenter.x,
      p0y: _fromCenter.y,
      p1x: _curveCoords.x,
      p1y: _curveCoords.y,
      p2x: _toCenter.x,
      p2y: _toCenter.y,
      lineWidth: 2,
      size: 10,
      strokeStyle: viewModel.isEditing()?'#e5e5e5':'#dddddd'
    });

  }

  function drawArrows(){
    $("canvas").remove();
    if (viewModel.columns()[0].rows().length > 3){
      var _links = viewModel.workflow.linkMapping();
      Object.keys(_links).forEach(function(id){
        if (_links[id].length > 0){
          _links[id].forEach(function(nextId){
            linkWidgets(id, nextId);
          });
        }
      });
    }
  }

  var _linkMappingTimeout = -1;
  $(document).on("drawArrows", function(){
    window.clearTimeout(_linkMappingTimeout);
    _linkMappingTimeout = window.setTimeout(renderChangeables, 25);
  });

  $(document).on("editingToggled", function(){
    $("canvas").remove();
    window.setTimeout(renderChangeables, 100);
  });

  function resizeDrops() {
    $(".drop-target-side").each(function () {
      var _el = $(this);
      _el.height(0);
      window.setTimeout(function(){
        _el.height(_el.parent().parent().innerHeight() - 12);
      }, 20);
    });
  }

  function renderChangeables() {
    resizeDrops();
    drawArrows();
  }

  var lastSeenPosition = null;
  var lastExpandedWidget = null;
  function toggleProperties(widget) {
    if (widget.oozieMovable()) {
      var _el = $("#wdg_" + widget.id());
      if (!widget.oozieExpanded()) {
        lastExpandedWidget = widget;
        _el.css("z-index", "1032");
        lastSeenPosition = _el.position();
        var _width = _el.width();

        _el.css("position", "absolute");
        _el.css({
          "top": (lastSeenPosition.top) + "px",
          "left": lastSeenPosition.left + "px",
          "width": _width
        });
        _el.animate({
          "width": _width < $(window).width()/2 ? $(window).width()/2 : _width
        }, 200, function () {
          if ($(document).width() > $(window).width()) {
            $(document).scrollLeft($(document).width() - $(window).width());
          }
        });
        _el.find(".prop-editor").show();

        $("#exposeOverlay").fadeIn(300);
        widget.oozieExpanded(!widget.oozieExpanded());
      }
      else {
        $("#exposeOverlay").click();
      }
    }
  }

  $(document).ready(function(){
    renderChangeables();

    $("#exposeOverlay").on("click", function (e) {
      if (lastExpandedWidget) {
        var _el = $("#wdg_" + lastExpandedWidget.id());
        _el.css("position", "initial");
        _el.find(".prop-editor").hide();
        _el.css({
          "top": "",
          "left": "",
          "width": "",
          "margin-top": "",
          "margin-left": "",
          "height": ""
        });
        lastExpandedWidget.oozieExpanded(false);
      }
      $("#exposeOverlay").fadeOut(300);
      $(document).trigger("drawArrows");
    });

    $(document).keyup(function(e) {
      if (e.keyCode == 27) {
        $("#exposeOverlay").click();
        addActionDemiModalFieldCancel();
        $("#addActionDemiModal").modal("hide");
      }
    });

    var resizeTimeout = -1;
    $(window).on("resize", function () {
      window.clearTimeout(resizeTimeout);
      resizeTimeout = window.setTimeout(function () {
        renderChangeables();
      }, 200);
    });

  });

</script>

${ commonfooter(messages) | n,unicode }
