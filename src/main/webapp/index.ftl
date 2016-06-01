<!DOCTYPE html><!--[if lt IE 9]>
<html class="no-js lt-ie9" lang="en"
      dir="ltr"><![endif]--><!--[if gt IE 8]><!-->
<html class="no-js" lang="en" dir="ltr" xmlns="http://www.w3.org/1999/html">
<!--<![endif]-->
<head>
  <meta charset="utf-8">
  <!-- Web Experience Toolkit (WET) / Boîte à outils de l'expérience Web (BOEW)
  wet-boew.github.io/beacon/wet-boew/License-en.html / wet-boew.github.io/beacon/wet-boew/Licence-fr.html -->
  <title>CANFAR - VOSpace</title>
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <!-- Meta data -->
  <meta name="description"
        content="Web Experience Toolkit (WET) includes reusable components for building and maintaining innovative Web sites that are accessible, usable, and interoperable. These reusable components are open source software and free for use by departments and external Web communities">
  <meta name="dcterms.title"
        content="Government of Canada Web Usability theme - Web Experience Toolkit">
  <meta name="dcterms.creator"
        content="French name of the content author / Nom en français de l'auteur du contenu">
  <meta name="dcterms.issued" title="W3CDTF"
        content="Date published (YYYY-MM-DD) / Date de publication (AAAA-MM-JJ)">
  <meta name="dcterms.modified" title="W3CDTF"
        content="Date modified (YYYY-MM-DD) / Date de modification (AAAA-MM-JJ)">
  <meta name="dcterms.subject" title="scheme"
        content="French subject terms / Termes de sujet en français">
  <meta name="dcterms.language" title="ISO639-2" content="eng">
  <!-- Meta data-->
  <!--[if gte IE 9 | !IE ]><!-->
  <link href="/beacon/theme-gcwu-fegc/assets/favicon.ico" rel="icon"
        type="image/x-icon">
  <link rel="stylesheet" href="/beacon/theme-gcwu-fegc/css/theme.min.css">
  <!--<![endif]-->
  <!--[if lt IE 9]>
  <link href="/beacon/theme-gcwu-fegc/assets/favicon.ico" rel="shortcut icon"/>
  <link rel="stylesheet" href="/beacon/theme-gcwu-fegc/css/ie8-theme.min.css"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
  <script src="/beacon/wet-boew/js/ie8-wet-boew.min.js"></script>
  <![endif]-->
  <!-- Custom CSS -->
  <link rel="stylesheet" href="/beacon/css/datatables.css"/>

  <style type="text/css">
    body {
      background: #d9e6f4 !important;
    }

    .public_link {
      font-style: italic;
    }

    #uploader {
      display: block;
      text-align: right;
      height: auto;
      min-height: 30px;
      overflow: hidden;
    }

    #loading-wrap {
      position: fixed;
      height: 100%;
      width: 100%;
      overflow: hidden;
      top: 0;
      left: 0;
      display: block;
      background: white url('/beacon/themes/gcwu-fegc/images/ajax-loader.gif') no-repeat center center;
      z-index: 999;
      opacity: 0.7;
    }

    main.container {
      background: transparent !important;
    }

    .container {
      width: auto !important;
    }
  </style>

  <noscript>
    <link rel="stylesheet" href="/beacon/wet-boew/css/noscript.min.css"/>
  </noscript>
</head>
<body vocab="http://schema.org/" typeof="WebPage">
<ul id="wb-tphp">
  <li class="wb-slc">
    <a class="wb-sl" href="#wb-cont">Skip to main content</a>
  </li>
  <li class="wb-slc visible-sm visible-md visible-lg">
    <a class="wb-sl" href="#wb-info">Skip to "About this site"</a>
  </li>
</ul>

<div class="mrgn-tp-md mrgn-lft-md mrgn-bttm-0">
<#include "_login.ftl">
</div>

<#include "_main.ftl">

<!--[if gte IE 9 | !IE ]><!-->
<script src="/beacon/wet-boew/js/jquery/2.1.4/jquery.min.js"></script>
<script src="/beacon/wet-boew/js/wet-boew.min.js"></script>
<!--<![endif]-->
<!--[if lt IE 9]>
<script src="/beacon/wet-boew/js/ie8-wet-boew2.min.js"></script>

<![endif]-->
<script src="/beacon/theme-gcwu-fegc/js/theme.min.js"></script>

