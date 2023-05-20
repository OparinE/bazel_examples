#pragma once

namespace msg
{

class IMsg
{
  public:
    virtual ~IMsg() = default;
    virtual const char* MsgName() const = 0;
};

}       //msg
