#include "text.h"
#include <QDebug>

Text::Text(QObject *parent)
    : QObject{parent}
{
    if(n == 3)
        m_textL = "Start";
    else if (n == 2)
        m_textL = "Favorite";
    else if (n == 1)
    {
        m_textL = "Setting";
        n = 4;
    }
    if(m == 3)
        m_textS = "This is the first page";
    else if (m == 2)
        m_textS = "This is the second page";
    else if (m == 1)
    {
        m_textS = "This is the third page";
        m = 4;
    }

    if(n != 1)
        n--;
    if(m != 1)
        m--;
}

int Text::n = 3;
int Text::m = 3;

QString Text::textL()
{
    qDebug() << m_textL;
    return m_textL;
}

QString Text::textS()
{
    qDebug() << m_textS;
    return m_textS;
}

void Text::setTextL(const QString textL)
{
    if (textL == m_textL)
        return;

    m_textL = textL;
    emit textLChanged();
}

void Text::setTextS(QString textS)
{
    if (textS == m_textS)
        return;

    m_textS = textS;
    emit textSChanged();
}