<script type="text/javascript" src="/beacon/js/cadc.util.js"></script>
<script type="text/javascript" src="/beacon/js/cadc.uri.js"></script>
<script type="text/javascript" src="/beacon/js/datatables.js"></script>
<script type="text/javascript" src="/beacon/js/jquery.csv-0.71.min.js"></script>
<script type="text/javascript" src="/beacon/js/jquery-browser.js"></script>
<script type="text/javascript" src="/beacon/js/jquery.form-3.24.js"></script>
<!--<script type="text/javascript" src="./js/jquery.splitter/jquery.splitter-1.5.1.js"></script>-->
<!--<script type="text/javascript" src="./js/jquery.filetree/jqueryFileTree.js"></script>-->
<script type="text/javascript"
        src="/beacon/js/jquery.contextmenu/jquery.contextMenu-1.01.js"></script>
<script type="text/javascript"
        src="/beacon/js/jquery.tablesorter-2.7.2.min.js"></script>
<script type="text/javascript" src="/beacon/js/jquery.impromptu-3.2.min.js"></script>
<script type="text/javascript" src="/beacon/js/filemanager.js"></script>

<script type="text/javascript">

  var lockedIcon =
      "<span class=\"glyphicon glyphicon-lock\"></span> <a href=\"/beacon/unlock\" title=\"Unlock to modify.\">Unlock</a>";
  var publicLink =
      "<a href=\"#\" class=\"public_link\" title=\"Change group read access.\">Public</a>";
  var stringUtil = new cadc.web.util.StringUtil(publicLink);
  var startURI = "<#if startURI??>${startURI}</#if>";
  var url = "/beacon/page${folder.path}";
  var defaultPageSize = 400;

  var requestData = {};

  requestData.pageSize = defaultPageSize;

  if (startURI != "")
  {
    requestData.startURI = encodeURIComponent(startURI);
  }

  $(document).ready(function ()
                    {
                      // Override CSS for search filter field.
                      $.fn.DataTable.ext.oStdClasses.sFilter =
                          "dataTables_filter mrgn-lft-md mrgn-tp-md";
                      var $beaconTable = $("#beacon");

                      var $dt = $beaconTable.DataTable({
                                     loading: true,
                                     processing: true,
                                     deferRender: true,
                                     scrollY: "615px",
                                     lengthChange: false,
                                     scrollCollapse: true,
                                     scroller: true,
                                     columnDefs: [
                                       {
                                         "targets": 0,
                                         "orderable": false,
                                         "className": 'select-checkbox',
                                         "searchable": false,
                                         "render": function (data, type, full, meta)
                                         {
                                           var renderedValue;

                                           if (full.length > 6)
                                           {
                                             var lockedFlag =
                                                 (full[7] === "true");

                                             renderedValue =
                                                 lockedFlag ? lockedIcon : data;
                                           }
                                           else
                                           {
                                             renderedValue = data;
                                           }

                                           return renderedValue;
                                         }
                                       },
                                       {
                                         "targets": 1,
                                         "render": function (data, type, full, meta)
                                         {
                                           if (full.length > 9)
                                           {
                                             var path = full[9];
                                             return '<span class="glyphicon '
                                                    + ((full[8] == 'ContainerNode')
                                                     ? 'glyphicon-folder-open'
                                                     : 'glyphicon-cloud-download')
                                                    + '"></span> <a href="/beacon/list'
                                                    + path + '" title=""> '
                                                    + data + '</a>';
                                           }
                                           else
                                           {
                                             return data;
                                           }
                                         }
                                       },
                                       {
                                         "targets": 4,
                                         "searchable": false,
                                         "render": function (data, type, full, meta)
                                         {
                                           var renderedValue;

                                           if (full.length > 9)
                                           {
                                             var publicFlag =
                                                 (full[6] === "true");
                                             var path = full[9];

                                             if (publicFlag === true)
                                             {
                                               renderedValue =
                                                   stringUtil.format(path);
                                             }
                                             else
                                             {
                                               renderedValue = data;
                                             }
                                           }
                                           else
                                           {
                                             renderedValue = data;
                                           }

                                           return renderedValue;
                                         }
                                       },
                                       {
                                         "targets": [2, 3, 5],
                                         "searchable": false
                                       }
                                     ],
                                     select:
                                     {
                                       style: 'os',
                                       selector: 'td:first-child'
                                     },
                                     order: [[5, 'desc']]
                                   });

                      var successCallback = function (csvData)
                      {
                        var data = $.csv.toArrays(csvData);

                        if (data.length > 0)
                        {
                          for (var di = 0, dl = data.length; di < dl; di++)
                          {
                            var nextRow = data[di];
                            $dt.row.add(nextRow);

                            startURI = nextRow[10];
                          }

                          $dt.draw();

                          requestData.startURI = startURI;
                          getPage(requestData, successCallback);
                        }
                      };

                      load(successCallback);
                    });

  function load(_callback)
  {
    getPage(requestData, _callback);
  }

  function getPage(_data, _callback)
  {
    $.get({
            url: url,
            dataType: "text",
            data: _data
          })
        .done(function(csvData)
              {
                _callback(csvData);
              });
  }
</script>

</body>
</html>
