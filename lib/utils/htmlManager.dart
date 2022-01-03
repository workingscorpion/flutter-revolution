import 'package:flutter/material.dart';

class HTMLManager {
  static final padding = EdgeInsets.only(
    top: 10,
    left: 25,
    right: 25,
    bottom: 100,
  );

  static String toHTML(String contents) {
    return '''<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

  <style>
    body {
      padding: ${padding.top}px ${padding.right}px ${padding.bottom}px ${padding.left}px;
    }
    img {
      max-width: 100%;
    }
  </style>
</head>

<body>
  <div class="summernote">
    <div class="note-editor">
      <div class="note-editing-area">
        <div class="note-editable">
          <div>
          $contents
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>''';
  }
}
