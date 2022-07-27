#include "image.h"

#include <QDebug>

Image::Image(QObject *parent)
    : QObject{parent}
{
    m_Url_detail = "qrc:/image/pic2.jpg";
    m_Url_noWifi = "qrc:/image/no_wifi.png";
    m_Url_clock = "qrc:/image/clock.png";
    m_Url_more = "qrc:/image/more.png";
    m_Url_menu1 = "qrc:/image/menu1.jpg";
    m_Url_menu2 = "qrc:/image/menu2.jpg";
    m_Url_menu3 = "qrc:/image/menu3.jpg";
}

QString Image::Url_detail()
{
    return m_Url_detail;
}

// Return funcs
QString Image::Url_noWifi()
{
    return m_Url_noWifi;
}

QString Image::Url_clock()
{
    return m_Url_clock;
}

QString Image::Url_more()
{
    return m_Url_more;
}

QString Image::Url_menu1()
{
    return m_Url_menu1;
}

QString Image::Url_menu2()
{
    return m_Url_menu2;
}

QString Image::Url_menu3()
{
    return m_Url_menu3;
}

void Image::setUrl_detail(const QString Url)
{
    if(Url == m_Url_detail)
        return;

    m_Url_detail = Url;
    emit Url_detailChanged();
}

//Slots
void Image::setUrl_noWifi(const QString Url)
{
    if(Url == m_Url_noWifi)
        return;

    m_Url_noWifi = Url;
    emit Url_noWifiChanged();
}

void Image::setUrl_clock(const QString Url)
{
    if(Url == m_Url_clock)
        return;

    m_Url_clock = Url;
    emit Url_clockChanged();
}

void Image::setUrl_more(const QString Url)
{
    if(Url == m_Url_more)
        return;

    m_Url_more = Url;
    emit Url_moreChanged();
}

void Image::setUrl_menu1(const QString Url)
{
    if(Url == m_Url_menu1)
        return;

    m_Url_menu1 = Url;
    emit Url_menu1Changed();
}

void Image::setUrl_menu2(const QString Url)
{
    if(Url == m_Url_menu2)
        return;

    m_Url_menu2 = Url;
    emit Url_menu2Changed();
}

void Image::setUrl_menu3(const QString Url)
{
    if(Url == m_Url_menu3)
        return;

    m_Url_menu3 = Url;
    emit Url_menu3Changed();
}
