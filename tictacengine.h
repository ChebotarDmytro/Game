#ifndef TICTACENGINE_H
#define TICTACENGINE_H

#include <QObject>
#include <QDebug>
#include <QMap>
#include <QString>

class TicTacEngine : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QString image READ image WRITE setImage NOTIFY ImageChanged)
  Q_PROPERTY(QString champion READ getChampion )
  Q_PROPERTY(QString state READ getState )

  enum TicTacStatus
  {
    None = 0, Cross, Zero, Draw
  };

  static const int rowBoard = 3;
  static const int columnBoard = 3;

  const QString zero =  "o.png";
  const QString cross = "x.png";

  int board[rowBoard][columnBoard];

  QMap<int, QString> ImageBoard;

  QString Champion;

  QString NextImage;

  TicTacStatus Current;

  int getlogic = false;

  TicTacStatus getWining() const;


public:

  explicit TicTacEngine(QObject *parent = nullptr);

  void initGame();

  QString image() const;

  void setImage(const QString&);

  const QString getChampion();

  const QString getState() const;


public Q_SLOTS:

  void slotGamerMoved(const int row, const int column);

  void reset(const QVariant&);

Q_SIGNALS:
  void ImageChanged();


};

#endif // TICTACENGINE_H
