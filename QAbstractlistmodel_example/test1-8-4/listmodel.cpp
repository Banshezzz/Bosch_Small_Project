#include "listmodel.h"

#include <QByteArray>
#include <QTimer>
#include <cstdlib>

int ListModel::inc = 1;

ListModel::ListModel(QObject *parent) :
    QAbstractListModel(parent)
{
    m_data
            << Data(ListModel::inc++, "Denmark", "qrc:image/denmark.jpg", 5.6)
            << Data(ListModel::inc++, "Sweden", "qrc:image/sweden.jpg", 9.6)
            << Data(ListModel::inc++, "Iceland", "qrc:image/iceland.jpg", 0.3)
            << Data(ListModel::inc++, "Norway", "qrc:image/norway.jpg", 5.1);
}

bool ListModel::getName(const QString &name)
{
    QVector<Data>::iterator iteV = m_data.begin();
    while(iteV != m_data.end()){
        if(iteV->name == name)
            return true;
        else
            iteV++;
    }
    return false;
}

bool ListModel::getId(const int &id)
{
    QVector<Data>::iterator iteV = m_data.begin();
    while(iteV != m_data.end()){
        if(iteV->id == id)
            return true;
        else
            iteV++;
    }
    return false;
}

bool ListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!hasIndex(index.row(), index.column(), index.parent()) || !value.isValid())
        return false;

    Data &item = m_data[index.row()];
    if (role == NameRole)
        item.name = value.toString();
    else if
            (role == FlagRole) item.flag = "file:/" + value.toString();
    else if
            (role == PopulationRole) item.population = value.toDouble();
    else
        return false;

    emit dataChanged(index, index, { role } );
    return true ;
}

int ListModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;

    return m_data.count();
}

QVariant ListModel::data(const QModelIndex &index, int role) const
{
    if ( !index.isValid() )
        return QVariant();

    const Data &data = m_data.at(index.row());
    if ( role == IDRole ){
        return data.id;
    }
    else if ( role == NameRole ){
        return data.name;
    }
    else if ( role == FlagRole )
        return data.flag;
    else if ( role == PopulationRole )
        return data.population;
    else
        return QVariant();
}

QHash<int, QByteArray> ListModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {IDRole, "id"},
        {NameRole, "name"},
        {FlagRole, "flag"},
        {PopulationRole, "population"}
    };
    return mapping;
}

void ListModel::removeData(int row)
{
    beginRemoveRows(QModelIndex(), row, row);
    m_data.removeAt(row);
    removeRow(row, QModelIndex());
    endRemoveRows();
}

void ListModel::addData(const QString &name, const QString &flag, double population)
{
    addData(Data(ListModel::inc++, name, flag, population));
}

void ListModel::addData(const Data &data)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_data << data;
    endInsertRows();
}

