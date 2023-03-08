#pragma once

#include "{_INCLUDE_}"
#include "messages/i_msg.h"

namespace msg
{

class {_MSG_CLASS_NAME_} : public ::msg::IMsg
{
public:
  const char* MsgName() const { return "{_MSG_CLASS_NAME_}"; }

private:
  {_DATA_TYPE_} data{};
};

}       //msg
