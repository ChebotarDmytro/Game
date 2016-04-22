#include "tictacengine.h"


TicTacEngine::TicTacEngine(QObject *parent)
  : QObject(parent), Champion(), NextImage()
{
  initGame();
}

void TicTacEngine::initGame()
{
  for(auto i = 0; i < rowBoard; ++i)
    {
          for(auto j = 0; j < columnBoard; ++j)
            {
                  board[i][j] = None;
            }
    }

  ImageBoard[None]  = "";
  ImageBoard[Cross] = zero;
  ImageBoard[Zero]  = cross;

}

QString TicTacEngine::image() const
{
  return NextImage;
}

void TicTacEngine::setImage(const QString &image)
{
  if(image != NextImage)
    {
      NextImage = image;
      emit ImageChanged();
    }
}

void TicTacEngine::slotGamerMoved(const int row, const int column)
{
  if(None != getWining())
    return;

  qDebug () << Q_FUNC_INFO << row << column;

  if(row > rowBoard || column > columnBoard)
  {
          Q_ASSERT(NULL);
          return;
  }

  if(board[row][column] != None)
    {

    } else if(Zero == Current)
    {
           Current = Cross;
           board[row][column] = Cross;
    } else
    {
      Current = Zero;
      board[row][column] = Zero;
    }

  NextImage = ImageBoard[board[row][column]];

  Champion = getChampion();
}

TicTacEngine::TicTacStatus TicTacEngine::getWining() const
{

  // horizontal
  if((board[0][0] == board[0][1]) && (board[0][0] == board[0][2]))
          return static_cast<TicTacEngine::TicTacStatus>(board[0][1]);

  if((board[1][0] == board[1][1]) && (board[1][0] == board[1][2]))
          return static_cast<TicTacEngine::TicTacStatus>(board[1][0]);

  if((board[2][0] == board[2][1]) && (board[2][0] == board[2][2]))
          return static_cast<TicTacEngine::TicTacStatus>(board[2][0]);

  // vertical
  if((board[0][0] == board[1][0]) && (board[0][0] == board[2][0]))
          return static_cast<TicTacEngine::TicTacStatus>(board[0][0]);

  if((board[0][1] == board[1][1]) && (board[0][1] == board[2][1]))
          return static_cast<TicTacEngine::TicTacStatus>(board[0][1]);

  if((board[0][2] == board[1][2]) && (board[0][2] == board[2][2]))
          return static_cast<TicTacEngine::TicTacStatus>(board[0][2]);


  // diagonal
  if((board[0][0] == board[1][1]) && (board[0][0] == board[2][2]))
          return static_cast<TicTacEngine::TicTacStatus>(board[0][0]);

  if((board[0][2] == board[1][1]) && (board[0][2] == board[2][0]))
          return static_cast<TicTacEngine::TicTacStatus>(board[0][2]);

  // verification draws
  int count = 0;
      for(auto i = 0; i < rowBoard; i++)
        {
              for(auto j = 0; j < columnBoard; j++)
                {
                      if(board[i][j] != None)
                        {
                          count++;
                        }
                }
        }

    if(count == 9)
      return Draw;

  return None;
}

const QString TicTacEngine::getChampion()
{
  TicTacEngine::TicTacStatus champion = getWining();

  // Processing end of the game

        switch(champion)
        {
        case None:
           return QString("");
            break;

        case Cross:
            getlogic = true;
            return QString("Gamer 2");
            break;

        case Zero:
            getlogic = true;
            return QString("Gamer 1");
            break;

        case Draw:
            getlogic = true;
            return QString("Draw!");
            break;

        default:
            return QString("Error!");
        }


}

const QString TicTacEngine::getState() const
{
  if(getlogic)
    {
      return QString("Touch reset");
    }
  return QString("");
}

void TicTacEngine::reset(const QVariant &v)
{
       qDebug() << "Called the C++ slot with value:" << v;

       for(auto i = 0; i < rowBoard; ++i)
                 for(auto j = 0; j < columnBoard; ++j)
                     board[i][j] = 0;
}


