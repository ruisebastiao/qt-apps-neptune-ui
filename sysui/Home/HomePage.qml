/****************************************************************************
**
** Copyright (C) 2016 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Neptune IVI UI.
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Layouts 1.0

import controls 1.0
import utils 1.0
import service.music 1.0
import QtApplicationManager 1.0

UIPage {
    id: root

    anchors.top: parent.top
    anchors.bottom: parent.bottom

    property bool leftMap: true

    // Left widget side
    MapWidget {
        id: mapWidget
        anchors.top: parent.top
        anchors.left: root.leftMap ? parent.left : parent.horizontalCenter
        width: root.width/2
        vspan: 20
    }

    // Right widget side
    MusicWidget {
        anchors.bottom: hDiv.top
        anchors.left: hDiv.left
        width: root.width/2 - Style.hspan(1)

        onShowFullscreen: {
                ApplicationManager.startApplication(MusicService.defaultMusicApp)
        }
    }

    HDiv {
        id: hDiv

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: root.leftMap ? parent.horizontalCenter : parent.left
        anchors.leftMargin: Style.hspan(1)
    }

    PhoneWidget {
        anchors.top: hDiv.bottom
        anchors.left: hDiv.left
        width: root.width/2 - Style.hspan(1)
    }
}
