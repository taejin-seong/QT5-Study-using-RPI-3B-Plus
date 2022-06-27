#include "phonebook.h"

Phonebook::Phonebook(QObject *parent)
    :QObject(parent),
      m_name("")
{

}

Phonebook::~Phonebook()
{

}

void Phonebook::setName(const QString &name)
{
    if(name != m_name){
        m_name = name;
        emit this->nameChanged();
    }
}

QString Phonebook::name() const
{
    return m_name;
}
