#ifndef TEXT_H
#define TEXT_H

#include <QObject>

class Text : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString textL READ textL WRITE setTextL NOTIFY textLChanged)
    Q_PROPERTY(QString textS READ textS WRITE setTextS NOTIFY textSChanged)
public:
    explicit Text(QObject *parent = nullptr);

    QString textL();
    QString textS();

public slots:
    void setTextL(const QString textL);
    void setTextS(const QString textS);

signals:
    void textLChanged();
    void textSChanged();

private:
    QString m_textL, m_textS;
    static int n, m;
};

#endif // TEXT_H
