#ifndef IMAGE_H
#define IMAGE_H

#include <QObject>

class Image : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString Url_detail READ Url_detail WRITE setUrl_detail NOTIFY Url_detailChanged)
    Q_PROPERTY(QString Url_noWifi READ Url_noWifi WRITE setUrl_noWifi NOTIFY Url_noWifiChanged)
    Q_PROPERTY(QString Url_clock READ Url_clock WRITE setUrl_clock NOTIFY Url_clockChanged)
    Q_PROPERTY(QString Url_more READ Url_more WRITE setUrl_more NOTIFY Url_moreChanged)
    Q_PROPERTY(QString Url_menu1 READ Url_menu1 WRITE setUrl_menu1 NOTIFY Url_menu1Changed)
    Q_PROPERTY(QString Url_menu2 READ Url_menu2 WRITE setUrl_menu2 NOTIFY Url_menu2Changed)
    Q_PROPERTY(QString Url_menu3 READ Url_menu3 WRITE setUrl_menu3 NOTIFY Url_menu3Changed)
public:
    explicit Image(QObject *parent = nullptr);
    QString Url_detail();
    QString Url_noWifi();
    QString Url_clock();
    QString Url_more();
    QString Url_menu1();
    QString Url_menu2();
    QString Url_menu3();

public slots:
    void setUrl_detail(const QString Url);
    void setUrl_noWifi(const QString Url);
    void setUrl_clock(const QString Url);
    void setUrl_more(const QString Url);
    void setUrl_menu1(const QString Url);
    void setUrl_menu2(const QString Url);
    void setUrl_menu3(const QString Url);

signals:
    void Url_detailChanged();
    void Url_noWifiChanged();
    void Url_clockChanged();
    void Url_moreChanged();
    void Url_menu1Changed();
    void Url_menu2Changed();
    void Url_menu3Changed();

private:
    QString m_Url_detail, m_Url_noWifi, m_Url_clock, m_Url_more, m_Url_menu1, m_Url_menu2, m_Url_menu3;
};

#endif // IMAGE_H
