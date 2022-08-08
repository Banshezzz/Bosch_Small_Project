#ifndef MYMODEL_H
#define MYMODEL_H

#include <QAbstractListModel>
#include <QColor>

struct Data {
    Data() {}
    Data( int id, const QString& name, const QString& flag, double population )
        : id(id) ,name(name), flag(flag), population(population) {}

    int id;
    QString name, flag;
    double population;
};

class ListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    static int inc;
    enum Roles {
        IDRole,
        NameRole = Qt::UserRole + 1,
        FlagRole,
        PopulationRole
    };
    explicit ListModel(QObject *parent = nullptr);

    Q_INVOKABLE bool getName(const QString &name);
    Q_INVOKABLE bool getId(const int &id);
    //    Q_INVOKABLE QString updateName(const int &id);
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data( const QModelIndex& index, int role = Qt::DisplayRole ) const override;
    QHash<int, QByteArray> roleNames() const override;


    Q_INVOKABLE void removeData(int row);
    Q_INVOKABLE void addData(const QString& name, const QString& flag, double population);
    void addData(const Data &data);

private: //members
    QVector<Data> m_data;
};

#endif // MYMODEL_H
