#pragma once

#include <QObject>

class ViewState : public QObject
{
	Q_OBJECT
public:
	enum State {
		Main,
		Conference,
		Conferences,
		Events,
		Recordings,
		Settings
	};
	Q_ENUMS(State)
};
