import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const List<IconData> iconData = <IconData>[
  Icons.auto_graph_outlined,
  Icons.bar_chart,
  Icons.pie_chart,
  CupertinoIcons.chart_bar_circle,
  CupertinoIcons.chart_pie,
  CupertinoIcons.doc_chart,
];

IconData getAttachmenticon(String type) {
  switch (type) {
    case 'pdf':
      return MdiIcons.filePdfBox;
    case 'jpg':
      return MdiIcons.image;
    case 'png':
      return MdiIcons.image;
    case 'xls':
      return MdiIcons.fileExcel;
    case 'doc':
      return MdiIcons.microsoftWord;
    case 'docx':
      return MdiIcons.microsoftWord;
    default:
      return MdiIcons.attachment;
  }
}

IconData getIconsForDataSyncMenu(String title) {
  switch (title) {
    case 'Item':
      return MdiIcons.viewListOutline;
    case 'Supplier':
      return MdiIcons.noteCheckOutline;
    case 'Group':
      return MdiIcons.homeGroupPlus;
    case 'Store':
      return MdiIcons.storeCheck;
    case 'Customer':
      return MdiIcons.accountMultipleCheck;
    case 'Menu':
      return MdiIcons.viewGridOutline;
    case 'Master App Authority':
      return MdiIcons.accountCancel;
    case 'App Authority View':
      return MdiIcons.accountCancelOutline;
    case 'Employee Internal View':
      return MdiIcons.eyeCheck;
    default:
      return MdiIcons.cabinAFrame;
  }
}

IconData getIconsForMenu(String title) {
  switch (title) {
    case 'Office Organizer':
      return MdiIcons.officeBuildingCogOutline;
    case 'Human Capital Management':
      return MdiIcons.humanCapacityIncrease;
    case 'Accounts & Financial Management':
      return MdiIcons.finance;
    case 'Purchase':
      return MdiIcons.shoppingOutline;
    case 'Material Management':
      return MdiIcons.tableCog;
    case 'Sales':
      return MdiIcons.sale;
    case 'Garments':
      return MdiIcons.tshirtCrewOutline;
    case 'Woven Garments Management':
      return MdiIcons.tshirtCrewOutline;
    case 'Textiles Process Management':
      return MdiIcons.hanger;
    case 'Production':
      return MdiIcons.archiveArrowDown;
    case 'Fixed Asset':
      return MdiIcons.domain;
    case 'Systems & Settings':
      return MdiIcons.cogOutline;
    case 'Synergy Analytics (SA)':
      return MdiIcons.poll;
    case 'Settings':
      return MdiIcons.cogOutline;
    case 'Security':
      return MdiIcons.security;
    case 'Tools':
      return MdiIcons.tools;
    case 'Quotation':
      return MdiIcons.commentQuoteOutline;
    case 'Merchandising':
      return MdiIcons.handshake;
    case 'Garments Store':
      return MdiIcons.storeCheck;
    case 'PrideCut':
      return MdiIcons.boxCutter;
    case 'Parts Replacement':
      return MdiIcons.fileReplace;
    case 'PridePlan':
      return MdiIcons.lightbulbOn;
    case 'PI Register':
      return MdiIcons.noteEdit;
    case 'Proforma Invoice':
      return MdiIcons.noteText;
    case 'Gatepass Security(IN)':
      return MdiIcons.shieldHome;
    case 'General':
      return MdiIcons.alphaGCircle;
    case 'Process wise Target & Achievement':
      return MdiIcons.stairsBox;
    case 'IE Transaction':
      return MdiIcons.transition;
    case 'IE':
      return MdiIcons.factoryIcon;
    case 'Knitting Garments Management':
      return MdiIcons.needle;
    default:
      return iconData[Random().nextInt(iconData.length)];
  }
}
