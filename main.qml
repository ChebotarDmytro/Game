/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4

Item
{

    id: button
    width:  400
    height: 530

    signal qmlSignal(var anObject)

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            button.qmlSignal(button)

        }
    }
    Rectangle
    {
    width: 400
    height: 530
    color: "#e0d420"
    gradient: Gradient {
        GradientStop {
            position: 0.94;
            color: "#e0d420";
        }
        GradientStop {
            position: 1.00;
            color: "#ffffff";
        }
    }
    border.color: "#20c2e6"

    //------------Top State---------------

    Rectangle
    {
        x: 0
        y: 0
        width: 200
        height: 45
        color: "#9e8080"

        Text
        {
            font.family: "Helvetica"
            font.pointSize: 14
            color: "#ffffff"
            anchors.centerIn: parent
            text: "Champion:"

        }
    }

    Rectangle
    {
        x: 200
        y: 0
        width: 200
        height: 45
        color: "#9e8080"

        Text
        {
            id: winnerText
            font.family: "Helvetica"
            font.pointSize: 14
            color: "white"
            anchors.centerIn: parent
            text: ""

        }
    }

    //--------------Button State------------------

    Rectangle
    {
        x: 0
        y: 455
        width: 200
        height: 75
        color: "#e29e0b"

        Text
        {
            font.family: "Helvetica"
            font.pointSize: 14
            color: "#ffffff"
            anchors.centerIn: parent
            text: "State:"

        }
    }

    Rectangle
    {
        x: 200
        y: 455
        width: 200
        height: 75
        color: "#daec0a"

        Text
        {
            id: winnerText2
            font.family: "Helvetica"
            font.pointSize: 14
            color: "red"
            anchors.centerIn: parent
            text: ""

        }
    }

    //-------------Grid-------------------

    Grid
    {

        x: 0
        y: 50
        columns: 3
        rows: 3
        spacing: 5

        Rectangle
        {
            objectName: "rect1"
            id: rect1
            color: "steelblue"
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image1
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect1
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(0, 0)
                    image1.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state                   
                }
            }
        }

        Rectangle
        {
            id: rect2
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image2
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect2
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(0, 1)
                    image2.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }

        Rectangle
        {
            id: rect3
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image3
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect3
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(0, 2)
                    image3.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }

        Rectangle
        {
            id: rect4
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image4
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect4
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(1, 0)
                    image4.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }

        Rectangle
        {
            id: rect5
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image5
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect5
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(1, 1)
                    image5.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }

        Rectangle
        {
            id: rect6
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image6
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect6
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(1, 2)
                    image6.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }

        Rectangle
        {
            id: rect7
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image7
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect7
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(2, 0)
                    image7.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }

        Rectangle
        {
            id: rect8
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image8
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect8
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(2, 1)
                    image8.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }

        Rectangle
        {
            id: rect9
            color: "steelblue";
            width: 130;
            height: 130;
            radius: 8

            Image
            {
                id: image9
                width: 130; height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.centerIn: rect9
            }

            ///get mouse control
            MouseArea
            {
                anchors.fill: parent; hoverEnabled: true
                onClicked:
                {
                    _myClass.slotGamerMoved(2, 2)
                    image9.source = _myClass.image
                    winnerText.text = _myClass.champion
                    winnerText2.text = _myClass.state
                }
            }
        }
    }
  }
}
