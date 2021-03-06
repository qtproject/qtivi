/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Copyright (C) 2019 Luxoft Sweden AB
** Copyright (C) 2018 Pelagicore AG
** Contact: https://www.qt.io/licensing/
**
** This file is part of the QtIvi module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or (at your option) the GNU General
** Public license version 3 or any later version approved by the KDE Free
** Qt Foundation. The licenses are as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-2.0.html and
** https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QIVIPLAYQUEUE_P_H
#define QIVIPLAYQUEUE_P_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail. This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include "private/qtivimediaglobal_p.h"
#include "private/qabstractitemmodel_p.h"

#include "qiviplayqueue.h"
#include "qiviplayableitem.h"
#include "qivimediaplayer_p.h"

QT_BEGIN_NAMESPACE

class Q_QTIVIMEDIA_EXPORT QIviPlayQueuePrivate : public QAbstractItemModelPrivate
{
public:
    QIviPlayQueuePrivate(QIviMediaPlayer *player, QIviPlayQueue *model);
    ~QIviPlayQueuePrivate();

    void initialize();
    void onInitializationDone();
    void onCurrentIndexChanged(int currentIndex);
    void onCanReportCountChanged(bool canReportCount);
    void onDataFetched(const QUuid &identifier, const QList<QVariant> &items, int start, bool moreAvailable);
    void onCountChanged(int new_length);
    void onDataChanged(const QList<QVariant> &data, int start, int count);
    void onFetchMoreThresholdReached();
    void resetModel();
    void clearToDefaults();
    const QIviPlayableItem *itemAt(int i) const;

    QIviMediaPlayerBackendInterface *playerBackend() const;

    QIviPlayQueue * const q_ptr;
    Q_DECLARE_PUBLIC(QIviPlayQueue)

    QIviMediaPlayer *m_player;
    QUuid m_identifier;
    int m_currentIndex;
    int m_chunkSize;
    QList<QVariant> m_itemList;
    bool m_moreAvailable;
    int m_fetchMoreThreshold;
    int m_fetchedDataCount;
    bool m_canReportCount;
    QIviPlayQueue::LoadingType m_loadingType;
};

QT_END_NAMESPACE

#endif // QIVIPLAYQUEUE_P_H
