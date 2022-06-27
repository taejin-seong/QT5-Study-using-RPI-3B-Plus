#ifndef PHONEBOOK_H
#define PHONEBOOK_H
#include <QObject>

class Phonebook: public QObject{
    Q_OBJECT
public:
    explicit Phonebook(QObject *parent = nullptr);
    virtual ~Phonebook();

    Q_INVOKABLE void setName(const QString &name);
    Q_INVOKABLE QString name() const;

signals:
    void nameChanged();

private:
    QString m_name;
};

#endif // PHONEBOOK_H
